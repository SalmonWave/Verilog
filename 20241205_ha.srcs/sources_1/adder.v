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


module full_adder_4bit(
    input [3:0]a, b,
    input cin,
    output [3:0]sum,
    output carry
);

wire carry_w_01, carry_w_02, carry_w_03;

full_adder fa_0(
    .a(a[0]), .b(b[0]), .cin(1'b0), .sum(sum[0]), .carry(carry_w_01)    //  1bit 1st FA's cin is defined 0

);

full_adder fa_1(
    .a(a[1]), .b(b[1]), .cin(carry_w_01), .sum(sum[1]), .carry(carry_w_02)
);

full_adder fa_2(
    .a(a[2]), .b(b[2]), .cin(carry_w_02), .sum(sum[2]), .carry(carry_w_03)

);

full_adder fa_3(
    .a(a[3]), .b(b[3]), .cin(carry_w_03), .sum(sum[3]), .carry(carry)
);


endmodule


module full_adder(
    input a,b,cin,
    output sum, carry
    );

    wire w_sum, w_carry_01, w_carry_02;
    assign carry = w_carry_01 | w_carry_02;

    half_adder U_HALF_ADDER_01(
    .a(a), .b(b), .sum(w_sum), .carry(w_carry_01)
    );
    
    half_adder U_HALF_ADDER_02(
    .a(w_sum), .b(cin), .sum(sum), .carry(w_carry_02)
    );


endmodule


module half_adder(
   input a,b,
   output sum, carry 

);

    assign sum = a ^ b;
    assign carry = a & b;

endmodule