`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2024 02:37:53 PM
// Design Name: 
// Module Name: TOP_10000_counter
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


module watch_dot(
    input clk,
    reset,
    output [3:0] fnd_com,
    output [7:0] fnd_font
);


    wire [3:0] w_digit_sec0, w_digit_sec1, w_digit_sec10, w_digit_min;
    wire [3:0] w_bcd;
    wire [1:0] w_sel;
    wire [$clog2(10_000) - 1 : 0] w_cnt;
    wire w_tick_1kHz;
    wire w_tick_10Hz;
    wire w_carry;

    CNT_10000 U_CNT_10000 (
        .clk  (w_tick_10Hz),
        .reset(reset),
        .o_cnt(w_cnt)
    );

    mux_4x1 U_MUX_4X1 (
        .digit_sel(w_sel),
        .digit_1(w_digit_sec0),
        .digit_10(w_digit_sec1),
        .digit_100(w_digit_sec10),
        .digit_1000(w_digit_min),
        .bcd_data(w_bcd)
    );

    watch_splitter U_DIGITAL_SPLIT (
        .seg_data(w_cnt),
        .digit_sec0(w_digit_sec0),
        .digit_sec1(w_digit_sec1),
        .digit_sec10(w_digit_sec10),
        .digit_min(w_digit_min)
    );

    decoder_2x4 U_DECODER_2X4 (
        .i_btn  (w_sel),
        .fnd_com(fnd_com)
    );


    counter_4 U_COUNTER_4 (
        .clk  (w_tick_1kHz),
        .reset(reset),
        .o_sel(w_sel)
    );

    fnd_controller U_FND_CONT (
        .bcd_data(w_bcd),
        .sel(w_sel),
        .fnd_font(fnd_font)
    );


    tick_gen_1kHz U_TICK_GEN_1KHZ (
        .clk(clk),
        .reset(reset),
        .tick_1kHz(w_tick_1kHz)
    );  


    tick_gen_10Hz U_TICK_GEN_10Hz(
        .clk(clk),
        .reset(reset),
        .tick_10Hz(w_tick_10Hz)
    );

endmodule 



module CNT_10000 (
    input clk,
    reset,
    output reg [$clog2(10_000) - 1 : 0] o_cnt

);


    always @(posedge clk, posedge reset) begin
        if (reset) begin
            o_cnt <= 0;

        end else begin
            if (o_cnt == 10_000) begin
                o_cnt <= 0;
            end else begin
                o_cnt <= o_cnt + 1;
            end
        end
    end

endmodule
