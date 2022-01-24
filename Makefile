ifndef RELEASE_VERSION 

srctree := .
# Q = @
CC = gcc
HOSTCC = gcc
RANLIB = ranlib

KBUILD_BUILTIN := 1

export srctree CC HOSTCC KBUILD_BUILTIN RANLIB

-include scripts/Kbuild.include

c_flags := -c
export c_flags

RELEASE_VERSION := "1.0"
export RELEASE_VERSION

KBUILD_OBJS := scripts/basic liba

all:$(KBUILD_OBJS)
	$(Q)$(MAKE) $(build)=. need-builtin=1
	$(Q)$(RANLIB) ./built-in.a
	$(Q)$(CC) -o main ./built-in.a

$(KBUILD_OBJS):
	$(Q)$(MAKE) $(build)=$@ need-builtin=1

clean:
	$(Q)$(MAKE) $(clean)=scripts/basic
	$(Q)$(MAKE) $(clean)=. 

.PHONY : clean $(KBUILD_OBJS)

else

obj-y = liba/
obj-y += main.o

endif


