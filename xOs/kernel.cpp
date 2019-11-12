void printf(char* str)
{
    unsigned short* VideoMemory=(unsigned short*)0xb8000;
    for(int i=0;str[i]!='\0';i++)
        VideoMemory[i]=(VideoMemory[i]&0xFF00)| str[i];
    
}
   extern "C" void kernelMain(void* multiboot_struture,unsigned int magicN){
	printf("hello! Team X");
	while(1);
}
