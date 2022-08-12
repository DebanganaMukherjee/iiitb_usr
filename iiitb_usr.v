module iiitb_usr(
input wire clk, reset,
	input wire [1:0] ctrl,
	input wire [3:0] d,
	output wire [3:0] q
);

reg[3:0] r_reg, r_next;
always @(posedge clk, posedge reset)
	if (reset)
		r_reg<=0;
	else
		r_reg<=r_next;

always @*
	case(ctrl)
		2'b00: r_next=r_reg;
		2'b10: r_next={r_reg[2:0],r_reg[3]};
		2'b01: r_next={r_reg[0],r_reg[3:1]};
		default: r_next=d;
	endcase
assign q=r_reg;
endmodule

