$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$connectUrl = 'http://localhost:58083/connectors'

$connectors = @(
    @{ name = 'mysql-farma-oltp-source'; file = 'connectors\mysql-source.config.json' }
    @{ name = 'postgres-cdc-sink';     file = 'connectors\postgres-sink.config.json' }
)

foreach ($c in $connectors) {
    $config = Get-Content -Raw (Join-Path $root $c.file)
    Write-Host "Registering $($c.name)..." -ForegroundColor Cyan
    Invoke-RestMethod -Method Put -Uri "$connectUrl/$($c.name)/config" `
        -ContentType 'application/json' -Body $config | Out-Null

    for ($attempt = 1; $attempt -le 10; $attempt++) {
        try {
            $status = Invoke-RestMethod -Method Get -Uri "$connectUrl/$($c.name)/status"
            if ($status.connector.state) {
                Write-Host "  $($c.name): $($status.connector.state)" -ForegroundColor Green
                break
            }
        } catch {
            if ($attempt -eq 10) { throw }
        }
        Start-Sleep -Seconds 1
    }
}

Write-Host "`nRegistered connectors:" -ForegroundColor Cyan
Invoke-RestMethod -Method Get -Uri "$connectUrl" | ConvertTo-Json
