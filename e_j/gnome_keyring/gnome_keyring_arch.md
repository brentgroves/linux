## **[GNOME/Keyring](https://wiki.archlinux.org/title/GNOME/Keyring)**

GNOME Keyring is "a collection of components in GNOME that store secrets, passwords, keys, certificates and make them available to applications."

It provides org.freedesktop.secrets, an API that allows client applications to store secrets securely using a service running in the user's login session.

## Manage using GUI

You can manage the contents of GNOME Keyring using Seahorse; install the seahorse package.

Passwords for keyrings (e.g., the default keyring, "Login") can be changed and even removed. See Create a new keyring and Update the keyring password in GNOME Help for more information.

## Using the keyring

The PAM module pam_gnome_keyring.so initialises GNOME Keyring partially, unlocking the login keyring in the process. The gnome-keyring-daemon is automatically started with a systemd user service.

PAM step
Note: To use automatic unlocking without automatic login, the password for the user account should be the same as the login keyring. See #Automatically change keyring password with user password.
Tip:
To use automatic unlocking with automatic login, you can set a blank password for the keyring. Note that the contents of the keyring are stored unencrypted in this case.
Alternatively, if using GDM and LUKS, GDM can unlock your keyring if it matches your LUKS password. For this to work, you need to use the systemd init in your mkinitcpio.conf as well as the appropriate kernel parameters, and you should make sure that your system's real-time clock is set to UTC rather than local time (see [2]). See [3] for more details.
If you desire to skip the PAM step, the keyring must be unlocked manually or via another method. See #Using gnome-keyring-daemon outside desktop environments (KDE, GNOME, XFCE, ...) and the GnomeKeyring wiki.
When using a display manager, the keyring works out of the box for most cases. GDM, LightDM, LXDM, and SDDM already have the necessary PAM configuration. For a display manager that does not automatically unlock the keyring edit the appropriate file instead of /etc/pam.d/login as mentioned below.

When using console-based login, edit /etc/pam.d/login:

Add auth optional pam_gnome_keyring.so at the end of the auth section and session optional pam_gnome_keyring.so auto_start at the end of the session section.

/etc/pam.d/login

# %PAM-1.0

auth       required     pam_securetty.so
auth       requisite    pam_nologin.so
auth       include      system-local-login
auth       optional     pam_gnome_keyring.so
account    include      system-local-login
session    include      system-local-login
session    optional     pam_gnome_keyring.so auto_start
Note: If using the greetd login manager, the file that needs to be modified is /etc/pam.d/greetd, instead of /etc/pam.d/login.
