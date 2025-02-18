module RegFile #(parameter Width = 8 , Depth = 16 , ADDR = 4)
(
	input wire clk,reset_n,Wr_En,Rd_En,
	input wire [ADDR - 1:0] Address,
	input wire [Width - 1:0] WrData,
	output reg [Width - 1:0] RdData,
	output reg Rd_D_Vld,
	output wire [Width-1:0] REG0,REG1,REG2,REG3                          
);

	reg [Width - 1:0] RegFile [Depth - 1:0];
	integer i;
	
	always @(posedge clk or negedge reset_n)
	begin
		if (!reset_n)
		begin
			for (i = 0;i < Depth; i = i+1) 
			begin
				if (i == 2)
					RegFile [i] <= 8'b100000_01;            // config for parity_en = 1, parity_type = 0 and prescale = 32
				else if (i == 3)
					RegFile [i] <= 8'b00100000;            // config for i_div_ratio = 32
				else
					RegFile [i] <= 0;         
		    end
			Rd_D_Vld <= 0;
		end
		
		else if (Wr_En && !Rd_En)
			RegFile[Address] <= WrData;
		
		else if (Rd_En & !Wr_En)
		begin
			RdData <= RegFile[Address];
			Rd_D_Vld <= 1;
		end
		
		else
		begin
			Rd_D_Vld <= 0;
		end
	end
	
	assign REG0 = RegFile[0];                           //operand A for the ALU
	assign REG1 = RegFile[1];                           //operand B for the ALU
	assign REG2 = RegFile[2];                           //UART_CONFIG Register
	assign REG3 = RegFile[3];                           //Div_Ratio Register
	
endmodule

	
