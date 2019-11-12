commands for compilation:

  make loader.o   
  make kernel.o


commands for installation into /boot/mykernel.bin:

  make install



edit the /boot/grub/grub.cfg:

    ### BEGIN MYKERNEL###
    menuentry 'xOs'{
      multiboot /boot/mykernel.bin
      boot
    }
    ### END MYKERNEL###
