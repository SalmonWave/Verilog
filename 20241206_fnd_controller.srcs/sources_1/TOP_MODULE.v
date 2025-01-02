`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/27/2024 02:19:40 PM
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



module fa_adder_8bit_fnd(
    input [7:0] a, b,
    input cin,
    output [7:0]fnd_font,
    output [3:0]fnd_com
);


wire [7:0]w_bcd;
wire w_carry;


decoder_2x4 U_DECODER_2X4(
    .i_btn(btn), .fnd_com(fnd_com)
);



full_adder_8bit U_FA_8(
    .a(a), .b(b), .cin(cin),
    .sum(w_bcd), .carry(w_carry) 
);


fnd_controller U_FND_CONT(
    .bcd_data(w_bcd), .carry(w_carry), .fnd_font(fnd_font)
);






endmodule

