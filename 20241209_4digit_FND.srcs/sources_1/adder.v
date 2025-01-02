`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/05 15:13:04
// Design Name: 
// Module Name: adder
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

/*
module full_adder(
    input a,b,cin,
    output sum, carry
    );

    assign sum = a ^ b ^ cin;
    assign carry = (a & b) | ((a ^ b) & cin);

endmodule
*/




module full_adder_8bit (
    input [7:0] a,
    b,
    input cin,
    output [7:0] sum,
    output carry
);

    wire carry_8bit;

    full_adder_4bit U_FA4_01 (
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .sum(sum[3:0]),
        .carry(carry_8bit)
    );


    full_adder_4bit U_FA4_02 (
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(carry_8bit),
        .sum(sum[7:4]),
        .carry(carry)
    );

endmodule



/*
module fa_adder_4digit_fnd (
    input [1:0] btn,
    input [3:0] a,
    b,
    input cin,
    output [7:0] fnd_font,
    output [3:0] fnd_com
);


    wire [3:0] w_bcd;
    wire w_carry;


    decoder_2x4 U_DECODER_2X4 (
        .i_btn  (btn),
        .fnd_com(fnd_com)
    );



    full_adder_5bit U_FA_4 (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(w_bcd),
        .carry(w_carry)
    );


    fnd_controller U_FND_CONT (
        .bcd_data(w_bcd),
        .carry(w_carry),
        .fnd_font(fnd_font)
    );






endmodule
*/

module full_adder_4bit (
    input [3:0] a,
    b,
    input cin,
    output [3:0] sum,
    output carry
);

    wire carry_w_01, carry_w_02, carry_w_03;

    full_adder fa_0 (
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .sum(sum[0]),
        .carry(carry_w_01)  //  1bit 1st FA's cin is defined 0

    );

    full_adder fa_1 (
        .a(a[1]),
        .b(b[1]),
        .cin(carry_w_01),
        .sum(sum[1]),
        .carry(carry_w_02)
    );

    full_adder fa_2 (
        .a(a[2]),
        .b(b[2]),
        .cin(carry_w_02),
        .sum(sum[2]),
        .carry(carry_w_03)

    );

    full_adder fa_3 (
        .a(a[3]),
        .b(b[3]),
        .cin(carry_w_03),
        .sum(sum[3]),
        .carry(carry)
    );


endmodule




module full_adder (
    input  a,
    b,
    cin,
    output sum,
    carry
);

    wire w_sum, w_carry_01, w_carry_02;
    assign carry = w_carry_01 | w_carry_02;

    half_adder U_HALF_ADDER_01 (
        .a(a),
        .b(b),
        .sum(w_sum),
        .carry(w_carry_01)
    );

    half_adder U_HALF_ADDER_02 (
        .a(w_sum),
        .b(cin),
        .sum(sum),
        .carry(w_carry_02)
    );


endmodule


module half_adder (
    input  a,
    b,
    output sum,
    carry

);

    assign sum   = a ^ b;
    assign carry = a & b;

endmodule
