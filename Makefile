
SIMPLE_FUSE_ROOT_DIR := $(CURDIR)
export SIMPLE_FUSE_ROOT_DIR

include $(SIMPLE_FUSE_ROOT_DIR)/mk/simplefuse.common.mk

DIRS-y += examples src

.PHONY: all clean $(DIRS-y)

all: $(DIRS-y)
clean: $(DIRS-y)

include $(SIMPLE_FUSE_ROOT_DIR)/mk/simplefuse.subdirs.mk
