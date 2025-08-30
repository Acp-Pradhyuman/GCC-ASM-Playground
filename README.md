# GCC-ASM-Playground: Exploring 32-bit and 64-bit Architecture with NASM and GCC

Welcome to **GCC-ASM-Playground**! This repository serves as a playground for experimenting with 32-bit and 64-bit architectures using NASM and GCC. The focus is on testing different calling conventions, specifically **cdecl** and **System V AMD64**, and learning how assembly and C interact in these contexts.

## Project Overview

This project is designed to explore the following:

- **32-bit and 64-bit Architecture**: Understand how the same code behaves on different bit architectures.
- **NASM & GCC**: Using **NASM** to write assembly functions and **GCC** to compile and link both C and assembly code.
- **Calling Conventions**: Working with **cdecl** for 32-bit and **System V AMD64** conventions for 64-bit architecture.
- **C ↔ Assembly Function Calls**: Calling assembly functions from C, as well as calling C functions from assembly, to fully understand the interaction between the two languages.

## Features

- **32-bit & 64-bit Function Calls**: Test and compare how assembly and C functions are called across different architectures.
- **NASM Assembly**: Write and compile assembly code for both 32-bit and 64-bit systems using NASM syntax.
- **C ↔ ASM Interoperability**: Integrate C code and assembly code seamlessly, utilizing the relevant calling conventions.
- **GCC Toolchain**: Use GCC to compile and link the code, with an emphasis on handling different architectures and calling conventions.

## Setup & Usage

### Requirements

- **GCC**: The GNU Compiler Collection to compile both C and assembly code.
- **NASM**: The Netwide Assembler for writing assembly code.
- **Linux or a similar Unix-based OS**: This project is tested and optimized for Linux systems.
  
### Installation

Clone the repository:

```bash
git clone https://github.com/yourusername/GCC-ASM-Playground.git
cd GCC-ASM-Playground
```