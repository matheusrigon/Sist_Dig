module contador(input CLOCK_50, output [0:0]LEDG);

	reg led = 1;

	reg [31:0] contador;

	assign LEDG[0] = led;

	always @(posedge CLOCK_50) begin
		if(contador == 5000000) begin
			led = ~led;
			contador = 0;
		end 
		else begin
			contador = contador + 1;
		end 	
	end

endmodule
