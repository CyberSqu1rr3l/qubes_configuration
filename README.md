![Qubes OS Configuration](banner.png)

Description
-----------------------------------------------------------------------------------------
*Qubes OS* is a security-focused operating system that uses virtualization to
isolate different activities into separate compartments called *qubes*. [^1]
While Qubes OS provides a strong security architecture, configuring and customizing it
can sometimes be challenging, especially for new users.
This repository aims to simplify that process by providing useful scripts, configuration
examples, practical guides, personal tweaks and guides to make Qubes OS more accesssible,
customizable, and convenient to use. Whether you're just getting started with Qubes OS or
looking to improve your existing setup, you may find something useful here.

Repository Structure
-----------------------------------------------------------------------------------------
The repository is organized into separate directories covering different aspects of Qubes
OS. Each directory focuses on a specific area, allowing you to explore and apply only the
configurations relevant to your needs.

| Directory | Description |
|---|---|
| [appvm_config](appvm_config/) | Configuration and customization of AppVMs. |
| [dom0_scripts](dom0_scripts/) | Scripts and utilities for the Qubes OS administrative domain `dom0`. |
| [full_backup](full_backup/) | Backup-related scripts and configurations. |
| [sys_net_hacks](sys_net_hacks/) | Network-related tweaks and configurations for `sys-net`. |
| [sys_usb_hacks](sys_usb_hacks/) | USB-related tweaks and configurations for `sys-usb`. |
| [view_statistics](view_statistics/) | Tools and scripts for viewing system statistics. |
| [web_browsing](web_browsing/) | Browser-related configurations and usability tweaks. |
| [xfce_ricing](xfce_ricing/) | XFCE desktop customization and visual improvements. |
| [yubikey_setup](yubikey_setup/) | YubiKey-related setup and configuration. |

Disclaimer
-----------------------------------------------------------------------------------------
Qubes OS follows a security-by-isolation approach where incorrect configuration can
weaken that isolation or introduce unnecessary risks. Please understand the following
considerations when using scripts or configurations from this repository.

1. **Understand what you're running.** Never execute unfamiliar scripts without reviewing their contents.
2. **Be cautious with dom0:** The administrative domain is highly privileged, run only trusted code here.
3. **Respect compartmentalization:** Avoid creating unnecessary communication channels between qubes.
4. **Back up your system:** Always create backups before making significant changes.
5. **Adapt configurations to your environment:** Hardware, templates, and Qubes OS versions may differ.
6. **Prefer official documentation:** Consult the Qubes OS documentation for security-sensitive settings.

These documented configurations are provided for personal use. Therefore, they may
not be suitable for every system or threat model. Use them at your own risk and review
each file before running or applying it.

Customization
-----------------------------------------------------------------------------------------
Qubes OS is highly flexible, and there is no single configuration that works best for
everyone. The scripts and configurations in this repository reflect personal preferences,
experiments, and solutions to specific problems. Feel free to modify and adapt them to
your own workflow. The intention is not to provide a universally recommended
configuration, but to share ideas and tools that might make your Qubes OS experience
better.

Contributing
-----------------------------------------------------------------------------------------
This repository represents a personal project. However, contributions in the form of
insights, suggestions, or improvements are welcome. Constructive feedback is highly
encouraged and appreciated. Please feel free to open an issue or submit a pull request if
you would like to contribute.

Useful Resources
-----------------------------------------------------------------------------------------
If you're new to Qubes OS or want to learn more about its security architecture, these
resources are a good starting point:

- [Qubes OS Official Website](https://www.qubes-os.org/)
- [Qubes OS Documentation](https://doc.qubes-os.org/)
- [Qubes OS Forum](https://forum.qubes-os.org/)
- [Qubes OS GitHub](https://github.com/QubesOS)

Licensing
-----------------------------------------------------------------------------------------
You are free to use, modify, and distribute the repository contents according to the MIT
license terms. [^4]

Acknowledgements
-----------------------------------------------------------------------------------------
Credits to the Qubes OS developers, contributors, and the wider open-source and
cybersecurity communities for continuously sharing knowledge, developing security-focused
tools, and making privacy and digital security more accessible. Your contributions help
empower users to take greater control of their digital environments towards a more secure
and privacy-conscious future.

[^1]: https://www.qubes-os.org/
[^4]: https://mit-license.org/
