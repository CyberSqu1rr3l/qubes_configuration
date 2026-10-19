SEQUENCE
--------
1. Listing available USB devices:
```
[user@dom0 ~]$ qvm-usb
BACKEND:DEVID   DESCRIPTION                           USED BY
sys-usb:2-5     [VENDOR_ID] Sample_USB_2.0_Camera
sys-usb:2-1     [VENDOR_ID] Sample_USB_Optical_Mouse
```

2. Attaching selected USB device:
```
[user@dom0 ~]$ qvm-usb attach work sys-usb:2-5
[user@dom0 ~]$ qvm-usb
BACKEND:DEVID   DESCRIPTION                           USED BY
sys-usb:2-5     [VENDOR_ID] Sample_USB_2.0_Camera     work
sys-usb:2-1     [VENDOR_ID] Sample_USB_Optical_Mouse
```

3. Mount and unmount the device in the qube:
```
[user@work ~]$ sudo mkdir /media/usb-drive
[user@work ~]$ sudo fdisk -l
[user@work ~]$ umount /media/usb-drive/
```

4. Detach the device from the qube in dom0:
```
[user@dom0 ~]$ qvm-usb detach work sys-usb:2-5
[user@dom0 ~]$ qvm-usb
BACKEND:DEVID   DESCRIPTION                           USED BY
sys-usb:2-5     [VENDOR_ID] Sample_USB_2.0_Camera
sys-usb:2-1     [VENDOR_ID] Sample_USB_Optical_Mouse
```

LINKS
-----
https://www.qubes-os.org/doc/how-to-use-usb-devices/
