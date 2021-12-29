# WSL Automated Setup
<table>
    <tr>
        <td>
The WSL Automated Setup project is a set of scripts that can make the installation and creation of custom distros for WSL a simple process. It allows a user to create a custom WSL install and tear it down again when no longer needed or broken. 

The purpose of the scripts in this repo are to make the creation of development ready WSL distros easy by 
automating the creation of a custom distro using Docker containers.
    </td>
    <td>
    <img src="./resources/images/wsl-preview.jpg"
     alt="WSL Installations" />
        </td>
    </tr>
</table>

___
## Installation Instructions

> ### Prerequisites
> For the installation you will need the following:
> - Docker Desktop
> - Git (If cloning the repository)
  
___
### If WSL is enabled already
If you have got WSL and WSL2 enabled already on your computer and you have Docker Desktop installed you simply
need to run the build_environment.bat file in this folder. This script will build a Docker container using a
Dockerfile which installs the required applications for development eg... Java, Maven, Python and Docker.
As part of getting WSL2 working correctly behind the company VPN there is also some network configuration
that is done as part of the script. This will also add a start up script that will run whenever you start up Windows
this script requires administrative privileges so will ask for permission to run on login.

If for whatever reason you want to remove the installed WSL distro you can run the remove_environment.bat
which will remove the distro and the network configurations. To re-install the custom WSL distro again just 
re-run the build_environment.bat and it will install a fresh distro.
___
### If WSL is not already enabled on your computer
If you have not got WSL enabled and you are using Windows 10 version 2004 or higher you can install WSL by simply running the following command in an administrator Powershell or Command Prompt window.

```
    wsl --install
```

This command will enable all of the required components, download the latest Linux kernel and set WSL 2 as your default while also installing Ubuntu by default.

***For more information check the official documentation below***

> https://docs.microsoft.com/en-us/windows/wsl/install

___
If you have an older version of Windows 10 you can enable WSL by running the scripts found in the "Initial WSL install scripts" folder. 
These scripts will enable the required features and download the required kernel update for WSL2 and install it.
The commands in these scripts are from the official Microsoft installation guide: https://docs.microsoft.com/en-us/windows/wsl/install-win10
I have just automated the instructions using batch files, however you can just follow that guide if 
you would prefer not to run them.

After runnning these scripts you will need to have Docker Desktop installed on your laptop
to continue with the installation: https://www.docker.com/products/docker-desktop

Brief Script Expalanation:

enable-wsl2-part1.bat:
This script enables the WSL and Virtual machine platform optional Windows features that are
needed to run WSL and WSL2

enable-wsl2-part2.bat: This script downloads the Linux kernel update installer required for
running WSL2, it then runs the installer.
___
***Windows 11***  
> For Windows 11 you can install WSL from the Microsoft Store. Currently in preview here: https://www.microsoft.com/store/productId/9P9TQF7MRM4R
___