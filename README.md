# iiitb_usr - Universal Shift Register (USR)
This project analyses and simulates the operations of a 4-bit Universal Shift Register. The Register can take data and control inputs from the user and execute data operations according to the mode of operation specified.

## About USR: Introduction
A Universal Shift Register is a register with both  right shift and left shift with parallel load capabilities. Universal Shift Registers are used as memory elements in computers. A Unidirectional Shift Register shifts in only one direction whereas a Bidirectional Shift Register is capable of shifting in both the directions. The design of Universal Shift Register is a combination of Bidirectional Shift Register and a Unidirectional Shift Register with provision for parallel.

A 4-bit Universal Shift Register consists of 4 flip-flops and 4 4×1 multiplexers. All the 4 multiplexers share the same select lines (S1 and S0) which select the mode of operation for the shift register. The select line inputs choose the suitable input for the flip-flops.

<p align='center'> <img src='https://user-images.githubusercontent.com/110731913/183254175-2079ef33-42f3-4757-b0c3-60ca920937fd.png'></p>

### Circuit Design
This  model has the following connections: 
1) The first input is connected to the output pin of the corresponding flip-flop. 
2) The second input is connected to the output of the very-previous flip flop which initiates the right shift.
3) The third input is connected to the output of the very-next flip-flop which facilitates the left shift. 
4) The fourth input is connected to the individual bits of the input data which helps in parallel loading.
 
The working of the Universal Shift Register depends on the inputs given to the select lines.

### Modes of Operation:
According to the inputs to the select lines, the following modes can be implemented in a Universal Shift Register:


<p align='center'> <img src= 'https://2.bp.blogspot.com/-wgQJcEYelAY/WjJ7qCHH2xI/AAAAAAAAAF0/TBHSczins1k3nCFvvo8xaCgPAXw8AjCEACLcBGAs/s1600/324.PNG'></p>

1) The input '00' to the select lines refers to "locked state" wherein the register contents remain unchanged.
2) The input '01' refers to "right shift" meaning that the register contents will be shifted towards the right.
3) The input '10' indicates "left shift" which shifts the contents of the register to the left.   
4) The input '11' to the select line reflects parallel loading of data into the register.

### Advantages of Universal Shift Register

1) Has the ability to perform 3 operations: shift-left, shift-right, and parallel loading.
2) Temporary storage of data within register.
3) Capable of performing serial to serial, serial to parallel, parallel to serial and parallel to parallel operations.
4) Acts as an interface between devices during data transfer.

### Applications

1) Used in micro-controllers for I/O expansion
2) Used as a serial-to-serial, parallel-to-parallel, serial-to-parallel data converter respectively.
3) Used in parallel and serial to serial data transfer.
4) Used as a memory element in computers.
5) Used in time delay and data manipulation applications.
6) Used in frequency counters, binary counters and digital clocks.

## Tools Used
### iverilog and GTKWave Installation

- Icarus Verilog is an implementation for the IEEE-1364 Verilog hardware description language. It is a Verilog simulation and synthesis tool.
- GTKWave is a VCD waveform viewer based on the GTK library. This viewer supports VCD and LXT formats for signal dumps. GTKWave reads Ver Structural Verilog Compiler generated AET files as well as standard Verilog VCD/EVCD files and allows their viewing. 

<p align='center'> <img src= 'https://user-images.githubusercontent.com/110731913/183261331-a86a9e7c-8e26-4cb0-a4c5-9b4475aeee70.png'></p>

For Ubuntu
Open your terminal and type the following to install iverilog and GTKWave:

```
$   sudo apt-get update
$   sudo apt-get install iverilog gtkwave
```
### Yosys Installation

- Yosys is a framework for Verilog RTL synthesis. It currently has extensive Verilog-2005 support and provides a basic set of synthesis algorithms for various application domains.
- more at https://yosyshq.net/yosys/

To install yosys follow the instructions given in the following github repository:
- https://github.com/YosysHQ/yosys/blob/master/README.md#installation

### Installation of OpenLane
OpenLane is an automated RTL to GDSII flow based on several components including OpenROAD, Yosys, Magic, Netgen, CVC, SPEF-Extractor, CU-GR, Klayout and a number of custom scripts for design exploration and optimization. The flow performs full ASIC implementation steps from RTL all the way down to GDSII.

