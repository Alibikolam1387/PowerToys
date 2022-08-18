#include "pch.h"

#include "BoundsToolOverlayUI.h"
#include "MeasureToolOverlayUI.h"
#include "OverlayUIDrawing.h"

#include <common/Display/dpi_aware.h>
#include <common/Display/monitors.h>
#include <common/utils/window.h>
#include <common/logger/logger.h>
#include <common/Themes/windows_colors.h>

namespace NonLocalizable
{
    const wchar_t MeasureToolOverlayWindowName[] = L"PowerToys.MeasureToolOverlayWindow";
    const wchar_t BoundsToolOverlayWindowName[] = L"PowerToys.BoundsToolOverlayWindow";
}

//#define DEBUG_OVERLAY

void SetClipBoardToText(const std::wstring_view text)
{
    if (!OpenClipboard(nullptr))
    {
        return;
    }

    wil::unique_hglobal handle{ GlobalAlloc(GMEM_MOVEABLE, static_cast<size_t>((text.length() + 1) * sizeof(wchar_t))) };
    if (!handle)
    {
        CloseClipboard();
        return;
    }

    if (auto* bufPtr = static_cast<wchar_t*>(GlobalLock(handle.get())); bufPtr != nullptr)
    {
        text.copy(bufPtr, text.length());
        GlobalUnlock(handle.get());
    }

    EmptyClipboard();
    SetClipboardData(CF_UNICODETEXT, handle.get());
    CloseClipboard();
}

LRESULT CALLBACK measureToolWndProc(HWND window, UINT message, WPARAM wparam, LPARAM lparam) noexcept
{
    const auto closeWindow = [&] {
        PostMessageW(window, WM_CLOSE, {}, {});
    };

    switch (message)
    {
    case WM_DESTROY:
    case WM_CLOSE:
        DestroyWindow(window);
        break;
    case WM_KEYUP:
        if (wparam == VK_ESCAPE)
        {
            closeWindow();
        }
        break;
    case WM_RBUTTONUP:
        closeWindow();
        break;
    case WM_LBUTTONUP:
        // TODO: fix
        //SetClipBoardToText(measureStringBuf);
        break;
    case WM_ERASEBKGND:
        return 1;
    case WM_CREATE:
#if !defined(DEBUG_OVERLAY)
        for (; ShowCursor(false) > 0;)
            ;
#endif
        break;
    }

    return DefWindowProcW(window, message, wparam, lparam);
}

LRESULT CALLBACK boundsToolWndProc(HWND window, UINT message, WPARAM wparam, LPARAM lparam) noexcept
{
    static BoundsToolState* toolState = nullptr;

    const auto closeWindow = [&] {
        PostMessageW(window, WM_CLOSE, {}, {});
    };

    switch (message)
    {
    case WM_DESTROY:
    case WM_CLOSE:
        DestroyWindow(window);
        break;
    case WM_CREATE:
        toolState = reinterpret_cast<BoundsToolState*>(reinterpret_cast<CREATESTRUCT*>(lparam)->lpCreateParams);
        break;
    case WM_KEYUP:
        if (wparam == VK_ESCAPE)
        {
            closeWindow();
        }
        break;
    case WM_LBUTTONDOWN:
    {
        POINT cursorPos = {};
        GetCursorPos(&cursorPos);
        ScreenToClient(window, &cursorPos);

        D2D_POINT_2F newRegionStart = { .x = static_cast<float>(cursorPos.x), .y = static_cast<float>(cursorPos.y) };
        toolState->currentRegionStart = newRegionStart;
        break;
    }
    case WM_LBUTTONUP:
        if (toolState->currentRegionStart.has_value())
        {
            POINT cursorPos = {};
            GetCursorPos(&cursorPos);
            ScreenToClient(window, &cursorPos);
            D2D_POINT_2F newRegionEnd = { .x = static_cast<float>(cursorPos.x), .y = static_cast<float>(cursorPos.y) };
            toolState->currentRegionStart = std::nullopt;

            // TODO: fix
            //SetClipBoardToText(measureStringBuf);
        }
        break;
    case WM_RBUTTONUP:
        closeWindow();
        break;
    case WM_ERASEBKGND:
        return 1;
    }

    return DefWindowProcW(window, message, wparam, lparam);
}

void CreateOverlayWindowClasses()
{
    WNDCLASSEXW wcex{ .cbSize = sizeof(WNDCLASSEX), .hInstance = GetModuleHandleW(nullptr) };
    wcex.lpfnWndProc = measureToolWndProc;
    wcex.lpszClassName = NonLocalizable::MeasureToolOverlayWindowName;
    RegisterClassExW(&wcex);

    wcex.lpfnWndProc = boundsToolWndProc;
    wcex.lpszClassName = NonLocalizable::BoundsToolOverlayWindowName;
    wcex.hCursor = LoadCursorW(nullptr, IDC_CROSS);

    RegisterClassExW(&wcex);
}

