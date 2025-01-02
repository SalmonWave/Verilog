`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2024 09:47:34 AM
// Design Name: 
// Module Name: MUX
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

module MUX (
    input  [3:0] a,
    b,
    c,
    d,
    input  [1:0] sel,
    output reg [3:0] mux_out
);

always @(sel,a,b,c,d) begin
    if          (sel == 2'b00) mux_out = a;
    else if     (sel == 2'b01) mux_out = b;
    else if     (sel == 2'b10) mux_out = c;
    else if     (sel == 2'b11) mux_out = d;
    else                       mux_out = 4'bx;
    
end

endmodule
