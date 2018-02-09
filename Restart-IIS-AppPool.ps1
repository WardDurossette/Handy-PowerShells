#PowerShell Script to Restart an App Pool on IIS

Clear-Host
Write-Host "Restart IIS AppPool"

$ComputerName = Read-Host -Prompt "Enter the Computer Name" 
    
# hard code the computer name
# $ComputerName = "\\ComputerNameGoesHere"


Write-Host "Restarting Default App Pool on Computer: $($ComputerName)"

$admin_credentials = Get-Credential 


Invoke-Command -ComputerName $ComputerName -Credential $admin_credentials -ScriptBlock { Add-PSSnapin WebAdministration; Restart-WebItem 'IIS:\AppPools\DefaultAppPool' }