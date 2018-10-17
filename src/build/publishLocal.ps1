param([string]$betaver,
[string]$key,
[string]$source)


if ([string]::IsNullOrEmpty($betaver)) {
	$version = [Reflection.AssemblyName]::GetAssemblyName((resolve-path '..\interface\IMQTTClient.rx\bin\Release\netstandard2.0\IMQTTClientRx.dll')).Version.ToString(3)
	}
else {
	$version = [Reflection.AssemblyName]::GetAssemblyName((resolve-path '..\interface\IMQTTClient.rx\bin\Release\netstandard2.0\IMQTTClientRx.dll')).Version.ToString(3) + "-" + $betaver
}

.\build.ps1 $version

c:\tools\nuget\nuget.exe push -Source $source -ApiKey $key ".\NuGet\MQTTClientRx.$version.symbols.nupkg"
