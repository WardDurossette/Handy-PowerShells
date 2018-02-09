

Function Get-OutlookInBox

{

     Add-type -assembly "Microsoft.Office.Interop.Outlook"

     $olFolders = "Microsoft.Office.Interop.Outlook.olDefaultFolders" -as [type]

     $outlook = new-object -comobject outlook.application

     $namespace = $outlook.GetNameSpace("MAPI")

     $cp = $namespace.Folders # FolderClass ComObject containing all Outlook folders, usually first is the PublicFolder


     # $folder = $namespace.getDefaultFolder($olFolders::olFolderInbox)

     $folderID = "000000009B73D342A87761479FF4C150B67B021301003C4D2464367D7143B3B22BD58A3FFA930000C5FEB66C0000"
     $folderPAlert = $namespace.GetFolderFromID($folderID)

      
     $folderPAlert.items | Where-Object { $_.Subject -eq "PAlert.asp called" } |

     Select-Object -Property Subject, ReceivedTime, Body
} 

