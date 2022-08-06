# iiitb_Universal_Shift_Register
This project analyses and simulates the operations of a 4-bit Universal Shift Register. The Register can take data and control inputs from the user and execute data operations according to the mode of operation specified.

## Introduction
A Universal Shift Register is a register with both  right shift and left shift with parallel load capabilities. Universal Shift Registers are used as memory elements in computers. A Unidirectional Shift Register shifts in only one direction whereas a Bidirectional Shift Register is capable of shifting in both the directions. The design of Universal Shift Register is a combination of Bidirectional Shift Register and a Unidirectional Shift Register with provision for parallel.

A 4-bit Universal Shift Register consists of 4 flip-flops and 4 4×1 multiplexers. All the 4 multiplexers share the same select lines (S1 and S0) which select the mode of operation for the shift register. The select line inputs choose the suitable input for the flip-flops.

<p align='center'> <img src='https://user-images.githubusercontent.com/110731913/183254175-2079ef33-42f3-4757-b0c3-60ca920937fd.png'></p>

## Circuit Connections
This  model has the following connections: 
1) The first input is connected to the output pin of the corresponding flip-flop. 
2) The second input is connected to the output of the very-previous flip flop which initiates the right shift.
3) The third input is connected to the output of the very-next flip-flop which facilitates the left shift. 
4) The fourth input is connected to the individual bits of the input data which helps in parallel loading.
 
The working of the Universal Shift Register depends on the inputs given to the select lines.

## Modes of Operation:
According to the inputs to the select lines, the following modes can be implemented in a Universal Shift Register:


<p align='center'> <img src= 'https://user-images.githubusercontent.com/110731913/183254625-3b5794f8-6e30-4a1c-b5c8-169991766499.png'></p>

1) The input '00' to the select lines refers to "locked state" wherein the register contents remain unchanged.
2) The input '01' refers to "right shift" meaning that the register contents will be shifted towards the right.
3) The input '10' indicates "left shift" which shifts the contents of the register to the left.   
4) The input '11' 

