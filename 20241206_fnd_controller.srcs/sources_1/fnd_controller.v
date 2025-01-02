`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2024 02:19:21 PM
// Design Name: 
// Module Name: fnd_controller
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


module fnd_controller(
    input [3:0]bcd_data,
    input carry,
    output reg [7:0]fnd_font
   
    );



    always @(bcd_data, carry) begin 
        case (bcd_data)
            4'h0: fnd_font = 8'hc0; 
            4'h1: fnd_font = 8'hf9; 
            4'h2: fnd_font = 8'ha4; 
            4'h3: fnd_font = 8'hb0; 
            4'h4: fnd_font = 8'h99; 
            4'h5: fnd_font = 8'h92; 
            4'h6: fnd_font = 8'h82; 
            4'h7: fnd_font = 8'hf8; 
            4'h8: fnd_font = 8'h80; 
            4'h9: fnd_font = 8'h90; 
            4'ha: fnd_font = 8'h88; 
            4'hb: fnd_font = 8'h83; 
            4'hc: fnd_font = 8'hc6; 
            4'hd: fnd_font = 8'ha1; 
            4'he: fnd_font = 8'h86; 
            4'hf: fnd_font = 8'h8e; 
        endcase
    end


endmodule




module decoder_2x4(
    input [1:0]i_btn,
    output reg [3:0] fnd_com
);

    always @(i_btn) begin

        case (i_btn)
            2'b00: fnd_com = 4'b1110;
            2'b01: fnd_com = 4'b1101;
            2'b10: fnd_com = 4'b1011;
            2'b11: fnd_com = 4'b0111;
            default: fnd_com = 4'b1111;
        endcase

    end

endmodule
