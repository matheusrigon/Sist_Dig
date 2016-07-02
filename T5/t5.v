module area(input [10:0] x1, y1, x2, y2, x3, y3,
	output 	     s);

   wire signed [10:0] t1;
   wire signed [10:0] t2;
   wire signed [10:0] t3;
   wire signed [10:0] t4;

   wire signed [23:0] m1;
   wire signed [23:0] m2;

   assign t1 = x1 - x3;
   assign t2 = y2 - y3;
   assign t3 = x2 - x3;
   assign t4 = y1 - y3;

   assign m1 = t1 * t2;
   assign m2 = t3 * t4;

   assign s = m1 < m2;
endmodule // triangulo

module verifica(input [10:0] px, py, x1, y1, x2, y2, x3, y3,
		output 	     s);

   wire 		     b1;
   wire 		     b2;
   wire 		     b3;

   area A1(px, py, x1, y1, x2, y2, b1);
   area A2(px, py, x2, y2, x3, y3, b2);
   area A3(px, py, x3, y3, x1, y1, b3);

   assign s = (b1 == b2) & (b2 == b3);
endmodule // verifica

module test;
   integer entrada;
   integer saida;
   integer t5_file;

   reg [90:0] value;

   reg [10:0] x1, y1, x2, y2, x3, y3, px, py;

   verifica triangle(px, py, x1, y1, x2, y2, x3, y3, s);

   integer    x, y;

   initial begin
      entrada  = $fopen("entrada.txt", "r");
      saida = $fopen("saidaV.txt", "w");


      if(entrada == 0) begin
	 $display("Não consigo abrir arquivo");
	 $finish;
      end
   end

   always #2 begin
      if(!$feof(entrada)) begin
	 value = $fscanf(entrada, "%d %d %d %d %d %d %d %d\n", x1, y1, x2, y2, x3, y3, px, py);
	 #1
		  $fwrite(saida, "%0d\n", s);
	end
      else
	$finish;
   end
endmodule
