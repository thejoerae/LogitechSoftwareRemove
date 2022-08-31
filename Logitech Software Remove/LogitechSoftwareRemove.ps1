    # check if LogiLDA.dll and LogiFetch files exists
    $file1 = 'C:\Windows\System32\LogiLDA.dll'
    $file2 = 'C:\Windows\System32\LogiFetch*'


    Function Remove-LogitechCrap ($fileName){
        if (Test-Path -Path $fileName){
            Remove-Item $fileName
            Write-Host "$fileName has been deleted"
        }
    
        else {
            Write-Host "$fileName was not detected on this system"
        }
    }

    Remove-LogitechCrap $file1
    Remove-LogitechCrap $file2

    # check for Logitech Download Assistant and LogiBolt registry keys

    $regkey = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run'
    $name1 = 'Logitech*'
    $name2 = 'LogiBolt*'

    Function Test-RegistryValue ($regkey, $name) {
        if (Get-ItemProperty -Path $regkey -Name $name -ErrorAction Ignore) {
            #true
		    Remove-ItemProperty -Path $regkey -Name $name
		    Write-Host "The $regkey $name was found and removed"
        } else {
            #false
		    Write-Host "The registry key $regkey $name was not found"
        }
    }

    Test-RegistryValue $regkey $name1 
    Test-RegistryValue $regkey $name2

