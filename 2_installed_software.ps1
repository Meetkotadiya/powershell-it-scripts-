Write-Host "=== INSTALLED SOFTWARE ===" -ForegroundColor Cyan
Write-Host "Computer: $env:COMPUTERNAME  |  Date: $(Get-Date -Format 'yyyy-MM-dd')" -ForegroundColor Gray
Write-Host ""
$apps = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |
    Where-Object { $_.DisplayName } |
    Select-Object DisplayName, DisplayVersion, Publisher |
    Sort-Object DisplayName
$apps | Format-Table -AutoSize
Write-Host "Total installed: $($apps.Count) applications" -ForegroundColor Green
$apps | Export-Csv "$env:C:\Users\meetk\OneDrive\Desktop\software_report.csv" -NoTypeInformation
Write-Host "CSV saved to Desktop." -ForegroundColor Cyan