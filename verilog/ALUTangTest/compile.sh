#!/bin/bash

# Granting execute permissions to this script (one-time setup)
# chmod +x script_name.sh

# Using Icarus Verilog to compile Verilog files for simulation
iverilog -o top top.v topTB.v ALU.v selector.v BinaryToBCD.v arithmeticUnit.v logicUnit.v multiplier.v opCode.v addition.v dabble.v subtraction.v fulladder.v fullsubtraction.v halfadder.v halfsubtraction.v

# Running the simulation
vvp top
