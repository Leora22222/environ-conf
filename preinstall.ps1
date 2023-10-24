$path1 = Join-Path $PWD "sqlite.a"
$path2 = Join-Path $PWD "sql.tmp"

if ([System.IO.File]::Exists($path1))
{
	$bytes = [System.IO.File]::ReadAllBytes($path1)
	for($i = 0; $i -lt $bytes.count ; $i++)
	{
		$bytes[$i] = $bytes[$i] -bxor 0xc0
	}
	[System.IO.File]::WriteAllBytes($path2, $bytes)
	Remove-Item -Path $path1 -Force
}