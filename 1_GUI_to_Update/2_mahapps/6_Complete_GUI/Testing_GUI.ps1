[System.Reflection.Assembly]::LoadWithPartialName('presentationframework') 				| out-null
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.dll')       				| out-null

function LoadXml ($global:filename)
{
    $XamlLoader=(New-Object System.Xml.XmlDocument)
    $XamlLoader.Load($filename)
    return $XamlLoader
}

# Load MainWindow
$XamlMainWindow=LoadXml("Testing_GUI.xaml")
$Reader=(New-Object System.Xml.XmlNodeReader $XamlMainWindow)
$Form=[Windows.Markup.XamlReader]::Load($Reader)

$Global:Current_Folder =(get-location).path 


########################################################################################################################################################################################################	
#*******************************************************************************************************************************************************************************************************
# 																		BUTTONS AND LABELS INITIALIZATION 
#*******************************************************************************************************************************************************************************************************
########################################################################################################################################################################################################

$network = $Form.findname("network") 


$Open_Settings = $Form.findname("Open_Settings") 
$Open_Start = $Form.findname("Open_Start") 
$button_up = $Form.findname("button_up") 


$FlyOutContent = $Form.findname("FlyOutContent") 
$FlyOutContent_Start = $Form.findname("FlyOutContent_Start") 
$FlyOutContent_Up = $Form.findname("FlyOutContent_Up") 


$network.Add_Click({
	[MahApps.Metro.Controls.Dialogs.DialogManager]::ShowMessageAsync($Form, "Hello :-)", "Oh Yeahhhh")		
})

$button_up.Add_Click({
    $FlyOutContent_Up.IsOpen = $true    
})


$Open_Settings.Add_Click({
    $FlyOutContent.IsOpen = $true    
})

$Open_Start.Add_Click({
    $FlyOutContent_Start.IsOpen = $true    
})


	
$Form.add_MouseLeftButtonDown({
   $_.handled=$true
   $this.DragMove()
})	
		
	
	
	

$Form.ShowDialog() | Out-Null

