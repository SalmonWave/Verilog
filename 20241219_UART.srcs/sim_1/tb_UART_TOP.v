`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2024 03:47:49 PM
// Design Name: 
// Module Name: tb_UART_TOP
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

`define TX_DEBUG
`ifdef TX_DEBUG

module tb_UART_TOP(

    );

reg i_clk, i_reset, i_start_button;
wire o_tx_data;
wire o_tx_busy;




top_uart DUT(
    .clk(i_clk), .reset(i_reset), .start_button(i_start_button),
    .TX(o_tx_data), .tx_busy(o_tx_busy)
    );



    always 
        #5 i_clk = ~i_clk;

    initial begin
        i_clk = 0;
        i_reset = 1;
        i_start_button = 0;

        #10 i_reset = 0;
        #10 i_start_button = 1;
        #10 i_start_button = 0;

        #1000000000 $finish;

    end
endmodule
`else
`endif