
#include <common/types.h>
#include <common/printf.h>
#include <gdt.h>

using namespace xos;

typedef void (*constructor)();
extern "C" constructor start_ctors;
extern "C" constructor end_ctors;
extern "C" void callConstructors()
{
    for(constructor* i = &start_ctors; i != &end_ctors; i++)
        (*i)();
}

extern "C" void kernelMain(void* multiboot_struture, uint32_t magicN) {
    printf("xOs >> Writting to Video Text Memory [%d, %d]\n", 80, 25);
	printf("xOs >> Hello, Team X\n");

    GlobalDescriptorTable gdt;

 	printf("GlobalDescriptorTable created\n");   

    while(1);
}