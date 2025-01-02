`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2024 07:00:12 PM
// Design Name: 
// Module Name: top_uart
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

module top_uart(
    input clk, reset, start_button,
    input RX,
    output TX, tx_busy
    );

wire baud_rate_tick, w_tx_start;
wire w_tx_done, w_tx_busy, w_rx_busy;
wire [7:0] w_rx_data;
wire w_debounce_start;

assign tx_busy = w_tx_busy;

debounce U_DEBOUNCE(
    .clk(clk),
    .reset(reset),
    .i_btn(start_button),
    .o_btn(w_debounce_start)
);
/*
button_control U_BUTTON_CONTROL(
    .clk(clk),
    .reset(reset),
    .tx_btn(start_button),
    .tx_busy(w_tx_busy),
    .tx_done(w_tx_done),
    .tx_start(w_tx_start)
);
*/
UART_tx U_TRANSMITTER(
    .clk(clk), 
    .baud_rate_tick(baud_rate_tick), 
    .reset(reset), 
    .start(w_tx_start),
    .i_tx_data(w_rx_data),
    .o_tx_data(TX),
    .tx_done(w_tx_done),
    .tx_busy(w_tx_busy) 
    );

UART_rx U_RECEIVER(
    .clk(clk),
    .baud_rate_tick(baud_rate_tick),
    .reset(reset),
    .RX(RX),
    .o_rx_data(w_rx_data),
    .o_rx_done(w_tx_start),
    .o_rx_busy(w_rx_busy)
);


tick_clock #(
    .CLOCK_FREQ(100_000_000),  
    .TARGET_FREQ(9600 * 16)         
)   U_9600_16_BAUD_RATE_TICK
(
    .clk(clk), .reset(reset),
    .tick(baud_rate_tick)
);

endmodule
