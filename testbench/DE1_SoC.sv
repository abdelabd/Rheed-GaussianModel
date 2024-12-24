// Top-level module that defines the I/Os for the DE-1 SoC board 
 
module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW); 
 output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; 
 output logic [9:0] LEDR; 
 input logic [3:0] KEY; 
 input logic [9:0] SW; 
 
 // Turn off unused pinout
 assign LEDR[9:2] = 8'b00000000;
 assign HEX5 = 7'b1111111;
 
 UPC_item_name item_name_on_HEX (.U(SW[2]), .P(SW[1]), .C(SW[0]), .HEX4(HEX4), .HEX3(HEX3), .HEX2(HEX2), .HEX1(HEX1), .HEX0(HEX0));
 discounted discounted_on_LEDR1 (.out(LEDR[1]), .U(SW[2]), .P(SW[1]), .C(SW[0]));
 stolen stolen_on_LEDR0(.out(LEDR[0]), .U(SW[2]), .P(SW[1]), .C(SW[0]), .M(SW[9]));
 
endmodule 

module DE1_SoC_testbench(); 
 logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; 
 logic [9:0] LEDR; 
 logic [3:0] KEY; 
 logic [9:0] SW; 
 
 DE1_SoC dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR, .SW); 
 
 // Try all combinations of inputs. 
 integer i;
	initial begin 
	 for (i=0; i < 16; i++) begin
		{SW[9], SW[2:0]} = i; #10;
	 end
end
endmodule