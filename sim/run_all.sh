#!/bin/bash
# Compiles every module in rtl/ standalone to confirm it is syntactically
# valid Verilog. Run from the repo root: bash sim/run_all.sh
set -e
cd rtl
for f in half_adder.v decoder_2to4.v mux_2to1.v counter_4bit.v \
         left_shift_4bit.v comb_4bit.v seg7_display.v lcd_interface.v \
         full_adder_1bit.v decoder_3to8.v mux_4to1.v; do
  iverilog -t null -o /dev/null "$f" && echo "[$f] OK"
done
