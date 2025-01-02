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

module TOP_10000_counter_1kHz (
    input clk,
    reset,
    output [3:0] fnd_com,
    output [7:0] fnd_font
);


    wire [3:0] w_digit_1, w_digit_10, w_digit_100, w_digit_1000;
    wire [3:0] w_bcd;
    wire [1:0] w_sel;
    wire [$clog2(10_000) - 1 : 0] w_cnt;
    wire w_tick_1kHz;
    wire w_carry;

    //  COUNT GENERATE
    CNT_10000 U_CNT_10000 (
        .clk  (w_tick_1kHz),
        .reset(reset),
        .o_cnt(w_cnt)
    );

    //  COUNT DIVIDE BY DECIMAL
    mux_4x1 U_MUX_4X1 (
        .digit_sel(w_sel),
        .digit_1(w_digit_1),
        .digit_10(w_digit_10),
        .digit_100(w_digit_100),
        .digit_1000(w_digit_1000),
        .bcd_data(w_bcd)
    );

    // DECIMAL COUNT DIVIDE BY DIGITS
    digit_splitter U_DIGITAL_SPLIT (
        .seg_data(w_cnt),
        .digit_1(w_digit_1),
        .digit_10(w_digit_10),
        .digit_100(w_digit_100),
        .digit_1000(w_digit_1000)
    );

    //  FND DISPLAY
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
        .fnd_font(fnd_font)
    );


    // CLK GENERATE (DISPLAY, COUNT)
    tick_gen_1kHz U_TICK_GEN_1KHZ (
        .clk(clk),
        .reset(reset),
        .tick_1kHz(w_tick_1kHz)
    );  


    /*
    1. clk 신호는 1ns, 주기가 10이므로 10ns (1MHz)
    2. tick_gen_1kHz 로 clk 신호를 받아와서 1kHz tick 신호 생성
    3. counter_4로 1kHz 신호를 250Hz로 분주해서 0.004초 간격으로 각 자릿수를 display 해줌.
    4. COUNT_10000은 1kHz 신호를 받아 10000번 센 후 값(seg_data)를 출력.
    5. digit_splitter로 값(seg_data)를 받아 10진수로 변경 후 mux_4x1로 각 자릿수로 나눠줌.
    */


endmodule



/*
module TOP_10000_counter_100kHz (
    input clk,
    reset,
    output [3:0] fnd_com,
    output [7:0] fnd_font
);


    wire [3:0] w_digit_1, w_digit_10, w_digit_100, w_digit_1000;
    wire [3:0] w_bcd;
    wire [1:0] w_sel;
    wire [$clog2(10_000) - 1 : 0] w_cnt;
    wire w_tick_1kHz;
    wire w_tick_100kHz;
    wire w_carry;


    CNT_10000 U_CNT_10000 (
        .clk  (w_tick_100kHz),
        .reset(reset),
        .o_cnt(w_cnt)
    );

    digit_splitter U_DIGITAL_SPLIT (
        .seg_data(w_cnt),
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


    counter_4 U_COUNTER_4 (
        .clk  (w_tick_1kHz),
        .reset(reset),
        .o_sel(w_sel)
    );


    tick_gen_1kHz U_TICK_GEN_1KHZ (
        .clk(clk),
        .reset(reset),
        .tick_1kHz(w_tick_1kHz)
    );

    tick_gen_100kHz U_TICK_GEN_100KHZ (
        .clk(clk),
        .reset(reset),
        .tick_100kHz(w_tick_100kHz)
    );

    fnd_controller U_FND_CONT (
        .bcd_data(w_bcd),
        .fnd_font(fnd_font)
    );

endmodule

*/



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
