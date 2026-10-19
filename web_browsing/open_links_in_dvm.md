IDEA
----
We want to save the bookmarks database locally in the *trusted-personal* qube, but still be
able to open the links with the cli tool `buku` in a disposable Firefox session. [^1] We can achieve
this by setting the `$BROWSER` environment variable to a proper command. [^2]

SETUP
-----
```text
[user@dom0 ~]$ qvm-prefs trusted-personal default_dispvm fedora-36-dvm
[user@trusted-personal ~]$ echo 'export BROWSER="qvm-open-in-dvm"' >> ~/.bashrc
```

REVERT
------
```
[user@storage-connected ~]$ xdg-settings set default-web-browser firefox.desktop
```

[^1]: https://micahflee.com/2016/06/qubes-tip-opening-links-in-your-preferred-appvm/
[^2]: https://www.qubes-os.org/doc/how-to-use-disposables/
