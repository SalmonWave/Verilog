`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 10:39:48 AM
// Design Name: 
// Module Name: FSM_MEALY_LED
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


module FSM_MEALY_LED (
    input clk,
    reset,
    input [1:0] sw,
    output [1:0] led
);

    localparam IDLE = 2'b00;
    localparam LED_ON = 2'b01;


    reg [1:0] state, state_next;

    always @(posedge clk, posedge reset) begin
        if (reset) begin
            state <= IDLE;
        end else begin
            state <= state_next;
        end
    end



    always @(*) begin
        state_next = state;

        case (state)

            IDLE:
            if (sw == 2'b01) begin
                state_next = LED_ON;
                //      MEALY 머신 구현. 상태 변화가 현재 state, input에 의존함.
            end

            LED_ON:
            if (sw == 2'b00) begin
                state_next = IDLE;
            end


            default: state_next = state;
        endcase
    end


    assign led = (sw == 2'b01) ? 2'b11 : 2'b00;


endmodule
