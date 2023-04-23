<#
  Requires MicrosoftPowerBIMgmt module
  Install-Module -Name MicrosoftPowerBIMgmt 
#>

Login-PowerBI  -Environment Public # Will open 2FA window if needed

$Workspaces = Get-PowerBIWorkspace -Scope Organization

$TodaysDate = Get-Date -Format "DD_MM_YYYY"

$OutPutPath = "[FilePath]\PowerBIReportsBackup\" + $TodaysDate 

CLS # Clear output window

 ForEach($Workspace in $PBIWorkspace)
 {
     #For all workspaces there is a new Folder destination: Outputpath + Workspacename
     $Folder = $OutPutPath + "\" + $Workspace.name
     #If the folder doens't exists, it will be created.
     If(!(Test-Path $Folder))
     {
         New-Item -ItemType Directory -Force -Path $Folder
     }

     #Collect all (or one) of the reports from all
     $PBIReports = Get-PowerBIReport -WorkspaceId $Workspace.Id #Name can be used to filter                        

         ForEach($Report in $PBIReports)
         {
             Write-Host "Downloading "$Workspace.name":" $Report.name

             #The final collection including folder structure + file name is created.
             $OutputFile = $OutPutPath + "\" + $Workspace.name + "\" + $Report.name + ".pbix"

             # If the file exists, delete it first; otherwise, the Export-PowerBIReport will fail.
              if (Test-Path $OutputFile)
                 {
                     Remove-Item $OutputFile
                 }

             # The pbix is now really getting downloaded
              Export-PowerBIReport -WorkspaceId $Workspace.ID -Id $Report.ID -OutFile $OutputFile
              # TODO: Try Catch for Export error
         }
 }