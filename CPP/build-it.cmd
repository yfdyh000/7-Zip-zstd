@echo off

set ROOT=%cd%\7zip
set OUTDIR=%APPVEYOR_BUILD_FOLDER%\bin-%VC%-%PLATFORM%
set ERRFILE=%APPVEYOR_BUILD_FOLDER%\bin-%VC%-%PLATFORM%.log
set LFLAGS=/SUBSYSTEM:WINDOWS,%SUBSYS%
set > %APPVEYOR_BUILD_FOLDER%\env-%VC%-%PLATFORM%.txt
mkdir %OUTDIR%

if "%1" neq "" goto %1

:7zxa
cd %ROOT%\Bundles\Format7zExtract
nmake %OPTS%
IF %errorlevel% NEQ 0 echo "Error @ 7zxa.dll" >> %ERRFILE%
copy %PLATFORM%\7zxa.dll %OUTDIR%\7zxa.dll
if "%1" neq "" goto ende

:7za
cd %ROOT%\Bundles\Format7z
nmake %OPTS%
IF %errorlevel% NEQ 0 echo "Error @ 7za.dll" >> %ERRFILE%
copy %PLATFORM%\7za.dll %OUTDIR%\7za.dll
if "%1" neq "" goto ende

:7z
cd %ROOT%\Bundles\Format7zF
nmake %OPTS%
IF %errorlevel% NEQ 0 echo "Error @ 7z.dll" >> %ERRFILE%
copy %PLATFORM%\7z.dll %OUTDIR%\7z.dll
if "%1" neq "" goto ende

:7zFM
cd %ROOT%\UI\FileManager
nmake %OPTS%
IF %errorlevel% NEQ 0 echo "Error @ 7zFM.exe" >> %ERRFILE%
copy %PLATFORM%\7zFM.exe %OUTDIR%\7zFM.exe
if "%1" neq "" goto ende

:7zG
cd %ROOT%\UI\GUI
nmake %OPTS%
IF %errorlevel% NEQ 0 echo "Error @ 7zG.exe" >> %ERRFILE%
copy %PLATFORM%\7zG.exe %OUTDIR%\7zG.exe
if "%1" neq "" goto ende

:7zip
cd %ROOT%\UI\Explorer
nmake %OPTS%
IF %errorlevel% NEQ 0 echo "Error @ 7-zip.dll" >> %ERRFILE%
copy %PLATFORM%\7-zip.dll %OUTDIR%\7-zip.dll
if "%1" neq "" goto ende

:sfx
cd %ROOT%\Bundles\SFXWin
nmake %OPTS%
IF %errorlevel% NEQ 0 echo "Error @ 7z.sfx" >> %ERRFILE%
copy %PLATFORM%\7z.sfx %OUTDIR%\7z.sfx
if "%1" neq "" goto ende

:brotli
cd %ROOT%\Bundles\Codec_brotli
nmake %OPTS%
IF %errorlevel% NEQ 0 echo "Error @ brotli.dll" >> %ERRFILE%
copy %PLATFORM%\brotli.dll %OUTDIR%\brotli.dll
if "%1" neq "" goto ende

:lizard
cd %ROOT%\Bundles\Codec_lizard
nmake %OPTS%
IF %errorlevel% NEQ 0 echo "Error @ lizard.dll" >> %ERRFILE%
copy %PLATFORM%\lizard.dll %OUTDIR%\lizard.dll
if "%1" neq "" goto ende

:lz4
cd %ROOT%\Bundles\Codec_lz4
nmake %OPTS%
IF %errorlevel% NEQ 0 echo "Error @ lz4.dll" >> %ERRFILE%
copy %PLATFORM%\lz4.dll %OUTDIR%\lz4.dll
if "%1" neq "" goto ende

:lz5
cd %ROOT%\Bundles\Codec_lz5
nmake %OPTS%
IF %errorlevel% NEQ 0 echo "Error @ lz5.dll" >> %ERRFILE%
copy %PLATFORM%\lz5.dll %OUTDIR%\lz5.dll
if "%1" neq "" goto ende

:zstd
cd %ROOT%\Bundles\Codec_zstd
nmake %OPTS%
IF %errorlevel% NEQ 0 echo "Error @ zstd.dll" >> %ERRFILE%
copy %PLATFORM%\zstd.dll %OUTDIR%\zstd.dll
if "%1" neq "" goto ende

:flzma2
cd %ROOT%\Bundles\Codec_flzma2
nmake %OPTS%
IF %errorlevel% NEQ 0 echo "Error @ flzma2.dll" >> %ERRFILE%
copy %PLATFORM%\flzma2.dll %OUTDIR%\flzma2.dll
if "%1" neq "" goto ende

:Install
cd %ROOT%\..\..\C\Util\7zipInstall
nmake %OPTS%
IF %errorlevel% NEQ 0 echo "Error @ Install.exe" >> %ERRFILE%
copy %PLATFORM%\7zipInstall.exe %OUTDIR%\Install.exe
if "%1" neq "" goto ende

:Uninstall
cd %ROOT%\..\..\C\Util\7zipUninstall
nmake %OPTS%
IF %errorlevel% NEQ 0 echo "Error @ Uninstall.exe" >> %ERRFILE%
copy %PLATFORM%\7zipUninstall.exe %OUTDIR%\Uninstall.exe
if "%1" neq "" goto ende

:7z
set LFLAGS=/SUBSYSTEM:CONSOLE,%SUBSYS%
cd %ROOT%\UI\Console
nmake %OPTS%
IF %errorlevel% NEQ 0 echo "Error @ 7z.exe" >> %ERRFILE%
copy %PLATFORM%\7z.exe %OUTDIR%\7z.exe
if "%1" neq "" goto ende

:7zCon
cd %ROOT%\Bundles\SFXCon
nmake %OPTS%
IF %errorlevel% NEQ 0 echo "Error @ 7zCon.sfx" >> %ERRFILE%
copy %PLATFORM%\7zCon.sfx %OUTDIR%\7zCon.sfx
if "%1" neq "" goto ende

:7za
cd %ROOT%\Bundles\Alone
nmake %OPTS%
IF %errorlevel% NEQ 0 echo "Error @ 7za.exe" >> %ERRFILE%
copy %PLATFORM%\7za.exe %OUTDIR%\7za.exe
if "%1" neq "" goto ende

:ende
cd %ROOT%\..

