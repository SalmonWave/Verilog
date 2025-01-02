`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/05 10:40:49
// Design Name: 
// Module Name: 20241205_GATE
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


module GATE(
    input a,b,
    output y0,y1,y2,y3,y4,y5,y6
    
    );
    
    assign y0 = a & b;
    assign y1 = ~(a & b);
    assign y2 = a | b;
    assign y3 = ~(a | b);
    assign y4 = a ^ b;
    assign y5 = ~(a ^ b);
    assign y6 = ~a;

    
    
    
endmodule
