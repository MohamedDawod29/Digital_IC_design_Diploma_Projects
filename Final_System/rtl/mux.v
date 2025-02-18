module mux
(
	input wire in1,in2,sel,
	output reg out
); 

	always @(*)
	begin
		out = sel ? in1 : in2;
	end
	
endmodule