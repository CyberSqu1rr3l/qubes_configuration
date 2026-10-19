EXPLANATION
-----------
The following instructions leave our existing login password unchanged and set up an additional password for use exclusively with a YubiKey. This allows us to
use a longer, more complex password for regular logins while reducing the risk of shoulder surfing when using the YubiKey in public. [^1]

INSTRUCTIONS
------------

1. Install software for the YubiKey in the template on which the *sys-usb* VM is based, e.g. `fedora-36-dvm`.
```text
[user@fedora-36-dvm ~]$ sudo dnf install ykpers
```

2. Shut down the template and reboot the USB VM or install the packages in the USB VM as well to avoid rebooting.

3. Install the program to authenticate with a password and YubiKey in *dom0*.
```text
[user@dom0 ~]$ sudo qubes-dom0-update qubes-yubikey-dom0
```

4. Configure the YubiKey for the *Challenge-Response HMAC-SHA1* mode in a disposable VM. In the program go to Challenge-Response, select HMAC-SHA1 and choose the Configuration Slot 2. One can optionally enable user input via button press. Use fixed 64-bit input for HMAC-SHA1 mode. Insert the YubiKey, attach it to the disposable VM and press on the button write configuration.
```text
[user@disp5621 ~]$ yubikey-personalization-gui
```

5. It is recommended to keep a backup of the AESKEY in an offline VM used as a vault. You can write the same settings into other YubiKeys. Choose "Program multiple YubiKeys" and select "Same scret for all keys".

6. Paste your AESKEY into `/etc/qubes/yk-keys/yk-secret-key.hex` in *dom0* after backing it up in vault.

7. Define a new password that is only used in combination with the YubiKey. Write this password in plaintext into `/etc/qubes/yk-keys/yk-login-pass` in *dom0*. Note, that this is considered safe as *dom0* is ultimately trusted. However, if you prefer you can paste a hashed password instead into `/etc/qubes/yk-keys/yk-login-pass-hashed.hex` in *dom0*. Calculate the hashed password using the following two commands and save them in the corresponding file.
```text
[user@dom0 ~]$ read -r pswd
[user@dom0 ~]$ echo -n "$pswd" | openssl dgst -sha1 | cut -f2 -d ' '
[user@dom0 ~]$ sudo vi /etc/qubes/yk-keys/yk-login-pass-hashed.hex
```

8. Enable multi-factor authentication for the various login services as defined in `/etc/pam.d/` by inserting 'auth include yubikey' at the beginning of the files.
```text
[user@dom0 ~]$ sudo vi /etc/pam.d/xscreensaver  # Enable login via YubiKey for default screen lock program
[user@dom0 ~]$ sudo vi /etc/pam.d/login         # Enable YubiKey login on a tty shell
[user@dom0 ~]$ sudo vi /etc/pam.d/lightdm       # Enable login for the default display manager
[user@dom0 ~]$ sudo vi /etc/pam.d/
```

9. You may need to adjust the USB VM name in case something different than *sys-usb* is used, by editing the following file in *dom0*: \
    `/etc/qubes/yk-keys/yk-vm`

TROUBLESHOOTING
---------------
May need to write configuration to the two YubiKeys one after another. The simultaneous writing to two YubiKeys does not work. But make sure to copy the AESKEY and paste it for the second key as well as in *dom0*.

[^1]: https://www.qubes-os.org/doc/yubikey/
