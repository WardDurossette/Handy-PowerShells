# Add the EntLib Logging Source to the Application Event Log 
# This allows the EntLib to write Events into the EventLog, else you won't get 
# any events.  You will have to do this on new machines.  - Ward
#
$source = "Enterprise Library Logging"


$wid=[System.Security.Principal.WindowsIdentity]::GetCurrent()
$prp=new-object System.Security.Principal.WindowsPrincipal($wid)
$adm=[System.Security.Principal.WindowsBuiltInRole]::Administrator
$IsAdmin=$prp.IsInRole($adm)

if($IsAdmin -eq $false)
{
    [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
     
    [Windows.Forms.MessageBox]::Show("Please run this as an Administrator", "Not Administrator", [Windows.Forms.MessageBoxButtons]::OK,[Windows.Forms.MessageBoxIcon]::Information)

    exit
}


if ([System.Diagnostics.EventLog]::SourceExists($source) -eq $false)
{
    [System.Diagnostics.EventLog]::CreateEventSource($source, "Application")
    
    [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
    [Windows.Forms.MessageBox]::Show("Event log created successfully", "Complete", 
        [Windows.Forms.MessageBoxButtons]::OK,
        [Windows.Forms.MessageBoxIcon]::Information)
}
else
{
    [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
    [Windows.Forms.MessageBox]::Show("Event log already exists", "Complete", 
        [Windows.Forms.MessageBoxButtons]::OK,
        [Windows.Forms.MessageBoxIcon]::Information)

}
