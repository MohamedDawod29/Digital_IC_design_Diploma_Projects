module SYS_CTRL #( parameter WIDTH = 8,ADDR = 4) 

(
    // Inputs
    input wire REF_CLK,
    input wire SYNC_RST,
    input wire SYNC_VALID,
    input wire [WIDTH-1:0] SYNC_P_DATA,
    input wire FIFO_FULL,
    input wire OUT_VALID,
    input wire [WIDTH*2-1:0] ALU_OUT,
    input wire Rd_D_Vld,
    input wire [WIDTH-1:0] Rd_D,

    // Outputs
    output reg WrEN,
    output reg RdEN,
    output reg WR_INC,
    output reg EN,
    output reg Gate_EN,
    output reg [WIDTH-1:0] Wr_D,
    output reg [WIDTH-1:0] WR_DATA,
    output reg [ADDR-1:0] FUNC,
    output reg [ADDR-1:0] Addr
);



    // FSM States

    localparam [3:0]  IDLE = 4'd0, RF_WRITING = 4'd1, RF_WAITING_DATA = 4'd2, RF_READING = 4'd3, RF_WAITING_VLD = 4'd4, ALU_OP_A = 4'd5, ALU_OP_B = 4'd6, ALU_FUNC =  4'd7, ALU_WAITING_VLD = 4'd8, ALU_WR_IN_FIFO = 4'd9;

    reg [3:0] next_state, current_state;
    reg next_count, current_count;

	reg [3:0] Addr1;
	
    // State Transition

    always @(posedge REF_CLK or negedge SYNC_RST) 
	begin
        if (!SYNC_RST) 
		begin
			current_state <= IDLE;
            current_count <= 0;
			Addr1 <= 0;
        end 
		else 
		begin
			current_state <= next_state;
            current_count <= next_count;
			Addr1 <= Addr;
        end
    end


    // Next State Logic and Output Logic

    always @(*) 
	begin
        // Default values for outputs
        WrEN = 0;
        RdEN = 0;
        WR_INC = 0;
        EN = 0;
        Gate_EN = 0;
        Wr_D = 0;
        WR_DATA = 0;
        FUNC = 0;
		next_count = 0;
		Addr = Addr1;
		
        case (current_state)
            IDLE: 
			begin
                if (SYNC_VALID) 
				begin
                    case (SYNC_P_DATA)
                        8'hAA: next_state = RF_WRITING;
                        8'hBB: next_state = RF_READING;
                        8'hCC: next_state = ALU_OP_A;
                        8'hDD: next_state = ALU_FUNC;
                        default: next_state = IDLE;
                    endcase
                end 
				else 
				begin
                    next_state = IDLE;
                end
            end
			
			RF_WRITING: 
			begin
                if (SYNC_VALID) 
				begin
                    Addr = SYNC_P_DATA[ADDR-1:0];
                    next_state = RF_WAITING_DATA;
                end 
				else 
				begin
                    next_state = RF_WRITING;
                end
            end


            RF_WAITING_DATA: 
			begin
                if (SYNC_VALID) 
				begin
                    WrEN = 1;
                    Wr_D = SYNC_P_DATA;
                    next_state = IDLE;
                end 
				else 
				begin
                    next_state = RF_WAITING_DATA;
                end
            end


            RF_READING: 
			begin
                if (SYNC_VALID) 
				begin
                    RdEN = 1;
                    Addr = SYNC_P_DATA[ADDR-1:0];
                    next_state = RF_WAITING_VLD;
                end 
				else 
				begin
                    next_state = RF_READING;
                end

            end



            RF_WAITING_VLD: 
			begin
                RdEN = 1;
                if (Rd_D_Vld && !FIFO_FULL) 
				begin
                    WR_INC = 1;
                    WR_DATA = Rd_D;
                    next_state = IDLE;
                end 
				else 
				begin
                    next_state = RF_WAITING_VLD;
                end
            end


            ALU_OP_A: 
			begin
                if (SYNC_VALID) 
				begin
                    WrEN = 1;
                    Wr_D = SYNC_P_DATA;
                    Addr = 4'b0000; // Address for Op_A
                    next_state = ALU_OP_B;
                end 
				else 
				begin
                    next_state = ALU_OP_A;
                end
            end


            ALU_OP_B: 
			begin
                if (SYNC_VALID) 
				begin
                    WrEN = 1;
                    Gate_EN = 1;
                    Wr_D = SYNC_P_DATA;
                    Addr = 4'b0001; // Address for Op_B
                    next_state = ALU_FUNC;
                end 
				else 
				begin
                    next_state = ALU_OP_B;
                end
            end


            ALU_FUNC: 
			begin
                if (SYNC_VALID) 
				begin
                    EN = 1;
                    Gate_EN = 1;
					FUNC = SYNC_P_DATA[ADDR-1:0];
                    next_state = ALU_WAITING_VLD;
                end 
				else 
				begin
                    next_state = ALU_FUNC;
                end
            end


            ALU_WAITING_VLD: 
			begin
                if (OUT_VALID && !FIFO_FULL) 
				begin
                    WR_INC = 1;
                    if (!current_count) 
					begin
                        WR_DATA = ALU_OUT[7:0];
                        next_count = 1;
                        next_state = ALU_WAITING_VLD;
                    end 
					else 
					begin
                        WR_DATA = ALU_OUT[15:8];
                        next_count = 0;
                        next_state = IDLE;
                    end
                end 
				else 
				begin
                    next_state = ALU_WAITING_VLD;
                end
            end

            default: 
			begin
                next_state = IDLE;
            end
        endcase
    end

endmodule
