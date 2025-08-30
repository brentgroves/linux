# AI overview Install Chrome

To install Google Chrome on Ubuntu, the easiest methods are either to download the .deb package from the Google Chrome website and then open it with the Ubuntu Software Center or use the terminal by downloading the file with wget and then installing it with sudo dpkg -i followed by sudo apt --fix-broken install to resolve dependencies.

Method 1: Using the Google Chrome Website and the Terminal
Open the Terminal: Press Ctrl + Alt + T or search for "Terminal" in the applications menu.
Update the Package List: Run the command sudo apt update to ensure your system's package list is up to date.
Download the Chrome .deb File: Execute the following command to download the latest stable 64-bit Google Chrome .deb package directly from Google's servers:
Code

    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
Install the Package: Use the dpkg command to install the downloaded file:
Code

    sudo dpkg -i google-chrome-stable_current_amd64.deb
Fix Dependencies: After installation, run this command to fix any potential missing dependencies:
Code

    sudo apt --fix-broken install
Launch Chrome: Google Chrome will now be available in your Ubuntu applications menu.
Method 2: Using the Google Chrome Website and the Graphical Interface

1. Download the .deb File:
.
Go to the Google Chrome website and click the "Download Chrome" button.
2. Select the .deb File:
.
Choose the 64-bit .deb option for Debian/Ubuntu and click "Accept and Install" to download the installer file.
3. Open the Downloaded File:
.
Navigate to your Downloads folder and double-click the downloaded .deb file.
4. Install the Application:
.
This action should open the file in the Ubuntu Software Center, from which you can click the "Install" button and follow the on-screen instructions to complete the installation.
How to Install Chrome on Ubuntu 24.04: Step-by-Step
Nov 11, 2024 — DEB installation file. To get started, head to Google Chrome's website and click the download link as shown below. The...

Cherry Servers

How to Install Chrome on Ubuntu - GeeksforGeeks
Jul 12, 2025 — This approach is especially useful for users who prefer using the Terminal. If you are Installing Chrome in Ubuntu via...

GeeksforGeeks

How to Install Google Chrome on Ubuntu - LightNode VPS
Aug 14, 2024 — Installation Methods *Open the terminal by pressing Ctrl + Alt + T or searching for "Terminal" in the Ubuntu dash.*

LightNode

Show all
