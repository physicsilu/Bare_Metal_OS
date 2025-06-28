// src/kernel/kernel.c

void kernel_main() {
    volatile unsigned int* uart = (unsigned int*)0x3F201000;
    const char *msg = "Hello from kernel!\n";

    while (*msg) {
        // Wait for UART to become ready to transmit
        while ((uart[0x18 >> 2] & (1 << 5))) {
            // Wait while TXFF (Transmit FIFO Full) is set
        }

        uart[0] = *msg++;
    }
}
