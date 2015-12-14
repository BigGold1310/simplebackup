# Functions

# Definiere Attributes
$attribute = [io.fileattributes]::archive

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
# Überpüft ob Ordner existiert, falls nicht wird er erstellt
function CheckIfDirectoryExists($mydirectory){
	if(-not(Test-Path -Path $mydirectory )){
    	New-Item -ItemType directory -Path $mydirectory -Force
		# Directory existierte NICHT
		return, $false
	}else{
		return, $true
	}
}


# Funktionen für das Backup
function CreateBackupFolder($mytempdestination, $job){
	# 0 = Full, 1 = Inkremental, 2 = Differential
	Write-Host $mytempdestination
	if ($mytempdestination -gt 3){
		if($job -eq 0){
				$mytempdestination = $mytempdestination + "\backup\fullbackup"
				$tempdestinationcount = (Get-ChildItem -Path $mytempdestination -Directory).count
				$mytempdestination = $mytempdestination + "\fb" + $tempdestinationcount
				CheckIfDirectoryExists $mytempdestination
				return, $mytempdestination
		}elseif($job -eq 1){
				$mytempdestination = $mytempdestination + "\backup\incremental"
				$tempdestinationcount = (Get-ChildItem -Path $mytempdestination -Directory).count
				$mytempdestination = $mytempdestination + "\in" + $tempdestinationcount
				CheckIfDirectoryExists $mytempdestination
				return, $mytempdestination
		}elseif($job -eq 2){
				$mytempdestination = $mytempdestination + "\backup\differential"
				$tempdestinationcount = (Get-ChildItem -Path $mytempdestination -Directory).count
				$mytempdestination = $mytempdestination + "\di" + $tempdestinationcount
				CheckIfDirectoryExists $mytempdestination
				return, $mytempdestination
		}
	}else{
		if($job -eq 0){
				$mytempdestination = $mytempdestination + "backup\fullbackup"
				$tempdestinationcount = (Get-ChildItem -Path $mytempdestination -Directory).count
				$mytempdestination = $mytempdestination + "\fb" + $tempdestinationcount
				CheckIfDirectoryExists $mytempdestination
				return, $mytempdestination
		}elseif($job -eq 1){
				$mytempdestination = $mytempdestination + "backup\incremental"
				$tempdestinationcount = (Get-ChildItem -Path $mytempdestination -Directory).count
				$mytempdestination = $mytempdestination + "\in" + $tempdestinationcount
				CheckIfDirectoryExists $mytempdestination
				return, $mytempdestination
		}elseif($job -eq 2){
				$mytempdestination = $mytempdestination + "backup\differential"
				$tempdestinationcount = (Get-ChildItem -Path $mytempdestination -Directory).count
				$mytempdestination = $mytempdestination + "\di" + $tempdestinationcount
				CheckIfDirectoryExists $mytempdestination
				return, $mytempdestination
		}
	}
}

function BackupFolder($path, $destination, $mode){
	# Debuging! Write-Host $path
	Backup $path $destination $mode
}
function Backup($source, $destination, $mode){
	$files = Get-ChildItem -Path $source -File
	$folders = Get-ChildItem -Path $source -Directory
	foreach ($file in $files){
		# Debuging! Write-Host $file.FullName
		$tempdestination = $file.FullName.Remove(0,$config[0].length)
		if($mode -eq 2){
			# KEINE Archiv bits entfernen!
			If((Get-ItemProperty -Path $file.fullname).attributes -band $attribute){
				# Wenn archiv bit vorhanden dann
				
			}
		}elseif($mode -eq 0){		
			$tempfile = $destination + "\" + $file
			# Full Backup
			if(Test-Path $tempfile){
				If((Get-ItemProperty -Path $file.fullname).attributes -band $attribute){
					# Wenn archiv bit vorhanden dann
					# Noting to do
				}else{
					Set-ItemProperty -Path $file.FullName -Name attributes -Value ((Get-ItemProperty $file.FullName).attributes -BXOR $attribute)
				}
			}else{
				Copy-Item $file.FullName -Destination $destination
				Set-ItemProperty -Path $file.FullName -Name attributes -Value ((Get-ItemProperty $file.FullName).attributes -BXOR $attribute)
			}
		}else{
			# Archive bit muss entfernt werden!
			If((Get-ItemProperty -Path $file.fullname).attributes -band $attribute){
				# Wenn archiv bit vorhanden dann
			}
		}
	}
	foreach ($folder in $folders){
		# Generiere neue Desitnation (Subfolders)
		$newdestpath = $destination + "\" + $folder.Name
		
		# Erstelle Ordner falls noch nicht existiert
		CheckIfDirectoryExists($newdestpath)
		
		# Entferne Bit von Ordner!
		Set-ItemProperty -Path $folder.FullName -Name attributes -Value ((Get-ItemProperty $folder.FullName).attributes -BXOR $attribute)
		BackupFolder $folder.FullName $newdestpath $mode
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
