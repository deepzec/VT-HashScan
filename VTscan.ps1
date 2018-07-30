$Table = @()
$APIKey = '<Put your Virustotal API key here>'

foreach ($Hash in Get-Content 'HashList.txt')
{
Write-Host $Hash
Start-Sleep -s 26
$Body = @{ resource = $Hash; apikey = $APIKey }
$Scan = Invoke-RestMethod -Method 'POST' -Uri 'https://www.virustotal.com/vtapi/v2/file/report' -Body $Body
$Scan.Scans | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name | ForEach-Object { $TableRow = [PSCustomObject]@{ 'Engine' = $_; 'Detected' = $Scan.Scans.$_.Detected; 'Version' = $Scan.Scans.$_.Version; 'Detection' = $Scan.Scans.$_.Result; 'Updated' = $Scan.Scans.$_.Update; 'Hash' = $Hash };
	$Table += $TableRow 
}
}
$Table | Where-Object {$_.Engine -eq 'TrendMicro'} | Format-Table -AutoSize  | Out-File -FilePath Trend_detection.txt
# }
