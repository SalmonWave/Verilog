`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2024 01:08:14 PM
// Design Name: 
// Module Name: mealy_seq_det
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mealy_seq_det(
    input clk, reset, din,
    output reg is_seq
    );


reg [2:0] state, next_state;


localparam START       = 3'b000;
localparam RD0_ONCE    = 3'b001;
localparam RD0_TWICE   = 3'b010;
localparam RD1_ONCE    = 3'b100;
localparam RD1_TWICE   = 3'b101;


always @(posedge clk, posedge reset) begin
    if(reset)begin
        state <= START;
        is_seq <= 0;
    end else begin
        state <= next_state;
    end
end

always @(state, din) begin
    next_state = state;

    case (state)
        
        START : 
        begin
            if(din) begin
                next_state = RD1_ONCE;
            end else begin
                next_state = RD0_ONCE;
            end
        end

        RD0_ONCE :
        begin
            if(din) begin
                next_state = RD1_ONCE;
            end else begin
                next_state = RD0_TWICE;
            end
        end

        RD0_TWICE :
        begin
            if(din) begin
                next_state = RD1_ONCE;
            end else begin
                next_state = RD0_TWICE;
            end
        end

        RD1_ONCE :
        begin
            if(din) begin
                next_state = RD1_TWICE;
            end else begin
                next_state = RD0_ONCE;
            end
        end

        RD1_TWICE :
        begin
            if(din) begin
                next_state = RD1_TWICE;
            end else begin
                next_state = RD0_ONCE;
            end
        end

        default: next_state = state;
    endcase

assign is_seq = (((state == RD0_TWICE) && (din == 0) || (state == RD1_TWICE) && (din == 1))) ? 1 : 0;

end


endmodule
