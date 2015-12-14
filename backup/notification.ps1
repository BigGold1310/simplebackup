$notification = New-Object System.Windows.Forms.NotifyIcon 
#Define the icon for the system tray
$notification.Icon = [System.Drawing.SystemIcons]::Warning

#Display title of balloon window
$notificationtext = “Backup Finished”
$notification.BalloonTipTitle = $notificationtext

#Type of balloon icon
$notification.BalloonTipIcon = “Warning”

#Notification message
$notificationtitle = "Backup Finished"
$notification.BalloonTipText = $notificationtitle

#Make balloon tip visible when called
$notification.Visible = $True

## Register a click event with action to take based on event
#Balloon message clicked
register-objectevent $notification BalloonTipClicked BalloonClicked_event -Action {[System.Windows.Forms.MessageBox]::Show(“Balloon message clicked”,”Information”);$notification.Close()} | Out-Null

#Balloon message closed
register-objectevent $notification BalloonTipClosed BalloonClosed_event -Action {[System.Windows.Forms.MessageBox]::Show(“Balloon message closed”,”Information”);$notification.Close()} | Out-Null

#Call the balloon notification
$notification.ShowBalloonTip(600)
