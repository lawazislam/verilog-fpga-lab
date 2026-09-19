[VERILOG_FPGA_Report.pdf](https://github.com/user-attachments/files/32414422/VERILOG_FPGA_Report.pdf)
# Verilog & FPGA Lab: Digital Systems

Eleven digital design modules in Verilog, from basic combinational logic through to FPGA display drivers, done during a VLSI Design summer training program at Jadavpur University's IC Design and Fabrication Centre, targeting a Xilinx Artix-7 (Nexys 4) board.

## Team project

Group practical (Group 1, 8 members): Somak Kumar, Abhishek Anand, Sayantan Sarkar, Aparajita Roy, Sourajit Nayak, Lawaz Islam, Debayan Sengupta, and Vishwavijay Singh. My hands-on work was the same kind of circuit design and simulation task shown throughout this repo: writing a module against a truth table or spec, verifying it in simulation, and where noted, taking it to real hardware.

## An important note on how this repo was built

The original submitted report is a scanned document, and its text has real OCR damage: colons misread as slashes (`y[2/0]` instead of `y[2:0]`), missing semicolons, garbled hex literals (`8h9F` instead of `8'h9F`), and a couple of module names printed with a space, which is not valid Verilog. A literal copy of that text would not compile and would not be code, just OCR noise.

So every file here is a **reconstruction**, not a transcription: each module was rebuilt to match the truth table, pin configuration, and written description given alongside the original code block, then verified with a real compiler (Icarus Verilog, `iverilog -t null`). All eleven modules compile with zero errors and zero warnings. The two dataflow modules were additionally simulated against their exact stated truth tables (half adder and 2-to-4 decoder) and match row for row; see `sim/` for the testbenches that prove it.

## What's in here

**Combinational** (all in `rtl/`): half adder (dataflow and behavioural), 2-to-4 decoder (dataflow and behavioural), 2-to-1 mux (dataflow and behavioural), a 1-bit full adder built structurally from two half adders, a 3-to-8 decoder built from two 2-to-4 decoders, and a 4-to-1 mux built from three 2-to-1 muxes.

**Sequential / FPGA** (`rtl/`): a 4-bit up counter, a 4-bit left shift register, a 4-bit combinational selector circuit, a 7-segment display controller, and a 16x2 LCD interface, each with its original pin assignment for the Nexys 4 board recorded as a comment in the file.

## Verify it yourself

```bash
# Install Icarus Verilog (Debian/Ubuntu): sudo apt-get install iverilog
cd rtl
iverilog -t null -o /dev/null half_adder.v   # repeat per file, or see sim/run_all.sh
```

Full original report (circuit diagrams, block diagrams, waveform captures): [`VERILOG_FPGA_Report.pdf`](VERILOG_FPGA_Report.pdf) in this repo.
