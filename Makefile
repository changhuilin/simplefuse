
SIMPLE_FUSE_ROOT_DIR = $(CURDIR)
DPDK_DIR ?= $(CONFIG_DPDK_DIR)
SPDK_DIR ?= $(CONFIG_SPDK_DIR)

include $(SIMPLE_FUSE_ROOT_DIR)/mk/simplefuse.common.mk

APP = perf

C_SRCS := perf.c

CFLAGS += -I. $(DPDK_INC) $(SPDK_INC)

LIBS += $(SPDK_LIBS) -lpciaccess -lpthread $(DPDK_LIB) -lrt

OBJS  = $(C_SRCS:.c=.o)

all : $(APP)

objs : $(OBJS)

test:
	@echo "$(CURDIR)"

%.o : %.c
	@echo "  CC $@"
	$(Q)$(CC) $(CFLAGS) -c $<

$(APP) : $(OBJS)
	@echo "  LINK $@"
	$(Q)$(CC) $(CPPFLAGS) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

clean :
	$(Q)rm -f $(OBJS) *.d $(APP)
