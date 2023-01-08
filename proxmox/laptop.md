# This will show you how to have Proxmox turn off the laptop screen when it is open 

commands:
nano /etc/default/grub
GRUB_CMDLINE_LINUX="consoleblank=20"
update-grub


# This will stop the laptop from suspend when lid i closed

## Uncomment the line about HandleLidSwitch=suspend and change suspend to ignore
nano /etc/systemd/logind.conf 

#HandleLidSwitch=suspend
HandleLidSwitch=ifnore

## How to test
systemctl restart systemd-logind
systemctl status systemd-logind


