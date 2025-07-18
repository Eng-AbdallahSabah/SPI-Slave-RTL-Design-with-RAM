# spi-slave-rtl-
A Verilog implementation of a Serial Peripheral Interface (SPI) slave with integrated 256-byte RAM, featuring a 5-state FSM architecture supporting multiple operation modes, 10-bit command/data protocol, and synchronous interface with comprehensive verification testbenches for embedded system communication applications.
SPI Memory Interface Controller
A complete Verilog implementation of a Serial Peripheral Interface (SPI) slave with integrated RAM for embedded system applications.
Overview
This project implements a memory-mapped SPI slave device that enables external masters to read from and write to an internal 256-byte RAM. The design uses a state machine architecture to efficiently handle the SPI protocol while maintaining a clean separation between communication and memory modules.
Features

Complete SPI Slave Interface

MOSI, MISO, and SS_n signal handling
Synchronous design with clock and reset
Bit-level serial communication


10-bit Communication Protocol

2-bit command field
8-bit data/address field


Four Operation Modes

Hold Write Address (00)
Write Operation (01)
Hold Read Address (10)
Read Operation (11)


Integrated Memory

256-byte RAM with 8-bit data width
Full addressing capability
Synchronous read/write operations



Architecture
The design consists of three main modules:

SPI Slave Module

State machine with 5 states (IDLE, CHK_CMD, WRITE, READ_ADD, READ_DATA)
Serial-to-parallel and parallel-to-serial conversion
Command decoding and operation control


RAM Module

256-byte memory array
Address register for operation sequencing
Data output register with valid signal


Wrapper Module

Connects SPI slave interface to RAM module
Signal routing and interconnection
Creates a complete memory-mapped SPI device



Directory Structure
├── rtl/                # RTL design files
│   ├── SPI.v           # SPI slave module
│   ├── RAM.v           # Memory module
│   └── Wrapper.v       # Integration wrapper
├── testbench/          # Verification files
│   ├── tb_Spi_Slave.v  # SPI module testbench
│   └── tb_Wrapper.v    # Full system testbench
└── simulation/         # Simulation scripts
    ├── run.do          # ModelSim script for wrapper
    └── run1.do         # ModelSim script for SPI slave
Simulation
To simulate the design:

Clone the repository
Navigate to the simulation directory
Run the appropriate simulation script:
vsim -do run.do      # For full system simulation
vsim -do run1.do     # For SPI slave module simulation


Verification
The design includes comprehensive verification:

Individual module testing with tb_Spi_Slave.v
Full system verification with tb_Wrapper.v
Testing of all operation modes and corner cases
Error detection and handling verification

Usage Example
The SPI slave can be integrated with any SPI master device. A typical transaction sequence:

Master pulls SS_n low to begin transaction
Master sends Hold Write Address command (00) with target address
Master sends Write Operation command (01) with data to write
Master sends Hold Read Address command (10) with target address
Master sends Read Operation command (11) to retrieve data
Master pulls SS_n high to end transaction

Acknowledgments

Based on standard SPI protocol specifications
Designed for FPGA implementation
RetryClaude can make mistakes. Please double-check responses.
