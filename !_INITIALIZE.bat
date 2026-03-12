:: Tjek om vi er i template-repoet (hvis mappen hedder noget med 'template')
echo %cd% | findstr /I "template" >nul
if %errorlevel%==0 (
    echo [ADVARSEL] Du kører dette script i dit TEMPLATE-repo!
    echo Dette vil låse dine filer, så du ikke kan committe ændringer.
    set /p confirm="Vil du fortsætte? (y/n): "
    if /I not "%confirm%"=="y" exit
)

@echo off
echo =======================================================
echo    Preparing Semester Project Template...
echo =======================================================
echo.

echo [1/3] Securing personal Obsidian settings...
:: Telling Git to ignore your local changes to config files
git update-index --skip-worktree .obsidian/app.json 2>nul
git update-index --skip-worktree .obsidian/appearance.json 2>nul
git update-index --skip-worktree .obsidian/hotkeys.json 2>nul
git update-index --skip-worktree .obsidian/community-plugins.json 2>nul
git update-index --skip-worktree .obsidian/core-plugins.json 2>nul
git update-index --skip-worktree .obsidian/page-preview.json 2>nul

:: Layout and workspace files (updates constantly)
git update-index --skip-worktree .obsidian/workspaces.json 2>nul
git update-index --skip-worktree .obsidian/workspace.json 2>nul
git update-index --skip-worktree .obsidian/workspace-desktop.json 2>nul
git update-index --skip-worktree .obsidian/workspace-mobile.json 2>nul
echo Done! You can now change settings without causing Git conflicts.
echo.

echo [2/3] Cleaning up...
:: Opretter Obsidians .trash mappe, hvis den ikke allerede findes
if not exist "%~dp0.trash" mkdir "%~dp0.trash"

:: Skjuler stadig Bash-scriptet, så bygge-knappen stadig kan finde det i roden
attrib +h build.ps1 2>nul

:: Flytter selve setup-scriptet til .trash i stedet for at skjule det
:: (Flyttet til slutningen af scriptet for at forhindre at terminalen lukker før tid)
echo Done! Setup script will be moved to .trash after completion.
echo.

echo [3/3] Opening the Typst environment in VS Code...
echo.
echo Everything is ready! Happy writing.
echo =======================================================
echo.

:: Open the root directory in VS Code
code .

:: Pause so the user can read the output before the window closes
pause

:: Flytter selve setup-scriptet til .trash til sidst
move /Y "%~f0" "%~dp0.trash\"
