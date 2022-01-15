# 4Bit-FullAdder 

Addition is one of the most basic and common operations in digital systems. An adder is a type of arithmetic circuit with the goal of adding two binary numbers together.

A half adder adds two bits together to output a sum and carry out. The carry out bit is the overflow from reaching the maximum range of our bits and is still important in our addition process. The downfall of a half adder is that is does not consider a carry in bit, which is necessary when adding many bits sequentially. This is where the full adder comes in. A full adder will take 3 input bits and output a sum and carry out to account for the previous carry out. The truth table for a 1 bit full adder is given below:

  | A | B | C_in | Sum | C_out |
  | --- | --- | --- | --- | --- |
  | 0 | 0 | 0 | 0 | 0 |
  | 0 | 0 | 1 | 1 | 0 |
  | 0 | 1 | 0 | 1 | 0 |
  | 0 | 1 | 1 | 0 | 1 |
  | 1 | 0 | 0 | 1 | 0 |
  | 1 | 0 | 1 | 0 | 1 |
  | 1 | 1 | 0 | 0 | 1 |
  | 1 | 1 | 1 | 1 | 1 |

The equations for the outputs are:

  Sum = A XOR B XOR C_in
  
  C_out = AB + AC_in + BC_in

# Implementation

With our equations and logic figured out, we will be desiging a ripple-carry adder, which is mutltiple single bit full adders attached in succession. It is called a "ripple-carry" adder because the carry propogates through all adders after it. Although easy to create, it is relatively slow when dealing with a large amount of bits as many adders need to be attached and wait for the one before it to finish its process.

Given two N-bit numbers A and B, adder i will add A(i) and B(i) together to output Sum(i). The C_out of adder i will be the C_in of adder (i + 1). Eventually, we will have an N-bit Sum with a single carry out to indicate overflow. In VHDL, we approach this by creating a 1-bit full adder entity and combining 4 of them back to back to implement the 4-bit full adder. In the architechture of the 4-bit full adder, we map the adders such that adder0 has a C_in of 0 and outputs its sum to Sum(0). For adder1, C_in is the C_out of adder0, and will output to Sum(1), and so on. Eventually, our last adder will output its C_out to the carry out of the entire system.

The schematic and simulation waveforms are shown below:

![schematic](./img/schematic.png)

![waveform](./img/waveforms.png)
