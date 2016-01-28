Param(
[string] $filePath,
[string] $buildName,
[string] $buildNumber
)

$jsonContent = Get-Content $filePath -Raw
$projectJsonObject = ConvertFrom-Json $jsonContent.ToString()

$newbuildName = "$buildName-$buildNumber"

$projectJsonObject.version = $projectJsonObject.version -replace "\*", $newbuildName

ConvertTo-Json -InputObject $projectJsonObject | Set-Content $filePath