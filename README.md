**SIMPLE 4-BIT CPU SIMULATION IN VERILOG**

**OVERVIEW:**

This project implements a basic *4-bit CPU* in Verilog, designed to demonstrate fundamental processor operations including *instruction fetching, decoding, execution,* and *program counter updates*. It consists of core modules such as:

* Arithmetic Logic Unit (ALU)
* Register File
* Program Counter
* Control Unit
* Instruction Memory

All components are interconnected to simulate a working CPU pipeline.

---

**FEATURES:**

* 4-bit instruction and data width
* Supports basic arithmetic and logic operations
* Register-based architecture with 4 general-purpose registers
* Program counter for instruction sequencing
* Instruction memory with hardcoded program
* Behavioral simulation using Vivado’s XSim
* Includes testbench with automatic simulation output

---

**INSTRUCTION SET:**

Each instruction is 8 bits wide:

* Bits \[7:6]: **Opcode**
* Bits \[5:4]: **Destination Register**
* Bits \[3:2]: **Source Register 1**
* Bits \[1:0]: **Source Register 2 or Immediate**

**Supported Opcodes:**

* *00* – Load Immediate
* *01* – Add
* *10* – Subtract
* *11* – Halt

---

**FILE DESCRIPTIONS:**

* **alu.v** – Implements arithmetic and logic operations (ADD, SUB)
* **Register.v** – Defines the register file with 4 general-purpose registers
* **ProgramCounter.v** – Handles program counter increment
* **InstructionMemory.v** – Stores program instructions
* **ControlUnit.v** – Decodes instruction and generates control signals
* **Simple4BitCPU.v** – Top-level module integrating all components
* **cpu\_tb.v** – Testbench providing stimulus and observing CPU behavior

---

**SIMULATION OUTPUT EXAMPLE:**

```
Cycle 1 | R0=3 R1=x R2=x R3=x | PC=0 | Instr=00000011  
Cycle 2 | R0=3 R1=x R2=x R3=x | PC=1 | Instr=00010101  
Cycle 3 | R0=3 R1=5 R2=x R3=x | PC=2 | Instr=00101000  
Cycle 4 | R0=3 R1=5 R2=x R3=x | PC=3 | Instr=11100000  
CPU Halted at cycle 4
```

---

**USAGE INSTRUCTIONS:**

1. Open the project in **Vivado**
2. Add all Verilog source files and the testbench
3. Create a simulation set (`sim_1`) and set `cpu_tb` as the top module
4. Run behavioral simulation
5. View output in the simulation console

---
