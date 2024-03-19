# systemd and SysV
_Systemd and SysV are both init systems used in Unix-like operating systems such as Linux._

List of distributions:
* Ubuntu - systemd
* Debian - systemd
* CentOS - systemd
* Fedora - systemd
* Red Hat Enterprise Linux (RHEL) - systemd
* openSUSE - systemd
* Arch Linux - systemd
* Linux Mint - systemd
* Manjaro - systemd
* Elementary OS - systemd


## SysV:
* The traditional init system used in Unix-like operating systems. It follows the System V Unix conventions.
* SysV init relies on shell scripts located in specific directories (/etc/init.d/ and /etc/rc.d/) to start and stop services.
* SysV init starts services sequentially, meaning that one service has to be fully started before the next one begins.
* Limited parallelism in SysV init can lead to slower boot times, especially on systems with many services.
* Dependency management in SysV init is often managed manually in script files, which can become complex and error-prone.

## Systemd
* A more modern init system designed to overcome some of the limitations of SysV init.
* Uses unit files (*.service, *.socket, etc.) to describe how services should be started, stopped, and managed. These unit files can include dependency information and other configurations.
* Allows for parallel startup of services, improving boot times by starting services in parallel when possible.
* Systemd handles dependency management automatically based on the information provided in unit files, simplifying service management.
* Systemd includes features for enhanced logging (journalctl) and monitoring of system services, making it easier to troubleshoot and manage the system.
* Systemd includes many other features such as socket activation, on-demand starting of services, cgroup-based process tracking, and more.
