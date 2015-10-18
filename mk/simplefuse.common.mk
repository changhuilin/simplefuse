
include $(SIMPLE_FUSE_ROOT_DIR)/CONFIG

Q ?= #@
S ?= $(notdir $(CURDIR))

ifeq ($(MAKECMDGOALS),)
MAKECMDGOALS=$(.DEFAULT_GOAL)
endif

OS := $(shell uname)

COMMON_CFLAGS = -g -Wall -Werror

ifeq ($(OS),FreeBSD)
LIBS += -L/usr/local/lib
COMMON_CFLAGS += -I/usr/local/include
endif

ifeq ($(CONFIG_DEBUG), y)
COMMON_CFLAGS += -DDEBUG -O0
else
COMMON_CFLAGS += -DNDEBUG -O2
endif

CFLAGS   += $(COMMON_CFLAGS) -std=gnu11


######### SPDK

SPDK_DIR ?= $(CONFIG_SPDK_DIR)
SPDK_INC_DIR ?= $(SPDK_DIR)/include

SPDK_INC = -I$(SPDK_INC_DIR)
SPDK_LIBS += $(SPDK_DIR)/lib/nvme/libspdk_nvme.a \
						 $(SPDK_DIR)/lib/util/libspdk_util.a \
						 $(SPDK_DIR)/lib/memory/libspdk_memory.a


######### DPDK

DPDK_DIR ?= $(CONFIG_DPDK_DIR)
DPDK_INC_DIR ?= $(DPDK_DIR)/include
DPDK_LIB_DIR ?= $(DPDK_DIR)/lib

DPDK_INC = -I$(DPDK_INC_DIR)
DPDK_LIB = -L$(DPDK_LIB_DIR) -lrte_eal -lrte_mempool -lrte_ring -Wl,-rpath=$(DPDK_LIB_DIR)
# DPDK requires dl library for dlopen/dlclose on Linux.
ifeq ($(OS),Linux)
DPDK_LIB += -ldl
endif
ifeq ($(OS),FreeBSD)
DPDK_LIB += -lexecinfo
endif
