#Generated Form Function
function GenerateForm {

#region Import the Assemblies
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
#endregion

#region Generated Form Objects
$form2 = New-Object System.Windows.Forms.Form
$label3 = New-Object System.Windows.Forms.Label
$label2 = New-Object System.Windows.Forms.Label
$backup = New-Object System.Windows.Forms.Label
$inkremental = New-Object System.Windows.Forms.Button
$differential = New-Object System.Windows.Forms.Button
$full = New-Object System.Windows.Forms.Button
$image = New-Object System.Windows.Forms.Button
$exit = New-Object System.Windows.Forms.Button
$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
#endregion Generated Form Objects

#----------------------------------------------
#Generated Event Script Blocks
#----------------------------------------------
#Provide Custom Code for events specified in PrimalForms.
$handler_differential_Click= 
{
#TODO: Place custom script here
	$newdestination = CreateBackupFolder $path 2
	[string]$path2 = $newdestination[0]
	$job = 2
	Backup $source $path2 $job
	. "C:\Backup\notification.ps1"
}

$handler_full_Click= 
{
#TODO: Place custom script here
	$newdestination = CreateBackupFolder $path 0
	[string]$path2 = $newdestination[0]
	$job = 0
	$form2.Close()
	Backup $source $path2 $job
	. "C:\Backup\notification.ps1"
}

$handler_image_Click= 
{
#Erstellen des Images
Start-Process powershell -verb runas -ArgumentList "-file C:\Backup\image.ps1"
$form2.Close()
}

$handler_label2_Click= 
{
#TODO: Place custom script here

}

$handler_incremental_Click= 
{
#TODO: Place custom script here
	$newdestination = CreateBackupFolder $path 1
	[string]$path2 = $newdestination[0]
	$job = 1
	$form2.Close()
	Backup $source $path2 $job
	. "C:\Backup\notification.ps1"
}

$handler_exit_Click= 
{
#TODO: Place custom script here

# Exit Button!
$form2.Close()

}

$OnLoadForm_StateCorrection=
{#Correct the initial state of the form to prevent the .Net maximized form issue
	$form2.WindowState = $InitialFormWindowState
	if ($mode -eq 0){
		$inkremental.Enabled = $false
		$differential.Enabled = $false
	}elseif($mode -eq 1){
		$differential.Enabled = $false
	}else{
		$inkremental.Enabled = $false
	}
}

#----------------------------------------------
#region Generated Form Code
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 168
$System_Drawing_Size.Width = 427
$form2.ClientSize = $System_Drawing_Size
$form2.DataBindings.DefaultDataSourceUpdateMode = 0
$form2.Name = "form2"
$form2.Text = "Backup"

$label3.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 13
$System_Drawing_Point.Y = 87
$label3.Location = $System_Drawing_Point
$label3.Name = "label3"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 33
$System_Drawing_Size.Width = 398
$label3.Size = $System_Drawing_Size
$label3.TabIndex = 7
$label3.Text = "Falls Sie dieses PopUp nicht mehr möchten können Sie die Verknüpfung 'backup.lnk' im Autostart Ordner löschen! "

$form2.Controls.Add($label3)

$label2.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 13
$System_Drawing_Point.Y = 37
$label2.Location = $System_Drawing_Point
$label2.Name = "label2"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 46
$System_Drawing_Size.Width = 398
$label2.Size = $System_Drawing_Size
$label2.TabIndex = 6
$label2.Text = "Wir empfehlen Regelmässig Backups zu erstellen! Dazwischen empfehlen wir, dass regelmässig ein Fullbackup zu den Incrementellen oder Differenziellen erstellt wird!"
$label2.add_Click($handler_label2_Click)

$form2.Controls.Add($label2)

$backup.DataBindings.DefaultDataSourceUpdateMode = 0
$backup.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",11.25,0,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 13
$System_Drawing_Point.Y = 13
$backup.Location = $System_Drawing_Point
$backup.Name = "backup"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 398
$backup.Size = $System_Drawing_Size
$backup.TabIndex = 5
$backup.Text = "Backup Tipp"

$form2.Controls.Add($backup)


$inkremental.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 12
$System_Drawing_Point.Y = 136
$inkremental.Location = $System_Drawing_Point
$inkremental.Name = "inkremental"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 75
$inkremental.Size = $System_Drawing_Size
$inkremental.TabIndex = 4
$inkremental.Text = "Inkremental"
$inkremental.UseVisualStyleBackColor = $True
$inkremental.add_Click($handler_incremental_Click)

$form2.Controls.Add($inkremental)


$differential.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 93
$System_Drawing_Point.Y = 136
$differential.Location = $System_Drawing_Point
$differential.Name = "differential"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 75
$differential.Size = $System_Drawing_Size
$differential.TabIndex = 3
$differential.Text = "Differential"
$differential.UseVisualStyleBackColor = $True
$differential.add_Click($handler_differential_Click)

$form2.Controls.Add($differential)


$full.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 174
$System_Drawing_Point.Y = 136
$full.Location = $System_Drawing_Point
$full.Name = "full"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 75
$full.Size = $System_Drawing_Size
$full.TabIndex = 2
$full.Text = "Full"
$full.UseVisualStyleBackColor = $True
$full.add_Click($handler_full_Click)

$form2.Controls.Add($full)


$image.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 255
$System_Drawing_Point.Y = 136
$image.Location = $System_Drawing_Point
$image.Name = "image"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 75
$image.Size = $System_Drawing_Size
$image.TabIndex = 1
$image.Text = "Image"
$image.UseVisualStyleBackColor = $True
$image.add_Click($handler_image_Click)

$form2.Controls.Add($image)


$exit.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 336
$System_Drawing_Point.Y = 136
$exit.Location = $System_Drawing_Point
$exit.Name = "exit"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 75
$exit.Size = $System_Drawing_Size
$exit.TabIndex = 0
$exit.Text = "Exit"
$exit.UseVisualStyleBackColor = $True
$exit.add_Click($handler_exit_Click)

$form2.Controls.Add($exit)

#endregion Generated Form Code

#Save the initial state of the form
$InitialFormWindowState = $form2.WindowState
#Init the OnLoad event to correct the initial state of the form
$form2.add_Load($OnLoadForm_StateCorrection)
#Show the Form
$form2.ShowDialog()| Out-Null

} #End Function

#Call the Function
GenerateForm
