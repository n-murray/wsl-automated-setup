echo Enable the WSL optional feature in windows
powershell -command "dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart"

echo Enable the Virtual Machine Platform required for WSL2
powershell -command "dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart"

echo "Your laptop needs to be restarted to finish installing these features. Restart now or do it later?"
powershell -command "Restart-Computer -Confirm"