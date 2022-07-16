 [reflection.assembly]::loadwithpartialname('System.Windows.Forms')
 [reflection.assembly]::loadwithpartialname('System.Drawing')
 $hyperstate = bcdedit /enum | findstr -i  hypervisorlaunchtype
 $notify = new-object system.windows.forms.notifyicon
 $notify.icon = [System.Drawing.SystemIcons]::Information
 $notify.visible = $true
 if ($hyperstate.Contains("Off")){
     $notify.showballoontip(10,'HyperV is OFF','VirtualBox works, WSL no.',[system.windows.forms.tooltipicon]::None)
 }
 else {
     $notify.showballoontip(10,'HyperV is ON','WSL works, VirtualBox no.',[system.windows.forms.tooltipicon]::None)
 }