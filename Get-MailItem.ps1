
function get-mailitem {            
param (            
    [parameter(Mandatory=$true)]            
    [string]$mailfolder,            
                  
    [switch]$all            
)       
    Write-Output("Get-MailItem, mailFolder = " + $mailfolder)


     
    $outlook = New-Object -ComObject Outlook.Application            
            
    $folders | where {$_.Path -like "*$mailfolder"} |            

    foreach {            
        $targetfolder = $outlook.Session.GetFolderFromID($_.EntryID, $_.StoreID)            



        Write-Output("Get-MailItem, mailFolder = " + $targetfolder)
              
        if ($all){            
            $targetfolder.Items            
        }            
        else {            
            $targetfolder.Items | sort  SentOn -desc | select SenderEmailAddress, Subject, SentOn            
        }  
    }            
}