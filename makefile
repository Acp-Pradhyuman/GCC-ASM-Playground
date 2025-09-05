# Tools
NASM = nasm
GCC = gcc
LD = ld

# Source files
ASM_FILE_64 = add64.asm
ASM_FILE_32 = add32.asm
C_FILE = main.c

# Outputs (objects and exe)
ASM_OBJ = add.o
EXE_64 = add_program_64
EXE_32 = add_program_32
PURE_NASM_EXE = test

# Flags
NASM_64_FLAGS = -f elf64
NASM_32_FLAGS = -f elf32
GCC_64_FLAGS = -no-pie
GCC_32_FLAGS = -m32 -no-pie

# Default target: build everything
all: build64 build32 pure_nasm

# 64-bit C + NASM build
build64: $(ASM_FILE_64) $(C_FILE)
	$(NASM) $(NASM_64_FLAGS) $(ASM_FILE_64) -o $(ASM_OBJ)
	$(GCC) $(GCC_64_FLAGS) $(C_FILE) $(ASM_OBJ) -o $(EXE_64)

run64: build64
	./$(EXE_64)

# 32-bit C + NASM build
build32: $(ASM_FILE_32) $(C_FILE)
	$(NASM) $(NASM_32_FLAGS) $(ASM_FILE_32) -o $(ASM_OBJ)
	$(GCC) $(GCC_32_FLAGS) $(C_FILE) $(ASM_OBJ) -o $(EXE_32)

run32: build32
	./$(EXE_32)

# Pure NASM (64-bit) build with ld
pure_nasm: test.asm
	$(NASM) -f elf64 test.asm -o test.o
	$(LD) test.o -o $(PURE_NASM_EXE)

run_test: pure_nasm
	./$(PURE_NASM_EXE)

# Clean build artifacts
clean:
	rm -f *.o $(EXE_64) $(EXE_32) $(PURE_NASM_EXE)

# Helpful info
help:
	@echo "Targets:"
	@echo "  make build64      - Build 64-bit NASM + C (using $(ASM_FILE_64))"
	@echo "  make run64        - Run 64-bit program"
	@echo "  make build32      - Build 32-bit NASM + C (using $(ASM_FILE_32))"
	@echo "  make run32        - Run 32-bit program"
	@echo "  make pure_nasm    - Build pure NASM program"
	@echo "  make run_test     - Run pure NASM program"
	@echo "  make clean        - Clean up all artifacts"

# === PREREQUISITES ===
# Install these if not already installed:
# sudo apt update
# sudo apt install build-essential    # Includes gcc and make
# sudo apt install nasm              # Assembler
# sudo apt install gcc-multilib g++-multilib libc6-dev-i386  # For 32-bit support