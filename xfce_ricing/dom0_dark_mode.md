INSTALLATION
------------
```
[user@dom0 ~]$ sudo qubes-dom0-update adwaita-qt5
[root@dom0 ~]# echo "QT_STYLE_OVERRIDE=adwaita-dark" >> /etc/environment
[user@dom0 ~]$ sudo reboot

[user@dom0 ~]$ sudo qubes-dom0-update qt5-qtstyleplugins
[root@dom0 ~]# echo "QT_QPA_PLATFORMTHEME=gtk2" >> /etc/environment
[user@dom0 ~]$ sudo reboot
```

TROUBLESHOOTING
---------------
```
[root@dom0 ~]# echo "QT_QPA_PLATFORMTHEME=gt5ct" >> /etc/environment
```

Try `xfce4-panel -r` in dom0 to reset the panel preferences. Alternatively, have a look at `/usr/share/themes/Oroborus/xfwm4` and edit the *themerc* file to set the `active_border_color=#303030` and `inactive_border_color=#303030` properties.

LINKS
-----
Community Forum Guide: https://forum.qubes-os.org/t/guide-xfce-global-dark-mode-in-qubes-4-0-4-1/10757

