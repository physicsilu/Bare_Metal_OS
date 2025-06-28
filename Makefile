CROSS_COMPILE = aarch64-linux-gnu-
AS      = $(CROSS_COMPILE)as
CC      = $(CROSS_COMPILE)gcc
LD      = $(CROSS_COMPILE)ld
OBJCOPY = $(CROSS_COMPILE)objcopy

CFLAGS  = -Wall -O2 -nostdlib -nostartfiles -ffreestanding
LDFLAGS = -T src/boot/linker.ld

BUILD   = build
SRC     = src
INCLUDE = include

OBJS = $(BUILD)/start.o $(BUILD)/kernel.o

all: $(BUILD)/kernel8.img

# Build output dir
$(BUILD):
	mkdir -p $(BUILD)

# Compile Assembly
$(BUILD)/start.o: $(SRC)/boot/start.S | $(BUILD)
	$(AS) -o $@ $<

# Compile C kernel
$(BUILD)/kernel.o: $(SRC)/kernel/kernel.c | $(BUILD)
	$(CC) $(CFLAGS) -I$(INCLUDE) -c -o $@ $<

# Link to ELF
$(BUILD)/kernel8.elf: $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $^

# Convert ELF to IMG
$(BUILD)/kernel8.img: $(BUILD)/kernel8.elf
	$(OBJCOPY) -O binary $< $@

# Clean build
clean:
	rm -rf $(BUILD)

.PHONY: all clean
