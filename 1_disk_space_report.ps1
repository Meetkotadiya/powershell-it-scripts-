Write-Host "=== DISK SPACE REPORT ===" -ForegroundColor Cyan
Write-Host "Generated: $(Get-Date)" -ForegroundColor Gray
Write-Host ""
Get-PSDrive -PSProvider FileSystem | ForEach-Object {
    $used = [math]::Round($_.Used/1GB, 2)
    $free = [math]::Round($_.Free/1GB, 2)
    $total = $used + $free
    $pct = if ($total -gt 0) { [math]::Round(($used/$total)*100, 1) } else { 0 }
    $colour = if ($pct -gt 85) {"Red"} elseif ($pct -gt 70) {"Yellow"} else {"Green"}
    Write-Host "Drive $($_.Name): Used=${used}GB  Free=${free}GB  Usage=${pct}%" -ForegroundColor $colour
}
Write-Host ""
Write-Host "Report complete." -ForegroundColor Cyan