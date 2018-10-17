param([string]$version)

if ([string]::IsNullOrEmpty($version)) {$version = "0.0.1"}

$msbuild = vswhere -latest -products * -requires Microsoft.Component.MSBuild -property installationPath
if ($path) {
  $path = join-path $path 'MSBuild\15.0\Bin\MSBuild.exe'
  if (test-path $path) {
    & $path $args
  }
}

&$msbuild ..\interface\IMQTTClient.rx\IMQTTClientRx.csproj /t:Build /p:Configuration="Release"
&$msbuild ..\main\MQTTClientRx.netstandard20\MQTTClientRx.netstandard20.csproj /t:Build /p:Configuration="Release"


Remove-Item .\NuGet -Force -Recurse
New-Item -ItemType Directory -Force -Path .\NuGet
c:\tools\nuget\NuGet.exe pack MQTTClientRx.nuspec -Verbosity detailed -Symbols -OutputDir "NuGet" -Version $version