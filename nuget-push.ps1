dotnet restore
dotnet build .\Binbin.Linq.PredicateBuilder

dotnet test .\Binbin.Linq.PredicateBuilder.UnitTests

dotnet pack .\Binbin.Linq.PredicateBuilder

$project = Get-Content .\Binbin.Linq.PredicateBuilder\project.json | ConvertFrom-Json
$version = $project.version.Trim("-*")
nuget push .\Binbin.Linq.PredicateBuilder\bin\Debug\Binbin.Linq.PredicateBuilder.$version.nupkg -source nuget -apikey $env:NUGET_API_KEY
