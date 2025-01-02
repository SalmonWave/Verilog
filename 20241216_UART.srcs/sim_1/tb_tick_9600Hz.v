`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2024 01:45:54 PM
// Design Name: 
// Module Name: tb_tick_9600Hz
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


module tb_tick_9600Hz(

    );

reg i_clk, i_reset;
wire o_tick, o_divided_clock;

always
    #5 i_clk = ~i_clk;

tick_clock #(
    .CLOCK_FREQ(100_000_000),  
    .TARGET_FREQ(9600)         
) DUT_TICK
(
    .clk(i_clk), .reset(i_reset),
    .tick(o_tick)
);



clcok_divide#(
    .CLOCK_FREQ(100_000_000),  
    .TARGET_FREQ(9600)         
) DUT_CLOCK_DIVIDE
(
    .clk(i_clk), .reset(i_reset),
    .divided_clock(o_divided_clock)
);


initial begin
    $display("TEST BENCH BEGIN : %d", $time);
    i_clk = 0;
    i_reset = 0;
    

    #10 i_reset = 1;
    #10 i_reset = 0;
    #200000 $display("TEST BENCH END : %d", $time);
    $finish;



end





endmodule
