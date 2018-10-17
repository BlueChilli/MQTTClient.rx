param([string]$betaver,
[string]$key,
[string]$source,
[string] $version)

.\build.ps1 $version

c:\tools\nuget\nuget.exe push -Source $source -ApiKey $key ".\NuGet\MQTTClientRx.$version.symbols.nupkg"
