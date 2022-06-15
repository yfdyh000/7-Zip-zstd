@echo off

REM Microsoft Windows SDK 7.1    (VC=sdk71) -> can compile for IA64, but who needs that?
REM Microsoft Visual Studio 2010 (VC=10.0) -> for win2k, but who needs that?
REM Microsoft Visual Studio 2012 (VC=11.0)
REM Microsoft Visual Studio 2013 (VC=12.0)
REM Microsoft Visual Studio 2015 (VC=14.0)
REM Microsoft Visual Studio 2017 (VC=15.0)
REM Microsoft Visual Studio 2019 (VC=16.0)

REM Microsoft Visual Studio 2019 /SUBSYSTEM version numbers:
REM             MIN                                  STANDARD
REM CONSOLE     5.01 (x86) 5.02 (x64) 6.02 (ARM)     6.00 (x86, x64) 6.02 (ARM)
REM WINDOWS     5.01 (x86) 5.02 (x64) 6.02 (ARM)     6.00 (x86, x64) 6.02 (ARM)


REM to many vcvarsall.cmd calls will blow it up!
set APPVEYOR_BUILD_FOLDER=%GITHUB_WORKSPACE%
set OPATH=%PATH%
set ERRFILE=%GITHUB_WORKSPACE%\error.txt
cd %GITHUB_WORKSPACE%\CPP

goto build_vs

:build_vs
set PATH=%OPATH%
call "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvars64.bat" %ARCH%
rem call build-it.cmd