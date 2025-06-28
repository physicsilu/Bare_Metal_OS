
# 🧵 Bare-Metal OS Development Roadmap (QEMU + ARM)

This is a step-by-step plan for building a bare-metal OS kernel using QEMU on a simulated Raspberry Pi board. Designed for Windows 11 with WSL.

---

## ⚙️ Phase 0: Setup & Tools

**Goals:**
- Install ARM GCC cross-compiler (`aarch64-none-elf-gcc`)
- Install QEMU (`qemu-system-aarch64`)
- Set up Makefile and project directory
- Run "Hello, world" on QEMU

**Outcome:** You can compile and run "Hello, world" on QEMU.

---

## 🧵 Phase 1: Boot and UART

**Tasks:**
- Write `start.S` (ARM ASM) to set up stack
- Create `kernel.c` for main logic
- Write basic UART driver (memory-mapped I/O)
- Link and compile into `kernel8.img`
- Boot it in QEMU

**Outcome:** Your kernel prints "Hello from Kernel" to QEMU console.

---

## ⏱️ Phase 2: Timer + Delays

**Tasks:**
- Set up ARM timer
- Add delay loops or tick counters
- Learn polling with memory-mapped registers

**Outcome:** Timer prints timestamps or blinking text every second.

---

## 🧠 Phase 3: Interrupts (IRQ)

**Tasks:**
- Set up the CPU interrupt vector table
- Handle timer interrupts
- Enable IRQs and observe timed outputs

**Outcome:** Interrupt-driven messages (e.g., print every second).

---

## 🧵 Phase 4: Task Switching (Multitasking)

**Tasks:**
- Implement simple context switch (manual)
- Alternate between functions ("tasks")
- Build round-robin scheduler

**Outcome:** Two functions print alternatively like multitasking.

---

## 📄 Phase 5: File System (Optional Advanced)

**Tasks:**
- Implement simple FAT32 or custom file format
- Mount disk image and read a file
- Print file contents over UART

**Outcome:** Kernel can read from a disk image.

---

## ⌨️ Phase 6: Shell (Bonus Layer)

**Tasks:**
- Take input from UART
- Parse and execute commands (`echo`, `help`, etc.)
- Make it interactive

**Outcome:** Build a mini command-line shell interface.

---

## 🛠️ Tools Summary

| Tool | Purpose |
|------|---------|
| `aarch64-none-elf-gcc` | Compile ARM bare-metal code |
| `qemu-system-aarch64` | Emulate Raspberry Pi 3 board |
| `make` | Automate build process |
| `GDB` (optional) | Debug the kernel |
| `VS Code` or any editor | For writing C/ASM code |

---

## 📂 GitHub Repository

Yes! A GitHub repo should be created:
- Version control each phase
- Push notes, code, Makefile, linker script, and README
- Share your journey with others!

---

> Ready to begin? Start with Phase 0 and build your kernel from scratch 🚀
