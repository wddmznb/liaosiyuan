`timescale 1ns/1ps

module cordic_Btb();

parameter PERIOD = 10;
reg clk;
reg rst_n;
reg signed [31:0] x;
reg signed [31:0] y;
reg start;
reg start1;
wire signed [31:0] 	angle;
wire signed [31:0] anglef;
initial begin
	clk = 0;
	rst_n = 0;
	x = 'b0;
	y = 'b0;
	start1 = 0;
	start = 0;
	#100 rst_n = 1;

	#10 @(posedge clk) start = 1;
	#10 @(posedge clk) 				x = -9'd6 ; 		y = -9'd8 ;
	#10 @(posedge clk) 	     start1 = 1;
	#100000 $stop;	
end

always #(PERIOD/2) clk = ~clk;

cordic_B inst1(
		.clk(clk),
		.rst_n(rst_n),
		.x(x),
		.y(y),
		.start(start),
		.start1(start1),
		.angle(angle),
		.anglef(anglef)

		
		
);

		
		
		
endmodule
