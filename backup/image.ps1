#Generated Form Function
function GenerateForm {
########################################################################
# Code Generated By: SAPIEN Technologies PrimalForms (Community Edition) v1.0.10.0
# Generated On: 14.12.2015 10:38
# Generated By: Leandro
########################################################################

#region Import the Assemblies
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
#endregion

#region Generated Form Objects
$form3 = New-Object System.Windows.Forms.Form
$label3 = New-Object System.Windows.Forms.Label
$label2 = New-Object System.Windows.Forms.Label
$textBox2 = New-Object System.Windows.Forms.TextBox
$textBox1 = New-Object System.Windows.Forms.TextBox
$button2 = New-Object System.Windows.Forms.Button
$button1 = New-Object System.Windows.Forms.Button
$label1 = New-Object System.Windows.Forms.Label
$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
#endregion Generated Form Objects

#----------------------------------------------
#Generated Event Script Blocks
#----------------------------------------------
#Provide Custom Code for events specified in PrimalForms.
$handler_form3_Load= 
{
#TODO: Place custom script here

}

$handler_textBox1_TextChanged= 
{
#TODO: Place custom script here

}

$handler_label2_Click= 
{
#TODO: Place custom script here

}

$button2_OnClick= 
{
#TODO: Place custom script here

}

$handler_label1_Click= 
{
#TODO: Place custom script here

}

$handler_button1_Click= 
{
#TODO: Place custom script here

}

$OnLoadForm_StateCorrection=
{#Correct the initial state of the form to prevent the .Net maximized form issue
	$form3.WindowState = $InitialFormWindowState
}

#----------------------------------------------
#region Generated Form Code
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 202
$System_Drawing_Size.Width = 259
$form3.ClientSize = $System_Drawing_Size
$form3.DataBindings.DefaultDataSourceUpdateMode = 0
$form3.Name = "form3"
$form3.Text = "Backup"
$form3.add_Load($handler_form3_Load)

$label3.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 155
$System_Drawing_Point.Y = 72
$label3.Location = $System_Drawing_Point
$label3.Name = "label3"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 75
$label3.Size = $System_Drawing_Size
$label3.TabIndex = 6
$label3.Text = "Destination"

$form3.Controls.Add($label3)

$label2.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 28
$System_Drawing_Point.Y = 72
$label2.Location = $System_Drawing_Point
$label2.Name = "label2"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 75
$label2.Size = $System_Drawing_Size
$label2.TabIndex = 5
$label2.Text = "Source"
$label2.add_Click($handler_label2_Click)

$form3.Controls.Add($label2)

$textBox2.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 155
$System_Drawing_Point.Y = 109
$textBox2.Location = $System_Drawing_Point
$textBox2.Name = "textBox2"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 75
$textBox2.Size = $System_Drawing_Size
$textBox2.TabIndex = 4

$form3.Controls.Add($textBox2)

$textBox1.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 28
$System_Drawing_Point.Y = 109
$textBox1.Location = $System_Drawing_Point
$textBox1.Name = "textBox1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 75
$textBox1.Size = $System_Drawing_Size
$textBox1.TabIndex = 3
$textBox1.add_TextChanged($handler_textBox1_TextChanged)

$form3.Controls.Add($textBox1)


$button2.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 155
$System_Drawing_Point.Y = 158
$button2.Location = $System_Drawing_Point
$button2.Name = "button2"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 75
$button2.Size = $System_Drawing_Size
$button2.TabIndex = 2
$button2.Text = "Image Exit"
$button2.UseVisualStyleBackColor = $True
$button2.add_Click($button2_OnClick)

$form3.Controls.Add($button2)


$button1.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 28
$System_Drawing_Point.Y = 158
$button1.Location = $System_Drawing_Point
$button1.Name = "button1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 75
$button1.Size = $System_Drawing_Size
$button1.TabIndex = 1
$button1.Text = "Image Start"
$button1.UseVisualStyleBackColor = $True
$button1.add_Click($handler_button1_Click)

$form3.Controls.Add($button1)

$label1.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 59
$System_Drawing_Point.Y = 25
$label1.Location = $System_Drawing_Point
$label1.Name = "label1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 139
$label1.Size = $System_Drawing_Size
$label1.TabIndex = 0
$label1.Text = "Nur von Partition in Partition"
$label1.add_Click($handler_label1_Click)

$form3.Controls.Add($label1)

#endregion Generated Form Code

#Save the initial state of the form
$InitialFormWindowState = $form3.WindowState
#Init the OnLoad event to correct the initial state of the form
$form3.add_Load($OnLoadForm_StateCorrection)
#Show the Form
$form3.ShowDialog()| Out-Null

} #End Function

#Call the Function
GenerateForm