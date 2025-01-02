`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2024 11:17:37 AM
// Design Name: 
// Module Name: tb_4digit_FND
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


module tb_4digit_FND ();

    reg [1:0] tb_btn; 
    reg [7:0] tb_a, tb_b;
    wire [7:0] tb_fnd_font;
    wire [3:0] tb_fnd_com;


    fa_adder_8bit_fnd DUT_ADDER_FND_DIGIT (
        .btn(tb_btn),
        .a(tb_a),
        .b(tb_b),
        //  input cin,
        .fnd_font(tb_fnd_font),
        .fnd_com(tb_fnd_com)
    );

initial begin
    #00 tb_a = 8'hff; tb_b = 8'hff; tb_btn = 00; 
    #10 tb_a = 8'h00; tb_b = 8'h00; tb_btn = 00;
    #10 $finish;
end


endmodule
