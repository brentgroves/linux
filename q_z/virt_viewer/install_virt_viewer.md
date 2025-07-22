# **[]()**

To install virt-viewer on Ubuntu, use the command sudo apt install virt-viewer. This will install the necessary package for connecting to virtual machines via the SPICE protocol. If you're using virt-manager (a GUI for managing virtual machines), it will automatically install virt-viewer as a dependency.
Here's a more detailed breakdown:
Open a terminal: You can do this by pressing Ctrl+Alt+T or searching for "Terminal" in the application menu.
Install virt-viewer: Execute the following command:
Code

   `sudo apt install virt-viewer`
(Optional) Install virt-manager: If you want a graphical interface for managing your virtual machines, you can also install virt-manager:
Code

   `sudo apt install virt-manager`
Connect to a virtual machine: Once virt-viewer is installed, you can connect to a running virtual machine using the virt-viewer command followed by the connection URI. For example:
Code

   virt-viewer -c qemu:///system 1
Replace 1 with the ID or name of your virtual machine. If you're using SPICE, the URI might look like spice://<server_address>:<port>.
(Optional) Connect from Remote Viewer: If you are connecting from a remote machine, you may need to use the Remote Viewer application, which can also be installed with the same command (or with sudo apt install virt-viewer on Ubuntu). You will need to know the server address and port for the SPICE connection.
