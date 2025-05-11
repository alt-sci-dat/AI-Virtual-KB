!include "MUI2.nsh"

Name "AI Virtual Keyboard"
OutFile "dist/AI_Virtual_Keyboard_Setup.exe"
InstallDir "$PROGRAMFILES\AI Virtual Keyboard"
RequestExecutionLevel admin

!define MUI_ABORTWARNING

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

!insertmacro MUI_LANGUAGE "English"

Section "Install"
    SetOutPath "$INSTDIR"
    File "dist\AI_Virtual_Keyboard.exe"
    
    CreateDirectory "$SMPROGRAMS\AI Virtual Keyboard"
    CreateShortCut "$SMPROGRAMS\AI Virtual Keyboard\AI Virtual Keyboard.lnk" "$INSTDIR\AI_Virtual_Keyboard.exe"
    CreateShortCut "$DESKTOP\AI Virtual Keyboard.lnk" "$INSTDIR\AI_Virtual_Keyboard.exe"
    
    WriteUninstaller "$INSTDIR\uninstall.exe"
    
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\AI_Virtual_Keyboard" \
                     "DisplayName" "AI Virtual Keyboard"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\AI_Virtual_Keyboard" \
                     "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
SectionEnd

Section "Uninstall"
    Delete "$INSTDIR\AI_Virtual_Keyboard.exe"
    Delete "$INSTDIR\uninstall.exe"
    
    Delete "$SMPROGRAMS\AI Virtual Keyboard\AI Virtual Keyboard.lnk"
    RMDir "$SMPROGRAMS\AI Virtual Keyboard"
    Delete "$DESKTOP\AI Virtual Keyboard.lnk"
    
    RMDir "$INSTDIR"
    
    DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\AI_Virtual_Keyboard"
SectionEnd 