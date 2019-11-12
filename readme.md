commands for compilation:

  make loader.o   
  make kernel.o


commands for installation into /boot/mykernel.bin:

  make install



add these codes into /boot/grub/grub.cfg:

    ### BEGIN MYKERNEL###
    menuentry 'xOs'{
      multiboot /boot/mykernel.bin
      boot
    }
    ### END MYKERNEL###
