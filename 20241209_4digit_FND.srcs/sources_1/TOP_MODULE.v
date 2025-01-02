`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/27/2024 02:30:05 PM
// Design Name: 
// Module Name: TOP_MODULE
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



module fa_adder_8bit_fnd (
    // input  [1:0] btn,
    input clk, reset,
    input  [7:0] a,
    b,
    // input cin,
    output [7:0] fnd_font,
    output [3:0] fnd_com
);


    wire [7:0] w_sum;
    wire [3:0] w_digit_1, w_digit_10, w_digit_100, w_digit_1000;
    wire [3:0] w_bcd;
    wire [1:0] w_sel;
    wire w_tick_1kHz;
    wire w_carry;

    digit_splitter U_DIGITAL_SPLIT (
        .seg_data({w_carry, w_sum}),
        .digit_1(w_digit_1),
        .digit_10(w_digit_10),
        .digit_100(w_digit_100),
        .digit_1000(w_digit_1000)
    );


    mux_4x1 U_MUX_4X1 (
        .digit_sel(w_sel),
        .digit_1(w_digit_1),
        .digit_10(w_digit_10),
        .digit_100(w_digit_100),
        .digit_1000(w_digit_1000),
        .bcd_data(w_bcd)
    );


    decoder_2x4 U_DECODER_2X4 (
        .i_btn  (w_sel),
        .fnd_com(fnd_com)
    );


    counter_4 U_COUNTER_4(
        .clk(w_tick_1kHz), .reset(reset),
        .o_sel(w_sel)
    );


    tick_gen U_TICK_GEN(
        .clk(clk),
        .reset(reset),
        .tick_1kHz(w_tick_1kHz)
    );


    full_adder_8bit U_FA_8 (
        .a(a),
        .b(b),
        .cin(1'b0),
        .sum(w_sum),
        .carry(w_carry)
    );


    fnd_controller U_FND_CONT (
        .bcd_data(w_bcd),
        .fnd_font(fnd_font)
    );






endmodule
