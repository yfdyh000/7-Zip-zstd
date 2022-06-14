@echo off

REM Microsoft Windows SDK 7.1    (VC=sdk71) -> can compile for IA64, but who needs that?
REM Microsoft Visual Studio 2010 (VC=10.0) -> for win2k, but who needs that?
REM Microsoft Visual Studio 2012 (VC=11.0)
REM Microsoft Visual Studio 2013 (VC=12.0)
REM Microsoft Visual Studio 2015 (VC=14.0)
REM Microsoft Visual Studio 2017 (VC=15.0)
REM Microsoft Visual Studio 2019 (VC=16.0)
REM Microsoft Visual Studio 2022 (VC=17.0)

REM Microsoft Visual Studio 2019 /SUBSYSTEM version numbers:
REM             MIN                                  STANDARD
REM CONSOLE     5.01 (x86) 5.02 (x64) 6.02 (ARM)     6.00 (x86, x64) 6.02 (ARM)
REM WINDOWS     5.01 (x86) 5.02 (x64) 6.02 (ARM)     6.00 (x86, x64) 6.02 (ARM)

set CURDIR=%~dp0
set APPVEYOR_BUILD_FOLDER=%CURDIR%\..

REM to many vcvarsall.cmd calls will blow it up!
set OPATH=%PATH%
set ERRFILE=%APPVEYOR_BUILD_FOLDER%\error.txt
cd %APPVEYOR_BUILD_FOLDER%\CPP

goto build_vs2022

:build_vs2022
set VC=17.0
set PATH=%OPATH%
set SUBSYS="5.01"
call "C:\Program Files\Microsoft Visual Studio\2022\Preview\VC\Auxiliary\Build\vcvarsall.bat" x86
call build-it.cmd

goto end

set PATH=%OPATH%
set SUBSYS="5.02"
call "C:\Program Files\Microsoft Visual Studio\2022\Preview\VC\Auxiliary\Build\vcvarsall.bat" x64
call build-it.cmd

set PATH=%OPATH%
set SUBSYS="6.02"
call "C:\Program Files\Microsoft Visual Studio\2022\Preview\VC\Auxiliary\Build\vcvarsall.bat" x64_arm
call build-it.cmd

set PATH=%OPATH%
set SUBSYS="6.02"
call "C:\Program Files\Microsoft Visual Studio\2022\Preview\VC\Auxiliary\Build\vcvarsall.bat" x64_arm64
call build-it.cmd

goto end

:end
cd %APPVEYOR_BUILD_FOLDER%
7z a %APPVEYOR_PROJECT_NAME%-%APPVEYOR_BUILD_VERSION%.7z bin-* *.txt
