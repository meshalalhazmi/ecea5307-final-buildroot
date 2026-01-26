# buildroot-rpi5

This repository contains a Buildroot-based Linux system targeting the Raspberry Pi 5, developed using the Buildroot external tree workflow.


## Target Platform

- Board: Raspberry Pi 5
- Architecture: AArch64 (ARMv8)
- CPU: Cortex-A76
- Boot Medium: microSD
- Boot Flow: Raspberry Pi EEPROM → firmware → Linux kernel

## Buildroot Version

Buildroot is included as a Git submodule and pinned to tag **2025.11.1**.

To initialize Buildroot:

```bash
git submodule update --init --recursive
```

## helper scripts
build.sh:Configures and builds the system
clean.sh : Removes all Buildroot output artifacts and configuration files
save-config.sh:  Saves the current Buildroot configuration