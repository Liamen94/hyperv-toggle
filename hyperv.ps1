[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')
 $status = bcdedit /enum | findstr -i hypervisorlaunchtype
 if ($status.contains("Off")){
     $msgBoxInput =  [System.Windows.Forms.MessageBox]::Show('HyperV is off, do you want to load it and reboot your PC?','HyperV Toggle','YesNo','Information')
     switch  ($msgBoxInput) {
     'Yes' {
         bcdedit /set hypervisorlaunchtype auto
         Restart-Computer
     }
     'No'{}  
     }
}
else{
    $msgBoxInput2 =  [System.Windows.Forms.MessageBox]::Show('HyperV is on, do you want to deactivate it and reboot your PC?','HyperV Toggle','YesNo','Information')
    switch  ($msgBoxInput2) {
    'Yes' {
        bcdedit /set hypervisorlaunchtype off
        Restart-Computer
    }
    'No'{}
  }
}