`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2024 03:45:27 PM
// Design Name: 
// Module Name: UART_CONTROL
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


module UART_tx(
    input clk, baud_rate_tick, reset, start, [7:0] i_tx_data,
    output o_tx_data, tx_done,
    output reg tx_busy 
    );


    localparam IDLE = 4'b0000;
    localparam START = 4'b0001;
    localparam STOP = 4'b1111;
    localparam D0 = 4'b0010;
    localparam D1 = 4'b0011;
    localparam D2 = 4'b0100;
    localparam D3 = 4'b0101;
    localparam D4 = 4'b0110;
    localparam D5 = 4'b0111;
    localparam D6 = 4'b1000;
    localparam D7 = 4'b1001;
    
    reg [4:0] trigger_counter, trigger_counter_next;
    reg [3:0] state, next_state;
    reg r_tx_data;
    reg r_tx_done, r_tx_done_next;

    assign o_tx_data = r_tx_data;
    assign tx_done = r_tx_done;

    always @(posedge clk, posedge reset) begin
        if(reset) begin
            state <= IDLE;
            trigger_counter <= 0;
        end else begin
            state <= next_state;
            trigger_counter <= trigger_counter_next;
            r_tx_done <= r_tx_done_next;
        end
    end


    always @(*) begin

        next_state = state;
        trigger_counter_next = trigger_counter;
        r_tx_done_next = r_tx_done;
        r_tx_data = 1'b1;
        

        case(state)

        IDLE: 
        begin
            r_tx_done_next = 1'b0; 
            r_tx_data = 1'b1;
            tx_busy = 1'b0;
        if(start) begin
            next_state = START;
            trigger_counter_next = 0;
        end 
        end


        START:  
        begin
            r_tx_data = 1'b0;
            tx_busy = 1'b1;

            if(baud_rate_tick) begin
                if(trigger_counter == (16 - 1)) begin
                    next_state = D0;
                    trigger_counter_next = 0;
                end else begin
                    trigger_counter_next = trigger_counter + 1;
                end
            end

        end

        D0:
        begin
            r_tx_data = i_tx_data[0];

            if(baud_rate_tick) begin
                if(trigger_counter == (16 - 1)) begin
                    next_state = D1;
                    trigger_counter_next = 0;
                end else begin
                    trigger_counter_next = trigger_counter + 1;
                end
            end

        end


        D1:
        begin
            r_tx_data = i_tx_data[1];

            if(baud_rate_tick) begin
                if(trigger_counter == (16 - 1)) begin
                    next_state = D2;
                    trigger_counter_next = 0;
                end else begin
                    trigger_counter_next = trigger_counter + 1;
                end
            end

        end

        D2:
        begin
            r_tx_data = i_tx_data[2];

            if(baud_rate_tick) begin
                if(trigger_counter == (16 - 1)) begin
                    next_state = D3;
                    trigger_counter_next = 0;
                end else begin
                    trigger_counter_next = trigger_counter + 1;
                end
            end

        end

        D3:
        begin
            r_tx_data = i_tx_data[3];

            if(baud_rate_tick) begin
                if(trigger_counter == (16 - 1)) begin
                    next_state = D4;
                    trigger_counter_next = 0;
                end else begin
                    trigger_counter_next = trigger_counter + 1;
                end
            end

        end

        D4:
        begin
            r_tx_data = i_tx_data[4];

            if(baud_rate_tick) begin
                if(trigger_counter == (16 - 1)) begin
                    next_state = D5;
                    trigger_counter_next = 0;
                end else begin
                    trigger_counter_next = trigger_counter + 1;
                end
            end

        end

        D5: 
        begin
            r_tx_data = i_tx_data[5];

            if(baud_rate_tick) begin
                if(trigger_counter == (16 - 1)) begin
                    next_state = D6;
                    trigger_counter_next = 0;
                end else begin
                    trigger_counter_next = trigger_counter + 1;
                end
            end

        end

        D6:
        begin
            r_tx_data = i_tx_data[6];

            if(baud_rate_tick) begin
                if(trigger_counter == (16 - 1)) begin
                    next_state = D7;
                    trigger_counter_next = 0;
                end else begin
                    trigger_counter_next = trigger_counter + 1;
                end
            end

        end

        D7:
        begin
            r_tx_data = i_tx_data[7];

            if(baud_rate_tick) begin
                if(trigger_counter == (16 - 1)) begin
                    next_state = STOP;
                    trigger_counter_next = 0;
                end else begin
                    trigger_counter_next = trigger_counter + 1;
                end
            end

        end

        STOP:
        begin
            r_tx_data = 1'b1;

            if(baud_rate_tick) begin
                if(trigger_counter == (16 - 1)) begin
                    next_state = IDLE;
                    trigger_counter_next = 0;
                    tx_busy = 1'b0;
                    r_tx_done_next = 1'b1;
                end else begin
                    trigger_counter_next = trigger_counter + 1;
                end
            end

        end

        default: begin
            next_state = IDLE;
            trigger_counter_next = 0;
            r_tx_done_next = 0;
        end

        endcase       
         
    end







endmodule
