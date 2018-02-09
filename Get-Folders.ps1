function Get-MailboxFolder($folder)


    {
    $outputfile="c:\temp\Mailbox.txt"
    Add-content -path $outputfile "$prefix $($folder.name)"
    $prefix+="-" #Extend prefix for each subsequent level of subfolder
    foreach ($f in $folder.folders) {
        Get-MailboxFolder $f
    } #End ForEach
} #End Function



function get-folders {            

    Add-type -assembly "Microsoft.Office.Interop.Outlook" | out-null


    $olFolders = "Microsoft.Office.Interop.Outlook.olDefaultFolders" -as [type]

    $outlook = new-object -com outlook.application;
    $ns = $outlook.GetNameSpace("MAPI");
    $inbox = $ns.GetDefaultFolder($olFolders::olFolderInbox)
    
    $inbox.Folders.items | Select-Object 

 #   $targetfolder = $inbox.Folders | where-object { $_.name -eq "PioneerAlertSignup" }
 #   $targetfolder.items | foreach {
 #   $_.body | out-file -Append -encoding ASCII c:\temp\foo.txt # keyword match prints body to file...
 #   }

}