ifndef RELEASE_VERSION 

srctree := .

ifeq ($(KBUILD_VERBOSE),1)
  Q =
  quiet=
else
  Q = @
  quiet=quiet_
endif

CC = gcc
HOSTCC = gcc
RANLIB = ranlib

# define 1 for Makefile.build to generate targets-for-builtin
KBUILD_BUILTIN := 1

export srctree CC HOSTCC KBUILD_BUILTIN RANLIB Q quiet

# Kbuild.include define basic variable for later use. such as $(build) $(clean)
-include scripts/Kbuild.include

c_flags := -c
export c_flags

RELEASE_VERSION := "1.0"
export RELEASE_VERSION

KBUILD_OBJS := liba

all:$(KBUILD_OBJS)
	$(Q)$(MAKE) $(build)=. need-builtin=1
	$(Q)$(RANLIB) ./built-in.a
	$(Q)$(CC) -o main -Wl,-Map=main.map -T link.lds ./built-in.a
	$(Q)echo Version $(RELEASE_VERSION)

$(KBUILD_OBJS): prepare
	$(Q)$(MAKE) $(build)=$@ need-builtin=1

prepare:
	$(Q)$(MAKE) $(build)=scripts/basic

clean:
	$(Q)$(MAKE) $(clean)=scripts/basic
	$(Q)$(MAKE) $(clean)=.

# debug:
#     $(Q)$(MAKE) $(build)=liba liba/lib.a

.PHONY : clean $(KBUILD_OBJS) prepare debug

else

obj-y = liba/
obj-y += main.o

clean-files = *.o *.a *.map main .*.cmd

endif


