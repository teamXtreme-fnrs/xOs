# xOs

## 1. Build

### 1-1. Install build tools

#### 1-1-1. For building xkernel

```bash

sudo apt install build-essential build-essential:i386 binutils libc6-dev-i386
sudo apt install gcc-multilib g++-multilib

```

#### 1-1-2. For building bootable image

```bash

sudo apt install grub-legacy xorriso

```

### 1-2. Create bootable image

Create bootable image of xOs for VirtualBox

```bash

make xkernel.iso

```

Or, just build the kernel

#### 1-2-1. Build kernel

```bash

make xkernel.bin

```

## 2. Installation

### 2-1. Install alongside linux

#### 2-1-1. copy the xkernel.bin into /boot

```bash

make install

```

#### 2-1-2. add these codes into /boot/grub/grub.cfg

```grub

menuentry 'xOs'{
  multiboot /boot/mykernel.bin
  boot
}

```

### 2-2. To run in VirtualBox

#### 2-2-1. Install VirtualBox

```bash

sudo apt install VirtualBox

```

Create VirtualMachine in VirtualBox named xOs then run the following

```bash

make run

```

[]: 
