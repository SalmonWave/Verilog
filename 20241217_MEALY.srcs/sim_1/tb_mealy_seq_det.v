`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2024 01:21:25 PM
// Design Name: 
// Module Name: tb_mealy_seq_det
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


module tb_mealy_seq_det();

reg i_clk, i_reset, i_din;
wire o_is_seq;


always
    #5 i_clk = ~i_clk;


mealy_seq_det DUT(
    .clk(i_clk), .reset(i_reset), .din(i_din),
    .is_seq(o_is_seq)
    );


initial begin

i_clk = 1;
i_reset = 0;

    #10 i_reset = 1;
    #10 i_reset = 0;    
    #10 i_din = 1;
    #10 i_din = 1;
    #10 i_din = 1;
    #10 i_din = 0;
    #10 i_din = 1;
    #10 i_din = 1;
    #10 i_din = 0;
    #10 i_din = 0;
    #10 i_din = 0;
    #10 i_din = 0;
    #10 i_din = 1;
    #100 $finish;

end




endmodule
