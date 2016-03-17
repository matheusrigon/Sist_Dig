module led(input clk, output led);
	assign led = clk;
endmodule

module pisca;
	wire led;
	reg clk;
	
	led L(clk, led);

	always #2 clk = ~clk;

	initial begin
		$dumpvars(0, L);
		clk = 0;

		#500;
		$finish;
	end
endmodule
