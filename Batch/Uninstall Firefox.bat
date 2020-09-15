taskkill.exe /f /im firefox.exe

IF EXIST "%ProgramFiles%\Mozilla Firefox\uninstall\helper.exe" "%ProgramFiles%\Mozilla Firefox\uninstall\helper.exe" -ms

IF EXIST "%ProgramFiles(x86)%\Mozilla Firefox\uninstall\helper.exe" "%ProgramFiles(x86)%\Mozilla Firefox\uninstall\helper.exe" -ms

IF EXIST "%ProgramFiles%\Mozilla Firefox\uninstall\helper.exe" "%ProgramFiles%\Mozilla Firefox\uninstall\helper.exe" /s

IF EXIST "%ProgramFiles(x86)%\Mozilla Firefox\uninstall\helper.exe" "%ProgramFiles(x86)%\Mozilla Firefox\uninstall\helper.exe" /s