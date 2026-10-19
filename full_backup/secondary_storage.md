VOLUME GROUP
------------
First we'll need a separate volume group and thin pool for our secondary storage block device. \
This will create a luks partition, make sure to use the same passphrase as the main Qubes disk to avoid a second password prompt at boot:
```text
[user@dom0 ~]$ sudo cryptsetup luksFormat --hash=sha512 --key-size=512 --cipher=aes-xts-plain64 --verify-passphrase /dev/nvme1n1
```

Register the device's UUID with:
```text
[user@dom0 ~]$ sudo blkid /dev/nvme1n1
```
Add the line `luks-<UUID> UUID=<UUID> none` to the file `/etc/crypttab`:
```text
[root@dom0 ~]# echo 'luks-123e4567-e89b-42d3-a456-426614174000 UUID=123e4567-e89b-42d3-a456-426614174000 none' >> /etc/crypttab
```

Reboot the computer, so that the new luks device appears at `/dev/mapper/luks-<UUID>`:
```
[user@dom0 ~]$ sudo reboot
[user@dom0 ~]$ ls /dev/mapper/luks-*
```

CREATE POOL
-----------
First create the physical volume with: `sudo pvcreate /dev/mapper/luks-<UUID>`
```text
[user@dom0 ~]$ sudo pvcreate /dev/mapper/luks-7f3a2c91-6b84-4e0d-9a57-c218d43f6b02
```

Then create the LVM volume group, we will use *qubes* as this is used by the primary disk as well:
```text
[user@dom0 ~]$ sudo vgcreate qubes /dev/mapper/luks-7f3a2c91-6b84-4e0d-9a57-c218d43f6b02
```

We then want to set the LVM thin pool name to *pool2* for the *qubes* LVM:
```text
[user@dom0 ~]$ sudo lvcreate -T -n pool2 -l +100%FREE qubes
```

Finally we need to tell Qubes to add a new pool on the just created thin pool:
```text
[user@dom0 ~]$ qvm-pool --add pool2_qubes lvm_thin -o volume_group=qubes,thin_pool=pool2,revisions_to_keep=2
[user@dom0 ~]$ sudo pvs
```

SAMPLE LUKS UUID
----------------
```text
luks-123e4567-e89b-42d3-a456-426614174000 : internal included ~223 GiB SSD drive
luks-7f3a2c91-6b84-4e0d-9a57-c218d43f6b02 : manually added ~465 GiB SSD drive
```

ADD AND MIGRATE
---------------
Create qubes in that pool with:
```text
[user@dom0 ~]$ qvm-create -P pool2_qubes --label red new-qube-name
```

Or migrate an existing qube by cloning it to the new pool and then removing the old one:
```text
[user@dom0 ~]$ qvm-clone -P pool2_qubes personal-storage-old personal-storage
[user@dom0 ~]$ qvm-remove personal-storage-old
```

If that was a template, or other qube referenced elsewhere (NetVM or such), adjust those references manually with:
`qvm-prefs <appvmname_based_on_old_template> template <new_template_name>`

LINKS
-----
For a full reference on secondary storage, refer to [^1] and for information about volume groups and LVM read [^2] and [^3].

[^1]: https://www.qubes-os.org/doc/secondary-storage/
[^2]: https://www.redhat.com/sysadmin/create-volume-group
[^3]: https://www.linux.com/training-tutorials/how-full-encrypt-your-linux-system-lvm-luks/

