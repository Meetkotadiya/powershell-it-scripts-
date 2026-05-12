$targets = @("google.com","github.com","8.8.8.8","1.1.1.1","microsoft.com")
Write-Host "=== NETWORK CONNECTIVITY TEST ===" -ForegroundColor Cyan
Write-Host "Time: $(Get-Date)" -ForegroundColor Gray
Write-Host ""
foreach ($t in $targets) {
    $result = Test-Connection -ComputerName $t -Count 2 -ErrorAction SilentlyContinue
    if ($result) {
        $avg = [math]::Round(($result | Measure-Object ResponseTime -Average).Average,0)
        Write-Host "[  OK  ] $t — Avg response: ${avg}ms" -ForegroundColor Green
    } else {
        Write-Host "[ FAIL ] $t — No response" -ForegroundColor Red
    }
}
Write-Host ""
Write-Host "Connectivity test complete." -ForegroundColor Cyan