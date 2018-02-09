

Clear-Host

$UserNameToStore = Read-Host -Prompt "Enter UserName: " 

$PasswordToStore = Read-Host -Prompt "Enter Password: " 

$CredFileName = Read-Host -Prompt "Enter the FileName to store credentials (creds.json)."

WriteCredentialFile -UserToSave $UserNameToStore -PwdToSave $PasswordToStore -SaveFileName $CredFileName

ReadCredentialFile -FileName $CredFileName



function WriteCredentialFile {
    Param(
        [parameter()]$UserToSave,$PwdToSave,$SaveFileName
    )
   
   
    Write-Host "Creating Credential File $($SaveFileName) with UserName $($UserToSave) and Password $($PwdToSave)."
    Write-Host

    # create secure string from plain-text string
    $secureString = ConvertTo-SecureString -AsPlainText -Force -String $PwdToSave

    # convert secure string to encrypted string (for safe-ish storage to config/file/etc.)
    $encryptedString = ConvertFrom-SecureString -SecureString $secureString

    # create an object to hold our info - this object will we searialized.
    $properties = @{'Username'=$UserToSave;
                    'Password'=$encryptedString}
    $object = New-Object -TypeName PSObject -Property $properties

    # convert to json and save as a file
    ConvertTo-Json -InputObject $object | Out-File -FilePath $SaveFileName
    
}

function ReadCredentialFile {
    param($FileName)

    # get the content of the file
    $FileContent = Get-Content -Path $FileName
    Write-Host $FileName
    Write-Host $FileContent 
    Write-Host

    # convert the contents of the file (json) into an object
    $object = $FileContent | ConvertFrom-Json

    # get the username and password properties from the object
    Write-Host "Here is User", $object.Username
    Write-Host "Here is pwd", $object.Password
    Write-Host





}
