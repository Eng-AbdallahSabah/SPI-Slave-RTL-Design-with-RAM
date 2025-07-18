# SPI-Slave-RTL-Design-with-RAM

This project implements a synthesizable **SPI (Serial Peripheral Interface) Slave Controller** connected to a **Single-Port RAM**, using **Verilog HDL**. The design is fully modular and leverages a **Finite State Machine (FSM)** to handle SPI protocol communication and data memory transactions. This project was developed as part of an academic assignment in the field of digital design and verification.

---

## 📁 Directory Structure
SPI-Slave-RTL-Design-with-RAM/
├── rtl/ # RTL design files (SPI Slave, RAM, top module)
│ ├── spi_slave.v
│ ├── ram.v
│ └── top.v
├── tb/ # Testbench files
│ └── spi_tb.v
├── constraints/ # Xilinx FPGA constraint files
│ └── Constraints_project.xdc
├── images/ # Simulation waveform screenshots
│ └── waveform.png
├── run.do # QuestaSim simulation script
├── README.md # Project documentation

---

## 🧠 Project Overview

- **Protocol Used**: SPI (Mode 0 – CPOL = 0, CPHA = 0)
- **Purpose**: Enable serial data communication and storage using SPI and RAM
- **Architecture**: RTL-based SPI Slave module with memory-mapped RAM access
- **Controller Logic**: FSM implementing three states – `IDLE`, `RECEIVE`, and `WRITE`
- **Technology Target**: Xilinx FPGA (Vivado .xdc constraints provided for implementation)
- **Communication**: Master-Slave SPI interface using MOSI, MISO, SCLK, and SS lines

---

## 📐 Design Modules

### 1. `spi_slave.v`
- Manages SPI communication (bit-shifting, clock edge detection)
- Receives commands and data over MOSI
- Controls when to read from or write to RAM
- Communicates with FSM for flow control

### 2. `ram.v`
- Implements single-port RAM
- Synchronous read and write support
- Parameterized depth and width for flexibility

### 3. `top.v`
- Integrates `spi_slave` and `ram`
- Handles signal routing between modules
- Exposes SPI interface to the top-level design

### 4. `Constraints_project.xdc`
- Xilinx Design Constraints (.xdc)
- Maps SPI signals (MOSI, MISO, SCLK, SS) and optional clock/reset to FPGA pins

---

## 🔬 Testbench & Simulation

- **Testbench File**: `spi_tb.v`
- Validates multiple SPI operations: write and read to/from RAM
- Generates SPI clock and simulates timing behavior accurately
- Verifies FSM transitions and RAM responses
- Generates `.wlf` waveform file viewable in QuestaSim

### Simulation Script
- File: `run.do`
- Automates compilation, simulation, and waveform generation using QuestaSim
- To use:
  1. Open QuestaSim
  2. Navigate to project folder
  3. Run: `do run.do`

---

## 📷 Example Simulation Waveform

Below is a waveform image demonstrating a complete SPI transaction:
- **Write Operation** to RAM address
- **Read Operation** from same RAM address
- Confirmed via MISO response

![SPI Waveform Example](https://github.com/Eng-AbdallahSabah/SPI-Slave-RTL-Design-with-RAM/blob/main/images/Waveform)

> Make sure `waveform.png` exists in `/images/` directory before pushing to GitHub.

---

## ✅ Key Features

- Fully modular, readable RTL design
- FSM-based protocol handling
- Supports RAM read/write via SPI interface
- Easily synthesizable and FPGA-ready
- Testbench provides full functional coverage for major use cases
- Automation-ready simulation via `run.do`

---

## 🧰 Tools & Technologies Used

| Tool         | Purpose                              |
|--------------|---------------------------------------|
| **Vivado**   | Synthesis, Implementation, Constraints |
| **QuestaSim**| Functional Simulation, Waveform Debugging |
| **Verilog HDL** | RTL Design and Testbench Development |

---

## 🧪 Verification

- **Test Coverage**: Functional testbench covers:
  - Write command followed by data
  - Read command returns expected data
  - Idle SPI behavior when no SS signal
  - Invalid commands (optional enhancement)

- **Waveform Inspection**: Use QuestaSim to inspect signals like:
  - `sclk`, `mosi`, `miso`, `ss`
  - Internal `fsm_state`
  - RAM address/data ports

---

## 📎 Implementation Notes

- Ensure your FPGA board supports SPI I/O pins; map them in the `.xdc` file.
- RAM parameters can be configured for different depths and data widths if needed.
- `miso` line should be tri-stated or handled correctly if SPI master is external.
- You can add `ILA` or `VIO` cores if debugging on real hardware.

---

## 🔄 Possible Enhancements (To-Do)

- ✅ Add support for SPI Mode 1/2/3
- ⬜ Implement configurable RAM size via parameters
- ⬜ Add assertion-based verification (using SystemVerilog/SVA)
- ⬜ Generate code coverage and synthesis reports (`doc/` folder)
- ⬜ Display real-time SPI data on LEDs/7-seg (if mapped on FPGA board)
- ⬜ Add write protection or error checking for unsupported operations

---

## 👨‍💻 Author

**Eng. Abdallah Sabah**  
Faculty of Engineering, Suez Canal University  
Department of Electronics and Communications Engineering  
Graduation Year: 2025  
Email: (you can optionally include a professional email)

---

## 📜 License

This project is released under an academic-use license.  
You are free to fork, modify, and extend it for non-commercial purposes, provided that proper credit is given to the author.

---