HWND CreateOverlayUIWindow(CommonState& commonState, const wchar_t* windowClass, void* extraParam)
{
    static std::once_flag windowClassesCreatedFlag;
    std::call_once(windowClassesCreatedFlag, CreateOverlayWindowClasses);

    int left = {}, top = {};
    int width = {}, height = {};

    MONITORINFO monitorInfo = { .cbSize = sizeof(monitorInfo) };
    if (GetMonitorInfoW(commonState.monitor, &monitorInfo))
    {
        left = monitorInfo.rcWork.left;
        top = monitorInfo.rcWork.top;
        width = monitorInfo.rcWork.right - monitorInfo.rcWork.left;
        height = monitorInfo.rcWork.bottom - monitorInfo.rcWork.top;
    }

    HWND window{ CreateWindowExW(WS_EX_TOOLWINDOW,
                                 windowClass,
                                 L"PowerToys.MeasureToolOverlay",
                                 WS_POPUP,
                                 left,
                                 top,
                                 width,
                                 height,
                                 nullptr,
                                 nullptr,
                                 GetModuleHandleW(nullptr),
                                 extraParam) };
    winrt::check_bool(window);
    ShowWindow(window, SW_SHOWNORMAL);
#if !defined(DEBUG_OVERLAY)
    SetWindowPos(window, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE | SWP_NOSIZE);
#else
    (void)window;
#endif

    int const pos = -GetSystemMetrics(SM_CXVIRTUALSCREEN) - 8;
    if (wil::unique_hrgn hrgn{ CreateRectRgn(pos, 0, (pos + 1), 1) })
    {
        DWM_BLURBEHIND bh = { DWM_BB_ENABLE | DWM_BB_BLURREGION, TRUE, hrgn.get(), FALSE };
        DwmEnableBlurBehindWindow(window, &bh);
    }

    RECT windowRect = {};
    if (GetWindowRect(window, &windowRect))
    {
        // will be freed during SetWindowRgn call
        const HRGN windowRegion{ CreateRectRgn(windowRect.left, windowRect.top, windowRect.right, windowRect.bottom) };
        wil::unique_hrgn toolbarRegion{ CreateRectRgn(commonState.toolbarBoundingBox.left,
                                                      commonState.toolbarBoundingBox.top,
                                                      commonState.toolbarBoundingBox.right,
                                                      commonState.toolbarBoundingBox.bottom) };
        const auto res = CombineRgn(windowRegion, windowRegion, toolbarRegion.get(), RGN_DIFF);
        if (res != ERROR)
            SetWindowRgn(window, windowRegion, true);
    }

    return window;
}

std::vector<D2D1::ColorF> AppendCommonOverlayUIColors(const D2D1::ColorF lineColor)
{
    D2D1::ColorF foreground = D2D1::ColorF::Black;
    D2D1::ColorF background = D2D1::ColorF(0.96f, 0.96f, 0.96f, 1.0f);
    D2D1::ColorF border = D2D1::ColorF(0.44f, 0.44f, 0.44f, 0.4f);

    if (WindowsColors::is_dark_mode())
    {
        foreground = D2D1::ColorF::White;
        background = D2D1::ColorF(0.17f, 0.17f, 0.17f, 1.0f);
        border = D2D1::ColorF(0.44f, 0.44f, 0.44f, 0.4f);
    }

    return { lineColor, foreground, background, border };
}

void OverlayUIState::RunUILoop()
{
    while (IsWindow(_window))
    {
        _d2dState.rt->BeginDraw();
        _d2dState.rt->Clear(D2D1::ColorF(1.f, 1.f, 1.f, 0.f));
        //const bool cursorOverToolbar = PtInRect(&commonState.toolbarBoundingBox, mts.cursorPos);
        //if (!cursorOverToolbar)
        _tickFunc();
        _d2dState.rt->EndDraw();
        InvalidateRect(_window, nullptr, true);
        run_message_loop(true);
    }
}

OverlayUIState::OverlayUIState(BoundsToolState& toolState,
                               CommonState& commonState,
                               HWND window) :
    _window{ window },
    _d2dState{ window, AppendCommonOverlayUIColors(commonState.lineColor) },
    _tickFunc{ [this, &toolState] {
        DrawBoundsToolTick(toolState, _window, _d2dState);
    } }
{
}

OverlayUIState::OverlayUIState(MeasureToolState& toolState,
                               CommonState& commonState,
                               HWND window) :
    _window{ window },
    _d2dState{ window, AppendCommonOverlayUIColors(commonState.lineColor) }
{
    _tickFunc = {
        [=, &toolState] {
            DrawMeasureToolTick(toolState,
                                _window,
                                _d2dState);
        }
    };
}

OverlayUIState::~OverlayUIState()
{
    PostMessageW(_window, WM_CLOSE, {}, {});

    while (IsWindow(_window))
    {
        Sleep(20);
    }
}

template<typename ToolT>
inline std::unique_ptr<OverlayUIState> OverlayUIState::CreateInternal(ToolT& toolState,
                                                                      CommonState& commonState,
                                                                      const wchar_t* toolWindowClassName)
{
    wil::shared_event uiCreatedEvent(wil::EventOptions::ManualReset);
    std::unique_ptr<OverlayUIState> uiState;
    SpawnLoggedThread(L"OverlayUI thread", [&] {
        const HWND window = CreateOverlayUIWindow(commonState, toolWindowClassName, &toolState);
        uiState = std::unique_ptr<OverlayUIState>{ new OverlayUIState{ toolState, commonState, window } };

        uiCreatedEvent.SetEvent();

        uiState->RunUILoop();
        commonState.sessionCompletedCallback();
    });

    uiCreatedEvent.wait();

    return uiState;
}

std::unique_ptr<OverlayUIState> OverlayUIState::Create(MeasureToolState& toolState,
                                                       CommonState& commonState)
{
    return OverlayUIState::CreateInternal(toolState, commonState, NonLocalizable::MeasureToolOverlayWindowName);
}

std::unique_ptr<OverlayUIState> OverlayUIState::Create(BoundsToolState& toolState,
                                                       CommonState& commonState)
{
    return OverlayUIState::CreateInternal(toolState, commonState, NonLocalizable::BoundsToolOverlayWindowName);
}