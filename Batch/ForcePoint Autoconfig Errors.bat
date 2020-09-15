setlocal ENABLEEXTENSIONS
set KEY_NAME="HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
set VALUE_NAME=AutoConfigURL

FOR /F "usebackq skip=1 tokens=1-3" %%A IN (`REG QUERY %KEY_NAME% /v %VALUE_NAME% 2^>nul`) DO (
    set ValueName=%%A
    set ValueType=%%B    
    set ValueValue=%%C
)

@echo Value Name = %ValueName%
@echo Value Type = %ValueType%
@echo Value Value = %ValueValue%

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v AutoConfigURL /t REG_SZ /d "" /f
echo Proxy Disabled
)
