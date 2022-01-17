#include <stdio.h>

extern void archive_test(void);
extern void archive_test1(void);

int main(void)
{
    printf("%s:%d\r\n", __FUNCTION__, __LINE__);

    archive_test();
    archive_test1();

    return 0;
}
