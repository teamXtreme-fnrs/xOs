
# sudo apt-get install gcc-multilib g++-multilib

GCCPARAMS = -m32 -Iinclude -fno-use-cxa-atexit -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore -Wno-write-strings
# GCCPARAMS = -m32 -Iinclude -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore -Wno-write-strings
ASPARAMS = --32
LDPARAMS = -melf_i386 -lc

objects = obj/loader.o \
          obj/kernel.o \
          obj/printf.o \
          obj/gdt.o \
#           obj/memorymanagement.o \
#           obj/drivers/driver.o \
#           obj/hardwarecommunication/port.o \
#           obj/hardwarecommunication/interruptstubs.o \
#           obj/hardwarecommunication/interrupts.o \
#           obj/syscalls.o \
#           obj/multitasking.o \
#           obj/drivers/amd_am79c973.o \
#           obj/hardwarecommunication/pci.o \
#           obj/drivers/keyboard.o \
#           obj/drivers/mouse.o \
#           obj/drivers/vga.o \
#           obj/drivers/ata.o \
#           obj/gui/widget.o \
#           obj/gui/window.o \
#           obj/gui/desktop.o \
#           obj/net/etherframe.o \
#           obj/net/arp.o \
#           obj/net/ipv4.o \
#           obj/net/icmp.o \
#           obj/net/udp.o \
#           obj/net/tcp.o \


run: xkernel.iso
	(killall VirtualBox && sleep 1) || true
	VirtualBox --startvm 'xOs' &

obj/%.o: src/%.cpp
	mkdir -p $(@D)
	gcc $(GCCPARAMS) -c -o $@ $<

obj/%.o: src/%.s
	mkdir -p $(@D)
	as $(ASPARAMS) -o $@ $<

xkernel.bin: linker.ld $(objects)
	ld $(LDPARAMS) -T $< -o $@ $(objects)

xkernel.iso: xkernel.bin
	mkdir iso
	mkdir iso/boot
	mkdir iso/boot/grub
	cp xkernel.bin iso/boot/xkernel.bin
	echo 'set timeout=0'                      > iso/boot/grub/grub.cfg
	echo 'set default=0'                     >> iso/boot/grub/grub.cfg
	echo ''                                  >> iso/boot/grub/grub.cfg
	echo 'menuentry "xOs" {'  				 >> iso/boot/grub/grub.cfg
	echo '  multiboot /boot/xkernel.bin'     >> iso/boot/grub/grub.cfg
	echo '  boot'                            >> iso/boot/grub/grub.cfg
	echo '}'                                 >> iso/boot/grub/grub.cfg
	grub-mkrescue --output=xkernel.iso iso
	rm -rf iso

install: xkernel.bin
	sudo cp $< /boot/xkernel.bin

.PHONY: clean
clean:
	rm -rf obj xkernel.bin xkernel.iso
