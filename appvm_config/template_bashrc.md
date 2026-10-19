PROBLEM
-------
*AppVM* qubes do not inherit from `/home/user` in the template as every qube has its own home directory.
When bash in invoked as an interactive login shell, it first reads and executes commands from the `/etc/profile`.
The last few lines of `/etc/profile` are a conditional clause to open `/etc/bashrc` and check for double sourcing.
However, it is not a good idea to change this file as this is the only backup source for bash.

SOLUTION
--------
Create a new custom.sh shell script in `/etc/profile.d/` to make custom changes to your environment. [^1]
```text
[user@fedora-36 ~]$ sudo vi /etc/profile.d/custom.sh
```
Copy the contents of `./template_custom.sh` to this file and restart the template and app VMs subsequently.

[^1]: https://forum.qubes-os.org/t/how-do-i-preserve-bashrc-my-qubes/8767

