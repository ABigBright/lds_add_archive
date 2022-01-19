ifndef RELEASE_VERSION 

srctree := .
# Q = @
CC = gcc
HOSTCC = gcc

export srctree CC HOSTCC 

-include scripts/Kbuild.include

c_flags := -c
export c_flags

RELEASE_VERSION := "1.0"
export RELEASE_VERSION

KBUILD_OBJS := ./built-in.a ./liba/built-in.a

all:
	$(Q)$(MAKE) $(build)=scripts/basic
	$(Q)$(MAKE) $(build)=. 

clean:
	$(Q)$(MAKE) $(clean)=scripts/basic
	$(Q)$(MAKE) $(clean)=. 

.PHONY : clean

else

obj-y = liba/
obj-y += main.o

endif


