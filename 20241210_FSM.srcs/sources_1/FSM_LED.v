`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 03:35:31 PM
// Design Name: 
// Module Name: FSM_LED
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


module FSM_LED_HOMEWORK (
    input [2:0] sw,
    input clk,
    rs,
    output reg [2:0] o_led
);

localparam IDLE = 3'b000;
localparam LED_01 = 3'b001;
localparam LED_02 = 3'b010;
localparam LED_03 = 3'b100;

reg [2:0] state, state_next;


always @(posedge clk, posedge rs) begin
    if(rs)begin
        state <= IDLE;
    end
    else begin
        state <= state_next;
    end
end



always @(*) begin
    
    state_next = state;   


    case (state)

        IDLE: if(sw == 3'b001) begin
            state_next = LED_01;
        end
        else if(sw == 3'b100) begin
            state_next = LED_02;
        end
        else if(sw == 3'b101) begin
            state_next = LED_03;
        end


        LED_01: if(sw == 3'b011) begin
            state_next = LED_02;
        end
        

        LED_02: if(sw == 3'b111) begin
            state_next = LED_01;
        end
        else if(sw == 3'b010) begin
            state_next = LED_03;
        end


        LED_03: if(sw == 3'b110) begin
            state_next = LED_02;
        end
        else if(sw == 3'b000) begin
            state_next = IDLE;
        end


        default: state_next = state;
    endcase

end



always @(*) begin

    o_led = 3'b000;

    case (state)
        
        IDLE: o_led = 3'b000;
        LED_01: o_led = 3'b001;
        LED_02: o_led = 3'b010;
        LED_03: o_led = 3'b100;

        default: o_led = 3'b000;
    endcase

end





endmodule



module FSM_LED (
    input            clk,
    reset,
    input      [2:0] sw,
    output reg [1:0] o_led
);

    localparam IDLE = 2'b00;
    localparam LED_01 = 2'b01;
    localparam LED_02 = 2'b10;

    reg [1:0] state, state_next;

    // 1. State Register 설계
    always @(posedge clk, posedge reset) begin
        if (reset) begin
            state <= 2'b00;
        end else begin
            state <= state_next;
        end

    end

    // 2. State 전환 Combinational logic 설계
    always @(*) begin
        state_next = state;
        case (state)
            IDLE: begin
                if (sw == 3'b001) begin
                    state_next = LED_01;
                end
            end


            LED_01: begin
                if (sw == 3'b011) begin
                    state_next = LED_02;
                end
            end


            LED_02: begin
                if (sw == 3'b111) begin
                    state_next = IDLE;
                end
            end




            default: state_next = state;
        endcase
    end

    // 3. 동작 Combinational logic 설계
    always @(*) begin
        case (state)

            IDLE: o_led = 2'b00;

            LED_01: o_led = 2'b01;

            LED_02: o_led = 2'b10;

            default: o_led = 2'b00;
        endcase
    end



endmodule
