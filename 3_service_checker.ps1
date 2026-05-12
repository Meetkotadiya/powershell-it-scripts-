$services = @("Spooler","wuauserv","WinDefend","BITS","Dnscache")
Write-Host "=== SERVICE STATUS CHECKER ===" -ForegroundColor Cyan
Write-Host ""
foreach ($svc in $services) {
    $s = Get-Service -Name $svc -ErrorAction SilentlyContinue
    if ($s) {
        $colour = if ($s.Status -eq "Running") {"Green"} else {"Red"}
        Write-Host "[$($s.Status.ToString().ToUpper())] $($s.DisplayName)" -ForegroundColor $colour
        if ($s.Status -ne "Running") {
            Write-Host "  → Attempting to start $($s.DisplayName)..." -ForegroundColor Yellow
            Start-Service -Name $svc -ErrorAction SilentlyContinue
            Start-Sleep -Seconds 2
            $s.Refresh()
            Write-Host "  → Now: $($s.Status)" -ForegroundColor Cyan
        }
    }
}
Write-Host ""
Write-Host "Check complete." -ForegroundColor Cyan