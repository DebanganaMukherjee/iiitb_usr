read_liberty -lib /home/debangana3/iiitb_usr/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog iiitb_usr.v

#generic synthesis
synth -top iiitb_usr
opt_clean -purge
dfflibmap -liberty /home/debangana3/iiitb_usr/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
clean

opt
abc -liberty /home/debangana3/iiitb_usr/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
clean
flatten
write_verilog -noattr iiitb_usr_synth.v
stat
show


