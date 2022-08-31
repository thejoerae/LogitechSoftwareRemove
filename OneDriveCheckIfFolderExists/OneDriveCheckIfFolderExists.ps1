$folders = Get-ChildItem -Directory "C:\Users" | Where-Object {($_.Name -notlike "Public") -and ($_.Name -notlike "Default*")} 

$folderNames = $folders.Name
$folderArray = $folderNames.Split(" ")

Foreach ($user in $folderArray)
	{
		If (Test-Path -Path "C:\Users\$user\OneDrive - P*")
		{
			Write-Output "C:\Users\$user\OneDrive - Phathom Pharmaceutical"
		}
		Else
		{
			Write-Output "$user - None found"
		}	
	}