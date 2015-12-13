# Powershell Fenster unterdrücken
#$t = '[DllImport("user32.dll")] public static extern bool ShowWindow(int handle, int state);'
#add-type -name win -member $t -namespace native
#[native.win]::ShowWindow(([System.Diagnostics.Process]::GetCurrentProcess() | Get-Process).MainWindowHandle, 0)

#Generated Form Function

# General Variables

$configPath = "C:\Backup\config.txt"


# Load Files
. "C:\Backup\functions.ps1"


function GenerateForm {

#region Import the Assemblies
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
#endregion

#region Generated Form Objects
$form1 = New-Object System.Windows.Forms.Form
$error = New-Object System.Windows.Forms.Label
$button5 = New-Object System.Windows.Forms.Button
$label5 = New-Object System.Windows.Forms.Label
$progressBar1 = New-Object System.Windows.Forms.ProgressBar
$button4 = New-Object System.Windows.Forms.Button
$button3 = New-Object System.Windows.Forms.Button
$comboBox1 = New-Object System.Windows.Forms.ComboBox
$button2 = New-Object System.Windows.Forms.Button
$button1 = New-Object System.Windows.Forms.Button
$textBox2 = New-Object System.Windows.Forms.TextBox
$textBox1 = New-Object System.Windows.Forms.TextBox
$label4 = New-Object System.Windows.Forms.Label
$label3 = New-Object System.Windows.Forms.Label
$label2 = New-Object System.Windows.Forms.Label
$pictureBox1 = New-Object System.Windows.Forms.PictureBox
$label1 = New-Object System.Windows.Forms.Label
$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
#endregion Generated Form Objects

#----------------------------------------------
#Generated Event Script Blocks
#----------------------------------------------
#Provide Custom Code for events specified in PrimalForms.
$handler_button2_Click= 
{
#TODO: Place custom script here
$form1.close()
}

$button5_OnClick= 
{
#TODO: Place custom script here START
	if ((($textBox1.TextLength -gt 0) -and ($textBox2.TextLength -gt 0) -and ($comboBox1.Text.Length -gt 0))){
		switch ($comboBox1.Text) 
	    	{ 
	     	   "Only Fullbackup" {[float]$backupart=0} 
	     	   "Full and Incremental" {[float]$backupart=1} 
	     	   "Full and Differential" {[float]$backupart=2} 
	    	}
		#Überprüfung der Error Box ob ein Wert vorhanden ist 
		$error.Text = $null
		#Schreiben des Config Files
		$source = $textBox1.Text
		$destination = $textBox2.Text
		Out-File -FilePath $configPath -InputObject $source -Append
		Out-File -FilePath $configPath -InputObject $destination -Append
		Out-File -FilePath $configPath -InputObject $backupart -Append
		
		#Check if only is File System / Disk
		if ($destination -gt 3){
			# Erstelle Destination Ordnerstruktur!
			$fullbackup = $destination + "\backup\fullbackup"
			if(!(Test-Path -Path $fullbackup )){
			   	New-Item -ItemType directory -Path $fullbackup
			}
			if ($backupart -eq 1){
				# Erstelle Destination Ordnerstruktur!
				$incremental = $destination + "\backup\incremental"
				if(!(Test-Path -Path $incremental )){
			    	New-Item -ItemType directory -Path $incremental
				}
			}elseif($backupart -eq 2){
				# Erstelle Destination Ordnerstruktur!
				$differential = $destination + "\backup\differential"
				if(!(Test-Path -Path $differential )){
			    	New-Item -ItemType directory -Path $differential
				}
			}
		}else{
			# Erstelle Destination Ordnerstruktur!
			$fullbackup = $destination + "\backup\fullbackup"
			if(!(Test-Path -Path $fullbackup )){
			   	New-Item -ItemType directory -Path $fullbackup
			}
			if ($backupart -eq 1){
				# Erstelle Destination Ordnerstruktur!
				$incremental = $destination + "\backup\incremental"
				if(!(Test-Path -Path $incremental )){
			    	New-Item -ItemType directory -Path $incremental
				}
			}elseif($backupart -eq 2){
				# Erstelle Destination Ordnerstruktur!
				$differential = $destination + "\backup\differential"
				if(!(Test-Path -Path $differential )){
			    	New-Item -ItemType directory -Path $differential
				}
			}
		}
		# Erstelle Shortcut
		CreateShortcut
		#Backup starten
		Backup($source, $destination, $mode)
		
		
		$form1.Close()
	}else{
		$error.Text = "ERROR: 4587 - Please fill in the paths and selecta backup type!"
	}

}

$handler_button1_Click= 
{
#TODO: Place custom script here SAVE

	if ((($textBox1.TextLength -gt 0) -and ($textBox2.TextLength -gt 0) -and ($comboBox1.Text.Length -gt 0))){
		switch ($comboBox1.Text) 
	    	{ 
	     	   "Only Fullbackup" {[float]$backupart=0} 
	     	   "Full and Incremental" {[float]$backupart=1} 
	     	   "Full and Differential" {[float]$backupart=2} 
	    	}
		#Überprüfung der Error Box ob ein Wert vorhanden ist 
		$error.Text = $null
		#Schreiben des Config Files
		$source = $textBox1.Text
		$destination = $textBox2.Text
		Out-File -FilePath $configPath -InputObject $source -Append
		Out-File -FilePath $configPath -InputObject $destination -Append
		Out-File -FilePath $configPath -InputObject $backupart -Append
		
		#Check if only is File System / Disk
		if ($destination -gt 3){
			# Erstelle Destination Ordnerstruktur!
			$fullbackup = $destination + "\backup\fullbackup"
			if(!(Test-Path -Path $fullbackup )){
			   	New-Item -ItemType directory -Path $fullbackup
			}
			if ($backupart -eq 1){
				# Erstelle Destination Ordnerstruktur!
				$incremental = $destination + "\backup\incremental"
				if(!(Test-Path -Path $incremental )){
			    	New-Item -ItemType directory -Path $incremental
				}
			}elseif($backupart -eq 2){
				# Erstelle Destination Ordnerstruktur!
				$differential = $destination + "\backup\differential"
				if(!(Test-Path -Path $differential )){
			    	New-Item -ItemType directory -Path $differential
				}
			}
		}else{
			# Erstelle Destination Ordnerstruktur!
			$fullbackup = $destination + "\backup\fullbackup"
			if(!(Test-Path -Path $fullbackup )){
			   	New-Item -ItemType directory -Path $fullbackup
			}
			if ($backupart -eq 1){
				# Erstelle Destination Ordnerstruktur!
				$incremental = $destination + "\backup\incremental"
				if(!(Test-Path -Path $incremental )){
			    	New-Item -ItemType directory -Path $incremental
				}
			}elseif($backupart -eq 2){
				# Erstelle Destination Ordnerstruktur!
				$differential = $destination + "\backup\differential"
				if(!(Test-Path -Path $differential )){
			    	New-Item -ItemType directory -Path $differential
				}
			}
		}		
				
		$form1.Close()
	}else{
		$error.Text = "ERROR: 4587 - Please fill in the paths and selecta backup type!"
	}
}

$handler_comboBox1_SelectedIndexChanged= 
{
#TODO: Place custom script here

}

$handler_label5_Click= 
{
#TODO: Place custom script here

}

$handler_pictureBox1_Click= 
{
#TODO: Place custom script here

}

$button3_OnClick= {
	#TODO: Place custom script here 
	$source1 = Select-Folder 'Select the folder!' 

	$textBox1.text = $source1
}

$handler_label1_Click= 
{
#TODO: Place custom script here

}

$handler_button4_Click= 
{
	#TODO: Place custom script here
	
	$source2 = Select-Folder 'Select the folder you want!'
	$sourcedisk = (Get-Item $source2).PSDrive.Name
	$diskstring = "DeviceID='" + $sourcedisk + ":'"
	$disk = Get-WmiObject Win32_LogicalDisk -Filter $diskstring |
	Select-Object Size,FreeSpace

	$textBox2.text = $source2
	$progressBar1.Value = [Math]::round((($disk.freespace/$disk.size) * 100))
}

$OnLoadForm_StateCorrection=
{#Correct the initial state of the form to prevent the .Net maximized form issue
	$form1.WindowState = $InitialFormWindowState
	$button1.Enabled = $false
}

#----------------------------------------------
#region Generated Form Code
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 483
$System_Drawing_Size.Width = 737
$form1.ClientSize = $System_Drawing_Size
$form1.DataBindings.DefaultDataSourceUpdateMode = 0
$form1.ForeColor = [System.Drawing.Color]::FromArgb(255,0,0,0)
$form1.Name = "form1"
$form1.Text = "Primal Form"


$error.DataBindings.DefaultDataSourceUpdateMode = 0
$error.ForeColor = [System.Drawing.Color]::FromArgb(255,255,0,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 48
$System_Drawing_Point.Y = 179
$error.Location = $System_Drawing_Point
$error.Name = "error"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 638
$error.Size = $System_Drawing_Size
$error.TabIndex = 15

$form1.Controls.Add($error)


$button5.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 321
$System_Drawing_Point.Y = 431
$button5.Location = $System_Drawing_Point
$button5.Name = "button5"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 99
$button5.Size = $System_Drawing_Size
$button5.TabIndex = 14
$button5.Text = "Start"
$button5.UseVisualStyleBackColor = $True
$button5.add_Click($button5_OnClick)

$form1.Controls.Add($button5)

$label5.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 48
$System_Drawing_Point.Y = 311
$label5.Location = $System_Drawing_Point
$label5.Name = "label5"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 30
$System_Drawing_Size.Width = 93
$label5.Size = $System_Drawing_Size
$label5.TabIndex = 13
$label5.Text = "Free space of destination"
$label5.add_Click($handler_label5_Click)

$form1.Controls.Add($label5)

$progressBar1.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 158
$System_Drawing_Point.Y = 311
$progressBar1.Location = $System_Drawing_Point
$progressBar1.Name = "progressBar1"

############################################################################################################
############################################################################################################
$progressBar1.Value = 100

$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 481
$progressBar1.Size = $System_Drawing_Size
$progressBar1.TabIndex = 12

$form1.Controls.Add($progressBar1)


$button4.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 532
$System_Drawing_Point.Y = 263
$button4.Location = $System_Drawing_Point
$button4.Name = "button4"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 107
$button4.Size = $System_Drawing_Size
$button4.TabIndex = 11
$button4.Text = "Browse"
$button4.UseVisualStyleBackColor = $True
$button4.add_Click($handler_button4_Click)

$form1.Controls.Add($button4)


$button3.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 531
$System_Drawing_Point.Y = 213
$button3.Location = $System_Drawing_Point
$button3.Name = "button3"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 107
$button3.Size = $System_Drawing_Size
$button3.TabIndex = 10
$button3.Text = "Browse"
$button3.UseVisualStyleBackColor = $True
$button3.add_Click($button3_OnClick)

$form1.Controls.Add($button3)

$comboBox1.DataBindings.DefaultDataSourceUpdateMode = 0
$comboBox1.FormattingEnabled = $True
$comboBox1.Items.Add("Only Fullbackup")|Out-Null
$comboBox1.Items.Add("Full and Incremental")|Out-Null
$comboBox1.Items.Add("Full and Differential")|Out-Null
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 158
$System_Drawing_Point.Y = 358
$comboBox1.Location = $System_Drawing_Point
$comboBox1.Name = "comboBox1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 21
$System_Drawing_Size.Width = 190
$comboBox1.Size = $System_Drawing_Size
$comboBox1.TabIndex = 9
$comboBox1.add_SelectedIndexChanged($handler_comboBox1_SelectedIndexChanged)

$form1.Controls.Add($comboBox1)


$button2.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 544
$System_Drawing_Point.Y = 431
$button2.Location = $System_Drawing_Point
$button2.Name = "button2"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 95
$button2.Size = $System_Drawing_Size
$button2.TabIndex = 8
$button2.Text = "Exit"
$button2.UseVisualStyleBackColor = $True
$button2.add_Click($handler_button2_Click)

$form1.Controls.Add($button2)


$button1.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 438
$System_Drawing_Point.Y = 431
$button1.Location = $System_Drawing_Point
$button1.Name = "button1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 87
$button1.Size = $System_Drawing_Size
$button1.TabIndex = 7
$button1.Text = "Save "
$button1.UseVisualStyleBackColor = $True
$button1.add_Click($handler_button1_Click)

$form1.Controls.Add($button1)

$textBox2.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 158
$System_Drawing_Point.Y = 265
$textBox2.Location = $System_Drawing_Point
$textBox2.Name = "textBox2"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 367
$textBox2.Size = $System_Drawing_Size
$textBox2.TabIndex = 6

$form1.Controls.Add($textBox2)

$textBox1.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 158
$System_Drawing_Point.Y = 215
$textBox1.Location = $System_Drawing_Point
$textBox1.Name = "textBox1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 367
$textBox1.Size = $System_Drawing_Size
$textBox1.TabIndex = 5

$form1.Controls.Add($textBox1)

$label4.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 48
$System_Drawing_Point.Y = 358
$label4.Location = $System_Drawing_Point
$label4.Name = "label4"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 21
$System_Drawing_Size.Width = 100
$label4.Size = $System_Drawing_Size
$label4.TabIndex = 4
$label4.Text = "Type"

$form1.Controls.Add($label4)

$label3.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 48
$System_Drawing_Point.Y = 265
$label3.Location = $System_Drawing_Point
$label3.Name = "label3"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 26
$System_Drawing_Size.Width = 101
$label3.Size = $System_Drawing_Size
$label3.TabIndex = 3
$label3.Text = "Destination Path"

$form1.Controls.Add($label3)

$label2.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 48
$System_Drawing_Point.Y = 210
$label2.Location = $System_Drawing_Point
$label2.Name = "label2"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 28
$System_Drawing_Size.Width = 104
$label2.Size = $System_Drawing_Size
$label2.TabIndex = 2
$label2.Text = "Source Path"
$label2.TextAlign = 16

$form1.Controls.Add($label2)


$pictureBox1.DataBindings.DefaultDataSourceUpdateMode = 0


$pictureBox1.ImageLocation = "C:\Users\Manuel Kühne\Documents\TBZ\ICT\Modul 122\Projekt 2\Bilder\green-wave-wallpaper-1920x1080.jpg"

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 48
$System_Drawing_Point.Y = 91
$pictureBox1.Location = $System_Drawing_Point
$pictureBox1.Name = "pictureBox1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 70
$System_Drawing_Size.Width = 638
$pictureBox1.Size = $System_Drawing_Size
$pictureBox1.SizeMode = 1
$pictureBox1.TabIndex = 1
$pictureBox1.TabStop = $False
$pictureBox1.add_Click($handler_pictureBox1_Click)

$form1.Controls.Add($pictureBox1)

$label1.DataBindings.DefaultDataSourceUpdateMode = 0
$label1.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",15.55,0,3,1)
$label1.ForeColor = [System.Drawing.Color]::FromArgb(255,0,0,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 278
$System_Drawing_Point.Y = 25
$label1.Location = $System_Drawing_Point
$label1.Name = "label1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 36
$System_Drawing_Size.Width = 168
$label1.Size = $System_Drawing_Size
$label1.TabIndex = 0
$label1.Text = "Backup"
$label1.TextAlign = 32
$label1.add_Click($handler_label1_Click)

$form1.Controls.Add($label1)

#endregion Generated Form Code

#Save the initial state of the form
$InitialFormWindowState = $form1.WindowState
#Init the OnLoad event to correct the initial state of the form
$form1.add_Load($OnLoadForm_StateCorrection)
#Show the Form
$form1.ShowDialog()| Out-Null

} #End Function

#$configexists = CheckIfConfigExist($configPath)
#$content = Get-Content $configPath
if ((CheckIfConfigExist($configPath) -eq $true) -and -not((Get-Content $configPath) -eq $null)){
	# Open Config Loading Script, Open New GUI depending on Config Options!
	$config = Get-Content C:\Backup\config.txt
	$mode = $config[2]
	
	# Öffne Backup Hinweis!
	. "C:\Backup\backuphinweis.ps1"
}else{
#Call the Function
GenerateForm
}
