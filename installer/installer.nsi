# Nsis Installer Executable for myself written tools for windows
# Credit Shadowdara

!include "LogicLib.nsh"
!include "StrFunc.nsh"

${Using:StrFunc} StrStr
!insertmacro STRFUNC_MAKEFUNC StrStr "un."
!insertmacro STRFUNC_MAKEFUNC StrRep "un."

; Danach in Funktionen kannst du:
; Call un.StrStr
; Call un.StrRep

# Name des Installers
Outfile "ToolsSetup.exe"

# Verzeichnis, in das installiert wird
InstallDir "$LOCALAPPDATA\@shadowdara\tools"

# NO ADMIN
RequestExecutionLevel user

# Standardseite für Benutzer
Page directory
Page instfiles

# -------------------------------
# Uninstaller
# -------------------------------
Section "Uninstall"
  RMDir /r "$INSTDIR"

  # Delete Both Directories
  RMDir "$LOCALAPPDATA\@shadowdara"

  Delete "$DESKTOP\multitool.lnk"
  Delete "$SMPROGRAMS\tools\Uninstall.lnk"
  Delete "$SMPROGRAMS\tools\multitool.lnk"
  RMDir "$SMPROGRAMS\tools"

  ; Read current PATH from registry
  ReadRegStr $0 HKCU "Environment" "Path"

  ; Call un.StrStr to check if $INSTDIR is in PATH
  Push "$INSTDIR"
  Push $0
  Call un.StrStr
  Pop $1 ; $1 = result of un.StrStr (position or empty)

  ${If} $1 != ""
    ; Remove $INSTDIR from PATH with un.StrRep

    Push ""             ; replacement string (empty)
    Push "$INSTDIR;"    ; string to remove with trailing semicolon
    Push $0             ; original PATH
    Call un.StrRep
    Pop $2              ; first replacement result

    Push ""             ; replacement string (empty)
    Push ";$INSTDIR"    ; string to remove with leading semicolon
    Push $2             ; previous result
    Call un.StrRep
    Pop $2              ; second replacement result

    Push ""             ; replacement string (empty)
    Push "$INSTDIR"     ; string to remove (no semicolon)
    Push $2             ; previous result
    Call un.StrRep
    Pop $2              ; final result

    WriteRegExpandStr HKCU "Environment" "Path" "$2"
    System::Call 'user32::SendMessageTimeoutA(i 0xffff, i 0x1A, i 0, t "Environment", i 0, i 1000, *i .r0)'
  ${EndIf}

  # Entferne Uninstaller-Eintrag aus der Registry
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\MultitoolInstaller"

SectionEnd

# -------------------------------
# Funktion: AddToPath
# -------------------------------
Function AddToPath
  Exch $1 ; new path
  Exch
  Exch $0 ; old path
  Push $2
  Push $3
  Push $4

  StrCpy $2 "$0"
  StrCpy $3 "$1"

  ${StrStr} $4 $2 $3

  ${If} $4 == ""
    StrCpy $2 "$2;$3"
    WriteRegExpandStr HKCU "Environment" "Path" "$2"
    System::Call 'user32::SendMessageTimeoutA(i 0xffff, i 0x1A, i 0, t "Environment", i 0, i 1000, *i .r0)'
  ${EndIf}

  Pop $4
  Pop $3
  Pop $2
  Pop $0
  Pop $1
FunctionEnd

# -------------------------------
# Sektion: Installiere Programm
# -------------------------------
Section "Install"

  # Erstelle Installationsverzeichnis
  CreateDirectory "$INSTDIR"

  ; Rekursiv alle Dateien und Ordner einbinden
  CreateDirectory "$INSTDIR\msg-formatter"
  SetOutPath "$INSTDIR\msg-formatter"
  File /r "..\multitool\msg-formatter\*.*"

  CreateDirectory "$INSTDIR\wrapperbin"
  SetOutPath "$INSTDIR\wrapperbin"
  File /r "..\multitool\wrapperbin\*.*"

  # Kopiere Datei(en) ins Zielverzeichnis
  SetOutPath "$INSTDIR"
  File "..\multitool\multitool.bat"

  # ---- PATH hinzufügen ----
  ReadRegStr $0 HKCU "Environment" "Path"
  StrCpy $1 "$INSTDIR\wrapperbin"
  Push $0
  Push $1
  Call AddToPath

  # Create Startmenu Directory
  CreateDirectory "$SMPROGRAMS\tools"

  # Shortcuts
  CreateShortCut "$SMPROGRAMS\tools\luajit.lnk" "$INSTDIR\multitool.bat"
  CreateShortCut "$SMPROGRAMS\tools\Uninstall.lnk" "$INSTDIR\Uninstall.exe"

  ; Desktop Shortcut
  CreateShortCut "$DESKTOP\multitool.lnk" "$INSTDIR\multitool.bat" "" "$INSTDIR\multitool.ico"

  # ---- Uninstaller schreiben ----
  WriteUninstaller "$INSTDIR\Uninstall.exe"

  # ---- In Windows-Softwareliste eintragen ----
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\LuajitInstaller" "DisplayName" "Multitool (Benutzerinstallation)"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\LuajitInstaller" "UninstallString" "$INSTDIR\Uninstall.exe"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\LuajitInstaller" "DisplayIcon" "$INSTDIR\luajit.exe"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\LuajitInstaller" "InstallLocation" "$INSTDIR"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\LuajitInstaller" "Publisher" "@shadowdara"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\LuajitInstaller" "DisplayVersion" "1.0.0"

SectionEnd