Follow the steps from the below git repository to install OpenLane on Ubuntu:

https://github.com/The-OpenROAD-Project/OpenLane>https://github.com/The-OpenROAD-Project/OpenLane

### Installation of Magic 
Enter the following commands to install the prerequisite files prior to Magic setup:
```
$ sudo apt-get update 
$ sudo apt-get install csh
$ sudo apt-get install x11
$ sudo apt-get install xorg
$ sudo apt-get install xorg openbox
$ sudo apt-get install freeglut3-dev
$ sudo apt-get install tcl-dev tk-dev
```
Commands for setting up Magic:
```
$ git clone https://github.com/RTimothyEdwards/magic
$ cd magic
$ ./configure
$ make
$ sudo make install
```    
## Simulation and Synthesis         
### Functional Simulation
To clone the Repository and download the Netlist files for Simulation, enter the following commands in your terminal:
```
$   sudo apt install -y git
$   git clone https://github.com/DebanganaMukherjee/iiitb_usr.git
$   cd iiitb_usr
$   iverilog iiitb_usr.v iiitb_usr_tb.v
$   ./a.out
$   gtkwave dump.vcd
```
### About Synthesis
Synthesis transforms the simple RTL design into a gate-level netlist with all the constraints as specified by the designer. In simple language, Synthesis is a process that converts the abstract form of design to a properly implemented chip in terms of logic gates.

Synthesis takes place in multiple steps:
- Converting RTL into simple logic gates.
- Mapping those gates to actual technology-dependent logic gates available in the technology libraries.
- Optimizing the mapped netlist keeping the constraints set by the designer intact

Invoke 'yosys' and execute the below commands to perform the synthesis of the above circuit:
```
$   read_liberty -lib ./lib/sky130_fd_sc_hd__tt_025C_1v80.lib
$   read_verilog iiitb_usr.v 
$   synth -top usr
$   dfflibmap -liberty ./lib/sky130_fd_sc_hd__tt_025C_1v80.lib  
$   abc -liberty -lib ./lib/sky130_fd_sc_hd__tt_025C_1v80.lib
$   show
$   stat
```
### Gate Level Simulation (GLS)
GLS implies running the testbench with netlist as the design under test. It is used to verify the logical correctness of the design after synthesis. It also ensures that the timing constraints are met.
Execute below commands in the project directory to perform GLS:
```
$   iverilog ./verilog_model/primitives.v ./verilog_model/sky130_fd_sc_hd.v usr_netlist.v iiitb_usr_tb.v
$   ./a.out
$   gtkwave dump.vcd
```
## Functional Characteristics
### Pre Synthesis Simulation Results
The Simulation Results for input data = '1001' are as follows:
<p align= 'center'><img src='https://user-images.githubusercontent.com/110731913/185220572-c7d7a025-a394-4d98-8387-55c5c69b9cd2.png'></p>

The above simulation displays Parallel Loading, Right Shift, Left Shift and Locked State (No Change) operations respectively on input data '1001'.
### Netlist Representation
<p align= 'center'><img src='https://user-images.githubusercontent.com/110731913/185226351-e487c84d-6790-4c5d-bcb8-b15fd4121f20.png'></p>

### Post Synthesis Statistics
Can be displayed with yosys command 'stat':
<p align= 'center'><img src='https://user-images.githubusercontent.com/110731913/185227238-d4402f8a-cd05-4d77-9252-93076c8fea3f.png'></p>

### Post Synthesis Simulation Results
Simulation (GLS) after Netlist generation:
<p align= 'center'><img src='https://user-images.githubusercontent.com/110731913/185229872-8e7916b1-e29f-4a68-988d-61df84030515.png'></p>

## Layout
After completion of Synthesis, we can proceed towards the steps of physical design. For this, we use OpenLane flow.

### Prerequisites

To run a custom design on openlane, navigate to the Openlane folder and run the following commands:
```
$ cd designs

$ mkdir iiitb_usr

$ cd iiitb_usr

$ mkdir src

$ touch config.json

$ cd src

$ touch iiitb_usr.v
```
Kindly note that the iiitb_usr.v file should contain the verilog RTL code you have used to get your post synthesis simulation result.

