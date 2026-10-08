$ErrorActionPreference = 'Stop'

$datapackPath = Join-Path $PSScriptRoot 'datapack'
$metadataPath = Join-Path $datapackPath 'pack.mcmeta'
$dataPath = Join-Path $datapackPath 'data'
$zipPath = Join-Path $PSScriptRoot 'DerexAntiEnderDragonGrief.zip'

if (-not (Test-Path -LiteralPath $metadataPath -PathType Leaf)) {
    throw "Datapack metadata was not found: $metadataPath"
}

if (-not (Test-Path -LiteralPath $dataPath -PathType Container)) {
    throw "Datapack data folder was not found: $dataPath"
}

if (Test-Path -LiteralPath $zipPath -PathType Leaf) {
    Remove-Item -LiteralPath $zipPath -Force
}

Compress-Archive -Path (Join-Path $datapackPath '*') -DestinationPath $zipPath -Force
Write-Host "Created $zipPath"
