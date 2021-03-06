#========================================================================
#
# Tool Name	: EMahapps Badged control sample
# Author 	: Damien VAN ROBAEYS
# Date	 	: 04/09/2017
#
#========================================================================



[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
[System.Reflection.Assembly]::LoadWithPartialName('presentationframework') | out-null
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.dll')      | out-null  
[System.Reflection.Assembly]::LoadFrom('assembly\System.Windows.Interactivity.dll') | out-null
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.IconPacks.dll')      | out-null  

function LoadXml ($filename){
    $XamlLoader=(New-Object System.Xml.XmlDocument)
    $XamlLoader.Load($filename)
    return $XamlLoader
}

$XamlMainWindow=LoadXml("Badge_Test.xaml")
$Reader=(New-Object System.Xml.XmlNodeReader $XamlMainWindow)
$Form=[Windows.Markup.XamlReader]::Load($Reader)

########################################################################################################################################################################################################	
#*******************************************************************************************************************************************************************************************************
# 																		BUTTONS AND LABELS INITIALIZATION 
#*******************************************************************************************************************************************************************************************************
########################################################################################################################################################################################################

$Badge1  = $Form.FindName("Badge1")
$Badge2  = $Form.FindName("Badge2")
$Badge3  = $Form.FindName("Badge3")
$Badge4  = $Form.FindName("Badge4")
$Badge5  = $Form.FindName("Badge5")
$Badge6  = $Form.FindName("Badge6")
$Badge7  = $Form.FindName("Badge7")
$Badge8  = $Form.FindName("Badge8")
$Badge9  = $Form.FindName("Badge9")
$Badge10  = $Form.FindName("Badge10")
$Badge11  = $Form.FindName("Badge11")
$Badge12  = $Form.FindName("Badge12")
$Badge13  = $Form.FindName("Badge13")
$Badge14  = $Form.FindName("Badge14")
$Badge15  = $Form.FindName("Badge15")

$System_error  = $Form.FindName("System_error")
$Appli_error  = $Form.FindName("Appli_error")
$System_sort  = $Form.FindName("System_sort")
$Appli_sort  = $Form.FindName("Appli_sort")

$Badge_Tabitem1  = $Form.FindName("Badge_Tabitem1")
$Badge_Tabitem2  = $Form.FindName("Badge_Tabitem2")
$Badge_Tabitem3  = $Form.FindName("Badge_Tabitem3")

$Badge1.Badge  = "5"
$Badge2.Badge  = "5"
$Badge3.Badge  = "5"
$Badge4.Badge  = "5"
$Badge5.Badge  = "5"
$Badge6.Badge  = "5"
$Badge7.Badge  = "5"
$Badge8.Badge  = "5"
$Badge9.Badge  = "5"
$Badge10.Badge  = "5"
$Badge11.Badge  = "5"
$Badge12.Badge  = "5"
$Badge13.Badge  = "5"
$Badge14.Badge  = "5"
$Badge15.Badge  = "5"

$Badge_Tabitem1.Badge  = "2"
$Badge_Tabitem2.Badge  = "5"
$Badge_Tabitem3.Badge  = "7"

$Date = (Get-Date).AddDays(-1)

$System_Log = (Get-EventLog -LogName System -After $Date -EntryType Error).count
$Appli_Log = (Get-EventLog -LogName Application -After $Date -EntryType Error).count

$System_error.Badge  = $System_Log
$Appli_error.Badge  = $Appli_Log

If ($System_Log -ne "0")
	{
		$System_error.BadgeBackground  = "Red"		
	}
Else
	{
		$System_error.BadgeBackground  = "Green"		
	}


If ($Appli_Log -ne "0")
	{
		$Appli_error.BadgeBackground  = "Red"		
	}
Else
	{
		$Appli_error.BadgeBackground  = "Green"		
	}

	
$System_sort.Add_Click({	
	(Get-EventLog -LogName System -After $Date -EntryType Error) | out-gridview
})	
	
	
$Appli_sort.Add_Click({	
	(Get-EventLog -LogName Application -After $Date -EntryType Error) | out-gridview
})	
		

$Form.ShowDialog() | Out-Null