Copy the following files to src folder in your design:
- sky130_fd_sc_hd__fast.lib
- sky130_fd_sc_hd__slow.lib
- sky130_fd_sc_hd__typical.lib 
- sky130_vsdinv.lef files 
The src folder should finally contain:

![Screenshot (133)](https://user-images.githubusercontent.com/110731913/188311095-4f1907c7-4f5a-411b-9903-7261e8e402df.png)

The config.json folder present within the "iiitb_usr" folder should be modified as follows: 
Note: Add the verilog topmost module name under 'design_name'.

![Screenshot (134)](https://user-images.githubusercontent.com/110731913/188311293-f1a236c7-46c7-47ad-8542-d1ecc5b6de3b.png)

Next navigate to the Openlane folder in terminal and give the following command:

```
$ sudo make mount 
```
After entering the Openlane container give the following command:

```
$ ./flow.tcl -interactive
```

![Screenshot (103)1](https://user-images.githubusercontent.com/110731913/188311509-31e52c4a-26bd-4b05-b2ec-5669925b847d.png)

This command opens the interactive tcl console. In the tcl console type the following commands:
```
% package require openlane 0.9
% prep -design iiitb_usr
```
![Screenshot (103)](https://user-images.githubusercontent.com/110731913/188312550-12cface1-189d-43c1-ab21-ab24c73c5e2c.png)

The following commands are to merge the external the lef files to the merged.nom.lef file. 

```
% set lefs [glob $::env(DESIGN_DIR)/src/*.lef]
% add_lefs -src $lefs
```
![Screenshot (104)](https://user-images.githubusercontent.com/110731913/188312708-35f15c46-aa12-4b62-9d23-1771b922188d.png)

The contents of the merged.nom.lef file should contain the macro definition of "sky130_vsdinv":

![Screenshot (135)](https://user-images.githubusercontent.com/110731913/188312828-c38111b0-b320-4dd5-9f4c-b67c437843e7.png)

### Synthesis
```
% run_synthesis
```
![Screenshot (105)](https://user-images.githubusercontent.com/110731913/188312999-6327ce50-f2c6-4817-8587-7d5bc8b5fd3d.png)

#### Synthesis Reports

![Screenshot (106)](https://user-images.githubusercontent.com/110731913/188313051-a950376a-ac08-4df7-a77b-1dac44832360.png)

Setup and Hold Slack Post synthesis:

![Screenshot (136)](https://user-images.githubusercontent.com/110731913/188313339-5ac322dd-81e0-4016-8e9e-492c8b24ef86.png)

Flop Ratio:

```
Flop Ratio = Ratio of total number of flip flops / Total number of cells present in the design = 4/17 = 0.235
```
The sky130_vsdinv should also reflect in your netlist after synthesis:

![Screenshot (137)](https://user-images.githubusercontent.com/110731913/188313542-c760844b-f390-4fda-9b0b-1408e737a86a.png)

### Floorplan
```
% run_floorplan
```
![Screenshot (107)](https://user-images.githubusercontent.com/110731913/188313585-c463eef5-652a-4318-a11e-c56bdea441a4.png)

#### Floorplan Reports
Die Area:

![Screenshot (138)](https://user-images.githubusercontent.com/110731913/188313750-1a8d955b-4c85-4914-8ef9-be790dcfb9cc.png)

Core Area:

![Screenshot (139)](https://user-images.githubusercontent.com/110731913/188313756-3300338b-545d-406b-b61c-19e15b2707bf.png)

View the floorplan, using the below magic command in the terminal opened in the directory: <current_run_directory>/results/floorplan

```
$ magic -T /home/debangana3/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech read ../../tmp/merged.nom.lef def read usr.def &
```

![Screenshot (143)](https://user-images.githubusercontent.com/110731913/188316818-826b10e8-ac5b-4385-8326-fd480785253f.png)

Floorplan view:

![Screenshot (113)](https://user-images.githubusercontent.com/110731913/188314151-ec90eea3-e6db-410c-ac6c-4863831c2310.png)

![Screenshot (112)](https://user-images.githubusercontent.com/110731913/188314140-bc2b796f-251d-483b-9717-e4d2ebc26f41.png)

Refer below for the cells on floorplan (can be found by zooming into the left bottom corner):

![Screenshot (114)](https://user-images.githubusercontent.com/110731913/188314163-26159c25-e979-4b28-88fc-33c46292c95f.png)

### Placement
```
% run_placement
```
![Screenshot (115)](https://user-images.githubusercontent.com/110731913/188314224-cf64eeb8-02f6-4e27-b5d9-1f13f1c79c2f.png)

#### Placement Reports

View the placement in the layout, using the below Magic command in the terminal opened in the directory: <current_run_directory>/results/placement

```
$ magic -T /home/debangana3/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech read ../../tmp/merged.nom.lef def read usr.def &
```

![Screenshot (140)](https://user-images.githubusercontent.com/110731913/188314505-78ceae06-0632-47c1-9b44-94309b1c072f.png)

#### Placement View

![Screenshot (116)](https://user-images.githubusercontent.com/110731913/188314672-095af346-d7ab-4417-acf4-bfe8d2493e34.png)

![Screenshot (117)](https://user-images.githubusercontent.com/110731913/188314694-ecfffc55-1d06-41ee-a3ad-dcc6d6fe7998.png)

Placement view showing the sky130_vsdinv cells:

![Screenshot (118)](https://user-images.githubusercontent.com/110731913/188314885-3752d3d9-4d2b-4a51-bb78-e1e86d5fe811.png)


The sky130_vsdinv should also reflect in your netlist after placement:

![Screenshot (141)](https://user-images.githubusercontent.com/110731913/188315068-00b9284f-7316-47c7-8cf2-7e42fae91d5f.png)

### Clock Tree Synthesis

```
% run_cts
```
![Screenshot (120)](https://user-images.githubusercontent.com/110731913/188315299-a90869d7-be8b-40de-940a-dbd5d352594c.png)

### Routing

```
% run_routing
```
![Screenshot (121)](https://user-images.githubusercontent.com/110731913/188315367-15d44a39-5d22-4108-9706-900959bba392.png)

#### Routing Reports

View the layout after routing, using the below magic command in the terminal opened in the directory: <current_run_directory>/results/routing

```
$ magic -T /home/debangana3/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech read ../../tmp/merged.nom.lef def read usr.def &
```

![Screenshot (122)](https://user-images.githubusercontent.com/110731913/188315485-4e173fa6-b7c3-461a-8f28-58153f74c8b5.png)

Routing View

![Screenshot (123)](https://user-images.githubusercontent.com/110731913/188315633-54dfe7dd-34db-41f3-b08f-7ebb504df6a1.png)

![Screenshot (124)](https://user-images.githubusercontent.com/110731913/188315671-c35b1e69-5b32-43b1-9722-70db845fa382.png)

Routing view showing sky130_vsdinv (Cell 23):

![Screenshot (125)](https://user-images.githubusercontent.com/110731913/188315758-e44db7b1-4e23-4882-bbea-8cadbd58c96a.png)

Area report using Magic :

![Screenshot (128)](https://user-images.githubusercontent.com/110731913/188315828-e1bed655-f3f1-4b57-8b82-c75befef4cac.png)

The sky130_vsdinv should be visible in your netlist post-routing:

![Screenshot (142)](https://user-images.githubusercontent.com/110731913/188316006-727639c9-d48c-4a9c-9e93-e9458fce515c.png)

## Contributors
- Debangana Mukherjee
- Kunal Ghosh

## Acknowledgements
- Kunal Ghosh, Director, VSD Corp. Pvt. Ltd.

## Contact Information
- Debangana Mukherjee, Research Scholar at International Institute of Information Technology, Bangalore (debangana.mukherjee@iiitb.ac.in)
- Kunal Ghosh, Director, VSD Corp. Pvt. Ltd. (kunalghosh@gmail.com)

## References
- www.geeksforgeeks.org/universal-shift-register-in-digital-logic/
- https://media.cheggcdn.com/media/d06/phpjKEYI9
- For verilog code and testbench: https://youtu.be/kVMb3seJKhI







