module alU 
(
	input wire clk,reset_n,en,
	input wire [7:0] A,B,
	input wire [3:0] ALU_FUN ,
	output reg [15:0] ALU_OUT,
	output reg OUT_VALID
);

	reg [15:0] ALU_OUT_next;
	reg out_valid;

	always @(posedge clk, negedge reset_n)
	begin
		if (~reset_n)
		begin
			ALU_OUT <= 0;
			OUT_VALID <= 0;
		end
		
		else
		begin
			ALU_OUT <= ALU_OUT_next;
			OUT_VALID <= out_valid;
		end
	end
	
	always @(*)
	begin
		ALU_OUT_next = 16'h0000;
		out_valid = 0;
		if (en)
		begin
			out_valid = 1;
			case (ALU_FUN)
			4'b0000:  ALU_OUT_next = A + B;                                       //Arithmatic : unsigned Addition
			4'b0001:  ALU_OUT_next = A - B;                                       //Arithmatic : unsigned Subtraction   
			4'b0010:  ALU_OUT_next = A * B;                                       //Arithmatic : unsigned Multiplication 0010
			4'b0011:  ALU_OUT_next = A / B;                                       //Arithmatic : unsigned Division	
			4'b0100:  ALU_OUT_next = A & B;                                       //Logic AND 
			4'b0101:  ALU_OUT_next = A | B;                                       //Logic OR 
			4'b0110:  ALU_OUT_next = ~(A & B);                                    //Logic NAND 
			4'b0111:  ALU_OUT_next = ~(A | B);                                    //Logic NOR 
			4'b1000:  ALU_OUT_next = A ^ B;                                       //Logic XOR 
			4'b1001:  ALU_OUT_next = ~(A ^ B);                                    //Logic XNOR 
			4'b1010:  ALU_OUT_next = (A == B)? 16'h0001:16'h0000;                 //CMP: A = B
			4'b1011:  ALU_OUT_next = (A > B)? 16'h0002:16'h0000;						 //CMP: A > B
			4'b1100:  ALU_OUT_next = (A < B)? 16'h0003:16'h0000;                  //CMP: A < B
			4'b1101:  ALU_OUT_next = A >> 1;                                      //SHIFT: A >> 1
			4'b1110:  ALU_OUT_next = A << 1;                                      //SHIFT: A << 1
			default:  ALU_OUT_next = 16'h0000;
			endcase
		end
		else
		begin
			ALU_OUT_next = 16'h0000;
			out_valid = 0;
		end
	end
		
endmodule
