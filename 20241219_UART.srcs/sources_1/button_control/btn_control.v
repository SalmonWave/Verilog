/*
`timescale 1ns / 1ps

module button_control (
    input clk,
    reset,
    tx_btn,
    tx_busy,
    tx_done,
    output reg tx_start
);

    localparam TX_IDLE = 2'b00;
    localparam TX_SEND = 2'b01;

    reg [1:0] state, next_state;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= TX_IDLE;
            tx_start <= 0;
        end else begin
            state <= next_state;

            // tx_start 펄스 관리
            if (state == TX_IDLE && next_state == TX_SEND) begin
                tx_start <= 1; // TX_SEND로 전환 시 펄스 출력
            end else begin
                tx_start <= 0; // 기본값 유지
            end
        end
    end

    always @(*) begin
        next_state = state;
        case (state)
            TX_IDLE:
                if (tx_btn) begin
                    next_state = TX_SEND;
                end
            TX_SEND:
                if (tx_done) begin
                    next_state = TX_IDLE;
                end
        endcase
    end
endmodule
*/



`timescale 1ns / 1ps


module button_control (
    input clk,
    reset,
    tx_btn,
    tx_busy,
    tx_done,
    output reg tx_start
);

    localparam TX_IDLE = 2'b00;
    localparam TX_SEND = 2'b01;


    reg [1:0] state, next_state;

    always @(posedge clk, posedge reset) begin
        if (reset) begin
            state <= TX_IDLE;
        end else begin
            state <= next_state;
        end

    end


    always @(*) begin
        next_state = state;

        case (state)

            TX_IDLE:
            if (tx_btn) begin
                next_state = TX_SEND;
                tx_start   = 1;
            end else begin
                next_state = TX_IDLE;
                tx_start   = 0;
            end

            TX_SEND: begin
                if (tx_done) begin
                    next_state = TX_IDLE;
                    tx_start = 0;
                end else begin      
                    next_state = TX_SEND;
                    tx_start = 0;
                end
            end

            default: begin
                next_state = state;
            end
        endcase
    end



endmodule
