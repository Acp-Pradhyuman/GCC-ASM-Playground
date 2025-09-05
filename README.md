# GCC-ASM-Playground: Exploring 32-bit and 64-bit Architecture with NASM and GCC

Welcome to **GCC-ASM-Playground**! This repository serves as a playground for experimenting with 32-bit and 64-bit architectures using NASM and GCC. The focus is on testing different calling conventions—specifically **cdecl** and **System V AMD64**—and learning how assembly and C interact in these contexts.

---

## 📚 Project Overview

This project is designed to explore the following:

- **32-bit and 64-bit Architecture**: Understand how the same code behaves on different bit architectures.
- **NASM & GCC**: Use **NASM** to write assembly functions and **GCC** to compile and link both C and assembly code.
- **Calling Conventions**: Work with **cdecl** (32-bit) and **System V AMD64** (64-bit) conventions.
- **C ↔ Assembly Function Calls**: Call assembly functions from C, and C functions from assembly, to fully understand the interaction between the two languages.

---

## 🚀 Features

- 🔄 **32-bit & 64-bit Interoperability**  
- 🧠 **Assembly + C Integration**  
- ⚙️ **GCC Toolchain Support**  
- 📁 **Makefile-based Automation** *(NEW!)*  
- 🧪 **Tested on Ubuntu, Linux Mint, and WSL**

---

## 🛠️ Makefile Build System (NEW)

I have added a **Makefile** to automate the build and run process. This makes it easier to compile 32-bit and 64-bit C + Assembly programs without writing long commands manually.

### 📂 Targets Included

| Command           | Description                                       |
|------------------|---------------------------------------------------|
| `make build64`    | Build 64-bit NASM + C executable                 |
| `make run64`      | Run the 64-bit executable                        |
| `make build32`    | Build 32-bit NASM + C executable                 |
| `make run32`      | Run the 32-bit executable                        |
| `make pure_nasm`  | Build a pure NASM (64-bit) executable using `ld` |
| `make run_test`   | Run the pure NASM program                        |
| `make clean`      | Clean all generated object files and binaries    |
| `make help`       | Show available make targets                      |

### 📌 Key Concepts Covered in the Makefile

- Using **variables** for tools (`GCC`, `NASM`, `LD`) and flags  
- Differentiating between **64-bit** and **32-bit** build flags  
- Marking non-file targets as `.PHONY` to prevent file conflicts  
- Suppressing echo with `@echo` for clean terminal output  

---

## 💻 Requirements

Before running the Makefile, make sure you have the following tools installed:

### ✅ GCC Installation

```bash
sudo apt update
sudo apt install build-essential
```
This includes `gcc`, `make`, and related development tools.

### ✅ NASM Installation

```bash
sudo apt install nasm
```

### ✅ 32-bit Support (Multilib)

To compile 32-bit code on a 64-bit machine:

```bash
sudo apt install gcc-multilib g++-multilib libc6-dev-i386
```
> This is required for `gcc -m32` and linking 32-bit object files.

---

## 🔧 Setup & Usage

### 1. Clone the Repository

```bash
git clone https://github.com/Acp-Pradhyuman/GCC-ASM-Playground.git
cd GCC-ASM-Playground
```
## 2. Build and Run Programs

```bash
make build64    # Compile 64-bit version
make run64      # Run 64-bit version

make build32    # Compile 32-bit version (requires multilib)
make run32      # Run 32-bit version

make pure_nasm  # Build NASM-only binary using ld
make run_test   # Run NASM-only program

make clean      # Clean all generated files
```

## 🧠 Learning Goals

- Understand the calling conventions in different architectures  
- Learn to integrate NASM and C using GCC  
- Automate build processes using Makefiles  
- Explore how linker and assembler flags work  

---

## 🔗 Related Repository

- [toycc (C Compiler in C)](https://github.com/Acp-Pradhyuman/toycc)  

---

## 🏁 Final Notes

This is a hands-on repository for learning systems programming concepts by building and running real-world examples. Feel free to fork, clone, and experiment!

📬 Questions?

Open an issue or leave a comment on the related YouTube video. Happy hacking! ⚡