@echo off
setlocal enabledelayedexpansion

:: Define the directory containing the files
set "directory=Library\easyeda2kicad\.pretty"

:: Define the search and replace strings
set "search=/Library/easyeda2kicad/.3dshapes"
set "replace=${KIPRJMOD}/../../Library/easyeda2kicad/.3dshapes"

:: Loop through all files in the directory, only replace if not already present
for /r "%directory%" %%f in (*) do (
    findstr /C:"%replace%" "%%f" >nul
    if errorlevel 1 (
        powershell -Command "(Get-Content -Raw '%%f') -replace '%search%', '%replace%' | Set-Content '%%f'"
    ) else (
        echo Skipping %%f (already replaced)
    )
)

echo Replacement validation completed successfully.
endlocal