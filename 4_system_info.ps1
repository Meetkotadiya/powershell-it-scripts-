Write-Host "=== SYSTEM INFORMATION REPORT ===" -ForegroundColor Cyan
Write-Host ""
$os  = Get-CimInstance Win32_OperatingSystem
$cpu = Get-CimInstance Win32_Processor
$ram = Get-CimInstance Win32_ComputerSystem
Write-Host "Computer Name : $env:COMPUTERNAME"
Write-Host "OS            : $($os.Caption) $($os.OSArchitecture)"
Write-Host "Version       : $($os.Version)"
Write-Host "Last Boot     : $($os.LastBootUpTime)"
Write-Host "CPU           : $($cpu.Name)"
Write-Host "RAM           : $([math]::Round($ram.TotalPhysicalMemory/1GB,2)) GB"
Write-Host "Current User  : $env:USERNAME"
Write-Host ""
$uptime = (Get-Date) - $os.LastBootUpTime
Write-Host "Uptime: $($uptime.Days)d $($uptime.Hours)h $($uptime.Minutes)m" -ForegroundColor Green