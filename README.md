# link-vmlinux.sh

This file is linux kernel v5.6.0 link shell file, including detailed link option, especially pay attention to link static library with --whole-archive and --no-whole-archive usages

+ --whole-archive: link all .o objects file in arvhive(so called: static library)
+ --no-whole-archive: this is opposite side to whole-archive, link .o objects file as needed in arvhive(so called: static library)
