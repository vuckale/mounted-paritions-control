# mounted-partitions-control.pl

## Description
Perl script for unmouting/powering-off media/usb drives

## Dependencies
[perl](https://www.perl.org/), [udisksctl](https://manpages.ubuntu.com/manpages/bionic/man1/udisksctl.1.html)

Debian based distros:

```bash
sudo apt-get install perl udisks
```

Arch based distros:

The perl package for Perl 5 is installed as part of the base group during Arch Linux installation. [https://wiki.archlinux.org/index.php/Perl#Installation](https://wiki.archlinux.org/index.php/Perl#Installation)

```bash
sudo pacman -S udisks
```
## Usage:

```bash
perl mounted-partitions-control.pl
```
After running this command you will be prompted to type ID of the drive you wish to unmount/power-off. IDs will be marked on `STDOUT`. After you type ID and press ENTER this script will call `udisksctl` command with your subshell and attempt to unmount and power-off selected drive.
