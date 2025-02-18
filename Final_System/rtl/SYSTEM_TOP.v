module SYSTEM_TOP
(
	input wire REF_CLK,UART_CLK,
	input wire RST,
	input wire RX_IN,
	output wire TX_OUT,Stop_Error,Parity_Error
);

	wire SYNC_RST1;              //RST ---> REF_CLK
	wire SYNC_RST2;              //RST ---> UART_CLK
	wire WrEn,RdEn,Rd_D_Vld;    //outputs from sys_ctrl and inputs to reg_file
	wire [3:0] Addr;            //address to the Reg file
	wire [7:0] Wr_D,Rd_D;       // inputs and outputs of Reg file
	wire [3:0] FUN;             //input to the ALU and output of SYS_CTRL
	wire [7:0] Op_A,Op_B;
	wire [15:0] ALU_OUT;
	wire OUT_Valid;
	wire EN,Gate_EN;
	wire ALU_CLK;
	wire [7:0] unsync_data,sync_data;
	wire unsync_valid,sync_valid;
	wire FIFO_FULL,WR_INC;
	wire [7:0] WR_DATA;
	wire Busy,RD_INC;
	wire F_EMPTY;
	wire [7:0] RD_DATA;
	wire RX_CLKK,RX_CLK,TX_CLK;
	wire [7:0] UART_CONFIG;
	wire [7:0] Div_Ratio_TX;
	wire [7:0] Div_Ratio_RXX;
	reg [7:0] Div_Ratio_RX;
	
	always @(*)
	begin
		case (UART_CONFIG[7:2])
		6'b100000: Div_Ratio_RX = 8'b00000001;
		6'b010000: Div_Ratio_RX = 8'b00000010;
		6'b001000: Div_Ratio_RX = 8'b00000100;
		6'b000100: Div_Ratio_RX = 8'b00001000;
		default: Div_Ratio_RX = 8'b00000001;
		endcase
	end
	
	assign Div_Ratio_RXX = Div_Ratio_RX;
	

	SYS_CTRL B0
	(
	.REF_CLK(REF_CLK),
    .SYNC_RST(SYNC_RST1), 
	.SYNC_VALID(sync_valid),
    .SYNC_P_DATA(sync_data),
    .FIFO_FULL(FIFO_FULL),
    .OUT_VALID(OUT_Valid),
    .ALU_OUT(ALU_OUT),
    .Rd_D_Vld(Rd_D_Vld),
    .Rd_D(Rd_D),
    .WrEN(WrEn), 
	.RdEN(RdEn), 
	.WR_INC(WR_INC), 
	.EN(EN), 
	.Gate_EN(Gate_EN),
    .Wr_D(Wr_D), 
	.WR_DATA(WR_DATA),
    .FUNC(FUN),
    .Addr(Addr)
	);
	
	
	RegFile B1
	(
	.clk(REF_CLK),
	.reset_n(SYNC_RST1),
	.Wr_En(WrEn),
	.Rd_En(RdEn),
	.Address(Addr),
	.WrData(Wr_D),
	.RdData(Rd_D),
	.Rd_D_Vld(Rd_D_Vld),
	.REG0(Op_A),
	.REG1(Op_B),
	.REG2(UART_CONFIG),
	.REG3(Div_Ratio_TX)
	);
	
	alU B2
	(
	.clk(ALU_CLK),
	.reset_n(SYNC_RST1),
	.en(EN),
	.A(Op_A),
	.B(Op_B),
	.ALU_FUN(FUN),
	.ALU_OUT(ALU_OUT),
	.OUT_VALID(OUT_Valid)
	);
	
	CLK_GATE B3
	(
	.CLK_EN(Gate_EN),
	.CLK(REF_CLK),
	.GATED_CLK(ALU_CLK)
	);	
		
	
	UART_TOP B4
	(
	.TX_CLK(TX_CLK),
	.RX_CLK(RX_CLK),
	.SYNC_RST(SYNC_RST2),
	.F_EMPTY(!F_EMPTY),
	.RX_IN(RX_IN),
	.UART_CONFIG(UART_CONFIG),
	.RD_DATA(RD_DATA),
	.BUSY(Busy),
	.VALID(unsync_valid),
	.TX_OUT(TX_OUT),
	.P_DATA(unsync_data),
	.Stop_Error(Stop_Error),
	.Parity_Error(Parity_Error)
	);

	
	DATA_SYNC B5
	(
	.clk(REF_CLK), 
	.reset_n(SYNC_RST1),
	.bus_enable(unsync_valid),
	.unsync_bus(unsync_data),
	.enable_pulse(sync_valid),
	.sync_bus(sync_data)
	);

	
	RST_SYNC B6
	(
	.clk(REF_CLK), 
	.reset_n(RST),
	.SYNC_RST(SYNC_RST1)                      
	);
	
	RST_SYNC B7
	(
	.clk(UART_CLK), 
	.reset_n(RST),
	.SYNC_RST(SYNC_RST2)
	);
	
	
	PULSE_GEN B8
	(
	.clk(TX_CLK), 
	.reset_n(SYNC_RST2),
	.D(Busy),
	.Pulse(RD_INC)
	);
	
	
	FIFO_TOP B9                           //fifo module 
	(
	.wclk(REF_CLK),
	.rclk(TX_CLK),
	.wrst_n(SYNC_RST1),
	.rrst_n(SYNC_RST2),
	.winc(WR_INC),
	.rinc(RD_INC),
	.wdata(WR_DATA),
	.rdata(RD_DATA),
	.wfull(FIFO_FULL),
	.rempty(F_EMPTY)
	);
	
	
	ClkDIV B10                       //clock div for RX
	(
	.clk(UART_CLK),
	.reset_n(SYNC_RST2),
	.enable(1'b1),                           
	.I_div_ratio(Div_Ratio_RXX),
	.o_div_clk(RX_CLKK)
	);

	ClkDIV B11
	(
	.clk(UART_CLK),
	.reset_n(SYNC_RST2),
	.enable(1'b1),                          
	.I_div_ratio(Div_Ratio_TX),
	.o_div_clk(TX_CLK)
	);
	
	mux B12
	(
	.in1(UART_CLK),
	.in2(RX_CLKK),
	.sel(Div_Ratio_RX[0]),
	.out(RX_CLK)
	);


endmodule
	