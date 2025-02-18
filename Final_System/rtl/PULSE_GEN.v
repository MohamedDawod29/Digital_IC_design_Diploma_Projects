module PULSE_GEN 
(
	input wire clk, reset_n,
	input wire D,
	output reg Pulse
);

	reg Q;
	
	always @(posedge clk, negedge reset_n)
	begin
		if (~reset_n)
		begin
			Q <= 0;
			Pulse <= 0;
		end
		else
		begin
			Q <= D;
			Pulse <= (!Q) && D;
		end
	end
	

endmodule	