!z::HideOrShowDesktopIcons()                                            ; 定义热键Alt+Z触发的函数
return       ; 返回
!l::HideOrShowDesktopIcons()                                            ; 定义热键Alt+L触发的函数
return       ; 返回

HideOrShowDesktopIcons()                                              ; 定义函数
{
    ControlGet, class, Hwnd,, SysListView321, ahk_class Progman       ; 获取桌面窗口句柄
    If class                                                        ; 判断是否成功获取到类名或句柄
    {
        If DllCall("IsWindowVisible", UInt,class)                    ; 判断是否为可见窗口
            WinHide, ahk_id %class%                                     ; 隐藏窗口
        Else                                                                ; 否则
            WinShow, ahk_id %class%                                     ; 显示窗口
    }
    Else
    {
        ControlGet, class, Hwnd,, SysListView321, ahk_class WorkerW    ; 尝试获取另一种类型的桌面窗口句柄
        If class                                                        ; 判断是否成功获取到类名或句柄
        {
            If DllCall("IsWindowVisible", UInt,class)                    ; 判断是否为可见窗口
                WinHide, ahk_id %class%                                     ; 隐藏窗口
            Else                                                                ; 否则
                WinShow, ahk_id %class%                                     ; 显示窗口
        }
    }
}
