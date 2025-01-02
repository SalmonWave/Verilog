`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/05 15:13:04
// Design Name: 
// Module Name: counter 
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


module tick_gen_100kHz (
    input  clk,
    reset,
    output reg tick_100kHz
);

    reg [$clog2(1_000) - 1 : 0] r_tick_cnt;

    always @(posedge clk, posedge reset) begin
        if (reset) begin
            r_tick_cnt <= 0;
        end else begin
            if (r_tick_cnt == 1_000) begin
                r_tick_cnt <= 0;
                tick_100kHz <= 1'b1;
            end else begin
                r_tick_cnt <= r_tick_cnt + 1;
                tick_100kHz <= 1'b0;
            end
        end
    end

endmodule


module tick_gen_1kHz (
    input  clk,
    reset,
    output reg tick_1kHz
);

    reg [$clog2(100_0000) - 1 : 0] r_tick_cnt;

    always @(posedge clk, posedge reset) begin
        if (reset) begin
            r_tick_cnt <= 0;
        end else begin
            if (r_tick_cnt == 100_000) begin
                r_tick_cnt <= 0;
                tick_1kHz <= 1'b1;
            end else begin
                r_tick_cnt <= r_tick_cnt + 1;
                tick_1kHz <= 1'b0;
            end
        end
    end

endmodule



module tick_gen_10Hz (
    input  clk,
    reset,
    output reg tick_10Hz
);

    reg [$clog2(10_000_000) - 1 : 0] r_tick_cnt;

    always @(posedge clk, posedge reset) begin
        if (reset) begin
            r_tick_cnt <= 0;
        end else begin
            if (r_tick_cnt == 10_000_000) begin
                r_tick_cnt <= 0;
                tick_10Hz <= 1'b1;
            end else begin
                r_tick_cnt <= r_tick_cnt + 1;
                tick_10Hz <= 1'b0;
            end
        end
    end

endmodule



module counter_4 (
    input clk,
    reset,
    output [1:0] o_sel
);

    reg [1:0] r_cnt;



    always @(posedge clk, posedge reset) begin
        if (reset) begin
            r_cnt <= 2'b00;
        end else begin
            r_cnt <= r_cnt + 1;
        end
    end


    assign o_sel = r_cnt;


endmodule
