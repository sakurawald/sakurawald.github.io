---
title: guide to install qubes on qemu
date: 2023-12-07 15:22:03
tags:
  - os
  - security
  - virtualize
  - qemu
  - kvm
  - linux
  - note
---
# Guide to install qubes on qemu

## Abstract

This post is a guide for someone who want to install qubes (the reasonable security os in the world) on their virtual machine. Our targets are:
1. Use qemu (a virtual machine emulator) to emulate a virtual machine (which contains all the emulated hardware and firmware, e.g. cpu, memory, disk, nic, video card and bios)
2. Let the qubes installer believe it runs in a bare-metal machine (Include feature-pass like VT-d and IOMMU)
3. Setup the guest of (qubes os) and run virtual machines inside the guest os. (Nested Virtialization)


## Steps
### Create an qemu instance for qubes os

First, we need an empty disk for our guest os. 
```sh
qemu-img create -f qeubes.raw 128G
```

Second, we need to start our qemu-instance
```sh
#!/usr/bin/env bash

qemu-system-x86_64 \
  -machine q35,accel=kvm,kernel-irqchip=split,igd-passthru=on \
  -device intel-iommu,intremap=on \
  -netdev user,id=net0 \
  -device e1000,netdev=net0 \
  -cpu host -smp 12 \
  -m 32G \
  -cdrom /media/mozart/images/Qubes-R4.1.2-x86_64.iso \
  -boot menu=on \
  -drive file=/media/mozart/qemu/qubes/qubes.raw,format=raw \
  -vga qxl \
  -spice port=5900,addr=127.0.0.1,disable-ticketing=on,image-compression=off,playback-compression=off
 
```

> While using spice video protocol, there will no any output in the console.
> If you get nothing output, then it means you start the qemu instance successfully.

> WARNING: the parameter `igd-passthru=on` seems useless, you can remove this parameter

Run the shell script and then open your favorite viewer which supports `spice` video protocol.

Here are some FOSS viewers that works in linux platform: spicy, virt-viewer, tigervnc and realvnc

> I highly recommend `spicy` viewer, which supports `spice` protocol so that you can copy and paste files conveniently, and this viewer supports better in mouse control.
> In some guest os, the viewer can't detect the real cursor inside the guest os, so these viewer will create a virtual cursor (looks like a black dot). So here comes the problems: the position between virtual cursor and real cursor will de-sync. Once the de-sync happens, you will find that you can't move to the edges of the host os (Because the viewer thinks the virtual cursor is going to escape the viewer, so these viewer will release the mouse focus, which means you can't move your real cursor to the edges inside guest of)

>Use `virt-viewer` for vnc connection.

> If using `spice`, it's possible there may be some input latency randomly (e.g. right click the desktop). (It seems like some irq takes most of cpu-time, and the whole guest os stuck.) Also, even you install `spice-vdagentd` and `spice-server` in the guest os will not solve this performance issue. Try: some other solutions to tweak spice parameters
> However, `vnc` works like a charm.

> compression is disabled for localhost only connection, so that the input/output latency can be greatly reduced.

### Run the qubes installer 

 Qubes Installer will check if the machine enables `VT-x` and `IOMMU` feature, so here we need to pass these 2 features from host os to the guest os. (If you succeed, then the installer will not reminder you this tip).

 Because the feature is passed from your host os, so your need to enable these features in your bios. (I mean, the bios in the host os)

In the installer, we accept the `default settings` the installer recommended and we setup a default user account.

NOTICE: once the installer finish its work, it will login the desktop and auto start `sys-net` VM.
However, it's very possible you failed to start `sys-net` VM and get the error message 
```plain
[Dom0] Error
['/usr/bin/qvm-start', 'sys-firewall'] failed:
stdout: ""
stderr: "Start failed: internal error: Unable to reset PCI device 0000:00:02.0": no FLR, PM reset or bus reset available, see /var/log/libvirt/libxl/libxl-driver.log for details
```
At this time, qubes has finish all the configuration, so you can just ignore this error message and reboot to login the desktop.

### Run the VM inside qubes

If you pass VT-d and IOMMU features successfully from host os into the guest os (the qubes os), then you can run VM inside qubes easily.

For `sys-net` VM, if you assign the `NIC device` for the VM, then you need to do these 2 things to let the VM started.

#### Disable the PCI-reset-strict in `sys-net` VM

```sh
qvm-pci ls sys-net
qvm-pci detach sys-net [BACKEND:DEVICE_ID]
qvm-pci attach --persistent sys-net [BACKEND:DEVICE_ID] -o no-strict-reset=true
```

> The `device_id` is the `NIC device` assigned to `sys-net` VM

#### Set the virtualization-mode of `sys-net` VM to `PV`
Change the virtualization-mode of `sys-net` VM from `HVM` to `PV`, so that the VM can start successfully. (This is the way to solve the error of NIC)

```sh
qvm-prefs sys-net virt_mode pv
```

Now, you can launch `firefox` and it should work.
## Reference

1. https://wiki.qemu.org/Features/VT-d
2. https://wiki.xenproject.org/wiki/Xen_PCI_Passthrough
3. https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF
4. https://www.qubes-os.org/doc/pci-troubleshooting/
5. https://www.qubes-os.org/doc/how-to-use-pci-devices/#additional-attach-options
6. https://forum.qubes-os.org/t/sys-net-not-starting-because-it-is-unable-to-reset-pci-device/15056
7. https://forum.qubes-os.org/t/configure-strict-reset-for-pci-devices/13568
8. https://forum.qubes-os.org/t/installing-qubes-unable-to-reset-pci-device/14943

