@echo off
setlocal
cd /d "%~dp0"
set "PATH=%~dp0local\ruby\bin;%PATH%"
set "RUBYOPT=-EUTF-8"
set "BUNDLE_GEMFILE=%~dp0Gemfile"
set "BUNDLE_PATH=%~dp0vendor\bundle"

rem Ruby does not automatically inherit the Windows system proxy.
if not defined https_proxy (
  for /f "usebackq delims=" %%P in (`powershell.exe -NoProfile -Command "$p = [System.Net.WebRequest]::GetSystemWebProxy().GetProxy([Uri]'https://rubygems.org'); if ($p -and $p.Host -ne 'rubygems.org') { $p.AbsoluteUri }"`) do set "https_proxy=%%P"
)

where ruby >nul 2>&1
if errorlevel 1 (
  echo Ruby was not found. See the Windows preview section in README.md.
  pause
  exit /b 1
)

call bundle check >nul 2>&1
if errorlevel 1 (
  echo Installing the website dependencies...
  call bundle install --jobs 4 --retry 2
  if errorlevel 1 (
    pause
    exit /b 1
  )
)

echo.
echo Local preview: http://localhost:4000
echo Save your changes to rebuild and refresh the page automatically.
echo Keep this window open. Press Ctrl+C to stop the preview.
echo Restart this script after editing _config.yml or _config.local.yml.
echo.
rem Load Jekyll in this Ruby process to avoid Windows executable shim issues.
ruby -rbundler/setup -e "load Gem.bin_path('jekyll', 'jekyll')" -- serve --config _config.yml,_config.local.yml --host 127.0.0.1 --port 4000 --livereload --force_polling
if errorlevel 1 pause
