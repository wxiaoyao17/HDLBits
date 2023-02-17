/*
    https://hdlbits.01xz.net/wiki/Alwaysblock2
*/

/* 
    For hardware synthesis, there are two types of always blocks that are relevant:
    - Combinational: always @(*)
    - Clocked: always @(posedge clk)

    There are three types of assignments in Verilog:
    - Continuous assignments (assign x = y;). Can only be used when not inside a procedure ("always block").
    - Procedural blocking assignment: (x = y;). Can only be used inside a procedure.
    - Procedural non-blocking assignment: (x <= y;). Can only be used inside a procedure.

    In a combinational always block, use blocking assignments.
    In a clocked always block, use non-blocking assignments.
*/

// synthesis verilog_input_version verilog_2001
module top_module(
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff   );

    assign out_assign = a ^ b;

    always @(*) begin
        out_always_comb = a ^ b;
    end

    always @(posedge clk) begin
        out_always_ff = a ^ b;
    end
endmodule
