//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2024 06:03:32 PM
// Design Name: 
// Module Name: tb_uart_tx
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


`timescale 1ns / 1ps

module UART_tx_tb();

    reg i_clk;
    reg i_reset;
    reg i_start;
    reg [7:0] i_tx_data;
    wire o_tx_data;


    top_uart DUT( 
    .clk(i_clk), .reset(i_reset), .start_button(i_start),
    .i_tx_data(i_tx_data),
    .o_tx_data(o_tx_data)
    );


    // tx_clk (9600 Hz)
    always 
        #5 i_clk = ~i_clk;

    initial begin
        i_clk = 0;
        i_reset = 1;
        i_start = 0;
        i_tx_data = 8'h00;
        #10;
        i_reset = 0;
        #10;

        // CASE 1: DATA 0x55 
        i_tx_data = 8'h11;
        i_start = 1;
        @(posedge i_clk)
        i_start = 0;
      #100000 $finish;
    end

   

endmodule