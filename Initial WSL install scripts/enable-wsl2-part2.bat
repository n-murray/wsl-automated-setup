echo Downloads the WSL kernel update required to run WSL2
set source="https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi"
set output=".\wsl_update_x64.msi"

powershell -command "Invoke-WebRequest -Uri %source% -OutFile %output%"
echo Run the downloaded msi package
.\wsl_update_x64.msi
