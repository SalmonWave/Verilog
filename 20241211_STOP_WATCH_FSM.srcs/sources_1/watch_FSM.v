`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2024 02:37:53 PM
// Design Name: 
// Module Name: TOP_10000_counter
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

/*
module watch_fsm (
    input clk,
    reset,
    output [3:0] fnd_com,
    output [7:0] fnd_font
);


    wire [3:0] w_digit_sec0, w_digit_sec1, w_digit_sec10, w_digit_min;
    wire [3:0] w_bcd;
    wire [1:0] w_sel;
    wire [$clog2(10_000) - 1 : 0] w_cnt;
    wire w_tick_1kHz;
    wire w_tick_10Hz;
    wire w_carry;

    CNT_10000 U_CNT_10000 (
        .clk  (w_tick_10Hz),
        .reset(reset),
        .o_cnt(w_cnt)
    );

    mux_4x1 U_MUX_4X1 (
        .digit_sel(w_sel),
        .digit_1(w_digit_sec0),
        .digit_10(w_digit_sec1),
        .digit_100(w_digit_sec10),
        .digit_1000(w_digit_min),
        .bcd_data(w_bcd)
    );

    watch_splitter U_DIGITAL_SPLIT (
        .seg_data(w_cnt),
        .digit_sec0(w_digit_sec0),
        .digit_sec1(w_digit_sec1),
        .digit_sec10(w_digit_sec10),
        .digit_min(w_digit_min)
    );

    decoder_2x4 U_DECODER_2X4 (
        .i_btn  (w_sel),
        .fnd_com(fnd_com)
    );


    counter_4 U_COUNTER_4 (
        .clk  (w_tick_1kHz),
        .reset(reset),
        .o_sel(w_sel)
    );

    fnd_controller U_FND_CONT (
        .bcd_data(w_bcd),
        .sel(w_sel),
        .fnd_font(fnd_font)
    );


    tick_gen_1kHz U_TICK_GEN_1KHZ (
        .clk(clk),
        .reset(reset),
        .tick_1kHz(w_tick_1kHz)
    );


    tick_gen_10Hz U_TICK_GEN_10Hz (
        .clk(clk),
        .reset(reset),
        .tick_10Hz(w_tick_10Hz)
    );

endmodule


module CNT_10000 (
    input clk,
    reset,
    output reg [$clog2(10_000) - 1 : 0] o_cnt

);

    localparam IDLE = 1'b0;
    localparam RUN_CNT = 1'b1;

    reg state, state_next;

    always @(posedge clk, posedge reset) begin
        if (reset) begin
            state <= IDLE;
        end else begin
            state <= state_next;
        end
    end


    always @(*) begin
        state_next = state;
        case (state)

            IDLE: state_next = RUN_CNT;

            RUN_CNT:
            if (o_cnt >= 10000) begin
                state_next = IDLE;
            end

            default: state_next = state;
        endcase
    end

   
    always @(posedge clk, posedge reset) begin
        if (reset) begin
            o_cnt = 0;
        end else begin

            case (state)
                IDLE: o_cnt <= 0;
                RUN_CNT: o_cnt <= o_cnt + 1;
            endcase
        end
    end

endmodule
*/



/*
module watch_fsm (
    input clk,
    reset,
    output [3:0] fnd_com,
    output [7:0] fnd_font
);


    wire [3:0] w_digit_sec0, w_digit_sec1, w_digit_sec10, w_digit_min;
    wire [3:0] w_bcd;
    wire [1:0] w_sel;
    wire [$clog2(10_000) - 1 : 0] w_cnt;
    wire w_tick_1kHz;
    wire w_tick_10Hz;
    wire w_carry;

    CNT_10000 U_CNT_10000 (
        .clk  (w_tick_10Hz),
        .reset(reset),
        .o_cnt(w_cnt)
    );

    mux_4x1 U_MUX_4X1 (
        .digit_sel(w_sel),
        .digit_1(w_digit_sec0),
        .digit_10(w_digit_sec1),
        .digit_100(w_digit_sec10),
        .digit_1000(w_digit_min),
        .bcd_data(w_bcd)
    );

    watch_splitter U_DIGITAL_SPLIT (
        .seg_data(w_cnt),
        .digit_sec0(w_digit_sec0),
        .digit_sec1(w_digit_sec1),
        .digit_sec10(w_digit_sec10),
        .digit_min(w_digit_min)
    );

    decoder_2x4 U_DECODER_2X4 (
        .i_btn  (w_sel),
        .fnd_com(fnd_com)
    );


    counter_4 U_COUNTER_4 (
        .clk  (w_tick_1kHz),
        .reset(reset),
        .o_sel(w_sel)
    );

    fnd_controller U_FND_CONT (
        .bcd_data(w_bcd),
        .sel(w_sel),
        .fnd_font(fnd_font)
    );


    tick_gen_1kHz U_TICK_GEN_1KHZ (
        .clk(clk),
        .reset(reset),
        .tick_1kHz(w_tick_1kHz)
    );


    tick_gen_10Hz U_TICK_GEN_10Hz (
        .clk(clk),
        .reset(reset),
        .tick_10Hz(w_tick_10Hz)
    );

endmodule



module CNT_10000 (
    input clk,
    reset,
    output reg [$clog2(10_000) - 1 : 0] o_cnt

);

    localparam IDLE = 1'b0;
    localparam RUN_CNT = 1'b1;

    reg state, state_next;

    always @(posedge clk, posedge reset) begin
        if (reset) begin
            state <= IDLE;
        end else begin
            state <= state_next;
        end
    end


    always @(*) begin
        state_next = state;
        case (state)

            IDLE: state_next = RUN_CNT;

            RUN_CNT:
            if (o_cnt >= 10000) begin
                state_next = IDLE;
            end

            default: state_next = state;
        endcase
    end


    always @(posedge clk) begin
        case (state)

            IDLE: o_cnt <= 0;

            RUN_CNT: o_cnt <= o_cnt + 1;


        endcase

    end

endmodule
*/


module watch_fsm (
    input clk,
    reset,
    output [3:0] fnd_com,
    output [7:0] fnd_font
);


    wire [3:0] w_digit_sec0, w_digit_sec1, w_digit_sec10, w_digit_min;
    wire [3:0] w_bcd;
    wire [1:0] w_sel;
    wire [$clog2(10_000) - 1 : 0] w_cnt;
    wire w_tick_1kHz;
    wire w_tick_10Hz;
    wire w_carry;

    CNT_10000 U_CNT_10000 (
        .clk  (w_tick_10Hz),
        .reset(reset),
        .o_cnt(w_cnt)
    );

    mux_4x1 U_MUX_4X1 (
        .digit_sel(w_sel),
        .digit_1(w_digit_sec0),
        .digit_10(w_digit_sec1),
        .digit_100(w_digit_sec10),
        .digit_1000(w_digit_min),
        .bcd_data(w_bcd)
    );

    watch_splitter U_DIGITAL_SPLIT (
        .seg_data(w_cnt),
        .digit_sec0(w_digit_sec0),
        .digit_sec1(w_digit_sec1),
        .digit_sec10(w_digit_sec10),
        .digit_min(w_digit_min)
    );

    decoder_2x4 U_DECODER_2X4 (
        .i_btn  (w_sel),
        .fnd_com(fnd_com)
    );


    counter_4 U_COUNTER_4 (
        .clk  (w_tick_1kHz),
        .reset(reset),
        .o_sel(w_sel)
    );

    fnd_controller U_FND_CONT (
        .bcd_data(w_bcd),
        .sel(w_sel),
        .fnd_font(fnd_font)
    );


    tick_gen_1kHz U_TICK_GEN_1KHZ (
        .clk(clk),
        .reset(reset),
        .tick_1kHz(w_tick_1kHz)
    );


    tick_gen_10Hz U_TICK_GEN_10Hz (
        .clk(clk),
        .reset(reset),
        .tick_10Hz(w_tick_10Hz)
    );

endmodule



module CNT_10000 (
    input clk,
    reset,
    output reg [$clog2(10_000) - 1 : 0] o_cnt
);

    localparam IDLE = 1'b0;
    localparam RUN_CNT = 1'b1;

    reg state, state_next;
    reg [$clog2(10_000) - 1 : 0] o_cnt_next;  // 조합 논리로 다음 상태 계산


    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            o_cnt <= 0;  // 카운터 초기화
        end else begin
            state <= state_next;
            o_cnt <= o_cnt_next;  // 다음 상태 반영
        end
    end


    always @(*) begin
        // 기본값 설정
        state_next = state;

        case (state)
            IDLE: state_next = RUN_CNT;


            RUN_CNT:
            if (o_cnt >= 9999)
                state_next = IDLE; // 카운트 최대값 도달 시 상태 전환


            default: state_next = state;

        endcase
    end


    always @(*) begin
        o_cnt_next = o_cnt;

        case (state)
            IDLE: o_cnt_next = 0;  // IDLE 상태에서는 항상 0


            RUN_CNT: o_cnt_next = o_cnt + 1;  // 카운트 증가


            default: o_cnt_next = 0;

        endcase
    end

endmodule




//=================================== FALSE CASE ===================================//

/*
module watch_fsm (
    input clk,
    reset,
    output [3:0] fnd_com,
    output [7:0] fnd_font
);


    wire [3:0] w_digit_sec0, w_digit_sec1, w_digit_sec10, w_digit_min;
    wire [3:0] w_bcd;
    wire [1:0] w_sel;
    wire [$clog2(10_000) - 1 : 0] w_cnt;
    wire w_tick_1kHz;
    wire w_tick_10Hz;
    wire w_carry;

    CNT_10000 U_CNT_10000 (
        .clk  (w_tick_10Hz),
        .reset(reset),
        .o_cnt(w_cnt)
    );

    mux_4x1 U_MUX_4X1 (
        .digit_sel(w_sel),
        .digit_1(w_digit_sec0),
        .digit_10(w_digit_sec1),
        .digit_100(w_digit_sec10),
        .digit_1000(w_digit_min),
        .bcd_data(w_bcd)
    );

    watch_splitter U_DIGITAL_SPLIT (
        .seg_data(w_cnt),
        .digit_sec0(w_digit_sec0),
        .digit_sec1(w_digit_sec1),
        .digit_sec10(w_digit_sec10),
        .digit_min(w_digit_min)
    );

    decoder_2x4 U_DECODER_2X4 (
        .i_btn  (w_sel),
        .fnd_com(fnd_com)
    );


    counter_4 U_COUNTER_4 (
        .clk  (w_tick_1kHz),
        .reset(reset),
        .o_sel(w_sel)
    );

    fnd_controller U_FND_CONT (
        .bcd_data(w_bcd),
        .sel(w_sel),
        .fnd_font(fnd_font)
    );


    tick_gen_1kHz U_TICK_GEN_1KHZ (
        .clk(clk),
        .reset(reset),
        .tick_1kHz(w_tick_1kHz)
    );


    tick_gen_10Hz U_TICK_GEN_10Hz (
        .clk(clk),
        .reset(reset),
        .tick_10Hz(w_tick_10Hz)
    );

endmodule



module CNT_10000 (
    input clk,
    reset, 
    output reg [$clog2(10_000) - 1 : 0] o_cnt

);

    localparam IDLE = 1'b0;
    localparam RUN_CNT = 1'b1;

    reg state, state_next;

    always @(posedge clk, posedge reset) begin
        if (reset) begin
            state <= IDLE;
        end else begin
            state <= state_next;
        end
    end


    always @(*) begin
        state_next = state;
        case (state)

            IDLE: state_next = RUN_CNT;

            RUN_CNT:
            if (o_cnt >= 10000) begin
                state_next = IDLE;
            end

            default: state_next = state;
        endcase
    end


    always @(*) begin
        case (state)

            IDLE: o_cnt = 0;

            RUN_CNT:
            if (clk == 1'b1) begin
                o_cnt = o_cnt + 1;
            end


        endcase

    end

endmodule
*/