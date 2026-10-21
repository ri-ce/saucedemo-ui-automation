$ErrorActionPreference = "Stop"

if (-not (Test-Path ".venv\Scripts\python.exe")) {
    python -m venv .venv
}

& ".venv\Scripts\python.exe" -m pip install -r requirements.txt
& ".venv\Scripts\python.exe" -m pytest `
    ui_tests `
    --html=docs\test-report.html `
    --self-contained-html

Write-Host ""
Write-Host "UI test report: docs\test-report.html"
