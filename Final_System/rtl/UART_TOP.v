module UART_TOP #(parameter DATA_WIDTH = 8, scale_WIDTH = 6)
(
	input wire TX_CLK,RX_CLK,
	input wire SYNC_RST,
	input wire F_EMPTY,RX_IN,
	input wire [DATA_WIDTH-1:0] UART_CONFIG,
	input wire [DATA_WIDTH-1:0] RD_DATA,
	output wire BUSY,VALID,TX_OUT,
	output wire [DATA_WIDTH-1:0] P_DATA,
	output wire Stop_Error,
	output wire Parity_Error
);

	UART_RX #(.DATA_WIDTH(DATA_WIDTH), .scale_WIDTH(scale_WIDTH)) B0
	(
	.clk(RX_CLK),
	.reset_n(SYNC_RST),
	.RX_IN(RX_IN),
	.prescaler(UART_CONFIG[7:2]),
	.PAR_EN(UART_CONFIG[0]),
	.PAR_TYP(UART_CONFIG[1]),
	.data_valid(VALID),
	.P_DATA(P_DATA),
	.Stop_Error(Stop_Error),
	.Parity_Error(Parity_Error)
	);
	
	
	UART_TX #(.DATA_WIDTH(DATA_WIDTH)) B1
	(
	.clk(TX_CLK),
	.reset_n(SYNC_RST),
	.Data_Valid(F_EMPTY),
	.PAR_EN(UART_CONFIG[0]),
	.PAR_TYP(UART_CONFIG[1]),
	.P_DATA(RD_DATA),
	.busy(BUSY),
	.TX_OUT(TX_OUT)
	);
	
endmodule
