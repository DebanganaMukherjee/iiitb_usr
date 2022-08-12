`timescale 1ms/1ms
module tb;
  wire [3:0] q;
  reg clk, reset;
  reg [1:0] ctrl;
  reg [3:0] d;

iiitb_usr uut(clk, reset, ctrl, d, q);
always #5 clk = ~clk;
initial
begin
	clk=0; reset=0;

d=4'b1001;
ctrl=2'b11; //parallel loading data=1001

#10;
ctrl = 2'b01; //right shifting operation on 1001

#40;

ctrl=2'b10; //left shifting operation on 1001

#40;
ctrl=2'b00;

   
end
  
    
  //enabling the wave dump
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;

  end
  
endmodule
  
    
  
