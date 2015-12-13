# Functions


# Funktion für die Ordner auswahl
function Select-Folder($message='Select a folder', $path = 0) { 
    $object = New-Object -comObject Shell.Application  
     
    $folder = $object.BrowseForFolder(0, $message, 0, $path) 
    if ($folder -ne $null) { 
        $folder.self.Path 
    }
}
# Prüft ob die Config und der Ordner Existiert
function CheckIfConfigExist($configPath){
	If(-not(Test-Path -path $configPath)){
		New-Item -Path $configPath -ItemType file -force
		return, $false
	}
	Else{
		# Return -> File exists -> Config would be done!
		return, $true
	}
}


# Funktionen für das Backup
function BackupFolder($path, $destination, $mode){
	Write-Host $path
	Backup($path, $destination, $mode)
}
function Backup($source, $destination, $mode){
	$files = Get-ChildItem -Path $source -File
	$folders = Get-ChildItem -Path $source -Directory
	foreach ($file in $files){
		Write-Host $file.FullName
	}
	foreach ($folder in $folders){
		BackupFolder($folder.FullName, $destination, $mode)
	}
}

# Erstelle Shortcut
function CreateShortcut(){
	$wshShellObject = New-Object -com WScript.Shell
	$userProfileFolder = (get-childitem env:USERPROFILE).Value
	$wshShellLink = $wshShellObject.CreateShortcut($userProfileFolder+"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\backup.lnk") 
	$wshShellLink.TargetPath = "C:\Backup\backup.ps1"
	$wshShellLink.Save()
}
