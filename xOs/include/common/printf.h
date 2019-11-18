#ifndef __XOS__COMMON__PRINTF_H
#define __XOS__COMMON__PRINTF_H

#include <stdarg.h>
#include <common/types.h>

namespace xos 
{
    extern void clear (const uint8_t bg);
    extern void printf (const char * format, ...);
}
    
#endif
