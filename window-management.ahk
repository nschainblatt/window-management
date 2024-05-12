ToggleApp(appPath, winClass, partialTitle := "") ; default partialTitle to empty if not provided
{
    windowCriteria := winClass
    if (partialTitle != "")
        windowCriteria .= " ahk_exe " . partialTitle
    
    IfWinExist, %windowCriteria%
    {
        WinActivate
        WinWaitActive
        Send, {LWin down}{Up down}{LWin up}{Up up} ; Maximizes the window
    }
    else
    {
        Run, %appPath%
        WinWait, %windowCriteria%
        WinActivate
        WinWaitActive
    }
}

; Toggle Google Chrome
^!g::ToggleApp("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Google Chrome.lnk", "ahk_class Chrome_WidgetWin_1")
return

; Toggle Windows Terminal
^!t::ToggleApp("wt.exe", "ahk_class CASCADIA_HOSTING_WINDOW_CLASS")
return

; Toggle SourceTree
^!s::ToggleApp("C:\Users\Nate\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Atlassian\Sourcetree.lnk", "ahk_class WindowClassSourceTree")
return

; Toggle Git Bash
^!b::ToggleApp("C:\\Program Files\\Git\\git-bash.exe", "ahk_class ConsoleWindowClass", "Git Bash")
return

; Toggle IntelliJ IDEA
^!i::ToggleApp("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\JetBrains\IntelliJ IDEA 2023.2.5.lnk", "ahk_class SunAwtFrame", "IntelliJ IDEA")
return
