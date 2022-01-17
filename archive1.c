#include <stdio.h>


unsigned int archive_test1_gs_variable = 0x5a5a;

void archive_test1(void)
{
    printf("%s:%d\r\n", __FUNCTION__, __LINE__);
    archive_test1_gs_variable++;
}
