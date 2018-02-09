# dir $env:windir/* -include *dll,*exe,*ini|sort extension|ft -GroupBy extension
# help -full irm

# $url = 'http://rss.cnn.com/rss/edition.rss'
# irm $url|ft tit*,desc* -AutoSize -Wrap|Out-String -Width 140

# $url = 'http://rss.cnn.com/rss/edition.rss'
# irm $url|ft tit*,desc* -AutoSize -Wrap|Out-String -Width 140

# Get-Acl -Path 'D:\Users\Public\Documents\Hyper-V\Virtual Hard Disks\Windows10Preview.vhdx' | Fl AccessToString


# Get-ADUser -filter * -results 200000 -properties samaccountname,name,cn,altrecipient | where {($_.altrecipient -like "*@*") -and ($_.altrecipient -notlike "*@gapps.*")} |select Name,samaccountname,distinguishedname,altrecipient | export-csv c:\temp\ps\FSforwards.csv

# Get all FS users (only current) who are forwarded to personal email (not gmail)
#Get-ADUser -filter * -results 200000 -properties samaccountname,name,cn,altrecipient | where {($_.distinguishedname -notlike "*emeritus*") -and ($_.distinguishedname -notlike "*ou=old*") -and ($_.altrecipient -like "*@*") -and ($_.altrecipient -notlike "*@gapps.*")} |select Name,samaccountname,distinguishedname,altrecipient | export-csv c:\temp\ps\currentFSforwards.csv

#$username = 'rdurossette'
#Get-Member -InputObject $username -MemberType All


Get-ADGroupMember "CopyFromADGroup" |  Get-ADUser | Foreach-Object {Add-ADGroupMember -Identity "CopyToADGroup" -Members $_}

