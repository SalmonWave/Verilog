`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/05 15:27:12
// Design Name: 
// Module Name: tb_adder
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


module tb_adder(

    );

reg [3:0]a, b;
reg cin;
wire [3:0]sum;
wire carry;


full_adder_4bit DUT(
   .a(a), .b(b), .cin(cin),
   .sum(sum), .carry(carry) 
);


 integer i, j, k; // Loop variables

    initial begin
        // Iterate through all combinations of a, b, and cin
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                for (k = 0; k < 2; k = k + 1) begin
                    #10 a = i; b = j; cin = k; // Assign test values
                end
            end
        end
        #10 $finish; // End simulation
    end

endmodule

