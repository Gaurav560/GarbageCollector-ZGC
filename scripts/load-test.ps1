# Create a PowerShell script to generate load pattern
$iterations = 5
$waitTime = 10  # seconds between loads

Write-Host "Starting memory load test..."
Write-Host "Will run $iterations times with ${waitTime}s delay between each"

for ($i = 1; $i -le $iterations; $i++) {
    Write-Host "`nIteration $i of $iterations"
    Write-Host "Generating 500MB load..."
    curl -Method POST "http://localhost:8080/api/memory/load/500"
    Write-Host "Waiting ${waitTime}s..."
    Start-Sleep -Seconds $waitTime

    Write-Host "Generating 1000MB load..."
    curl -Method POST "http://localhost:8080/api/memory/load/800"
    Write-Host "Waiting ${waitTime}s..."
    Start-Sleep -Seconds $waitTime
}

Write-Host "`nTest complete!"