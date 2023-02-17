/*
    https://hdlbits.01xz.net/wiki/Always_if
*/

/* 
    An if statement usually creates a 2-to-1 multiplexer, selecting one input if the condition is true, and the other input if the condition is false.

    always @(*) begin
        if (condition) begin
            out = x;
        end
        else begin
            out = y;
        end
    end

    This is equivalent to using a continuous assignment with a conditional operator:
    assign out = (condition) ? x : y;

    However, the procedural if statement provides a new way to make mistakes. The circuit is combinational only if out is always assigned a value.
*/

// synthesis verilog_input_version verilog_2001
module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 

    assign out_assign = (sel_b1 == 1) && (sel_b2 == 1) ? b : a;

    always @(*) begin
        if ((sel_b1 == 1) && (sel_b2 == 1)) begin
            out_always = b;
        end else begin
            out_always = a;
        end
    end
endmodule
