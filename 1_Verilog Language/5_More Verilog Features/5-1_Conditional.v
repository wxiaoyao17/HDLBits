/* 
    https://hdlbits.01xz.net/wiki/Conditional
*/

/* 
    Verilog has a ternary conditional operator ( ? : ) much like C:
    (condition ? if_true : if_false)
    This can be used to choose one of two values based on condition (a mux!) on one line, without using an if-then inside a combinational always block.
    Examples:

    (0 ? 3 : 5)     // This is 5 because the condition is false.
    (sel ? b : a)   // A 2-to-1 multiplexer between a and b selected by sel.

    always @(posedge clk)         // A T-flip-flop.
    q <= toggle ? ~q : q;

    always @(*)                   // State transition logic for a one-input FSM
    case (state)
        A: next = w ? B : A;
        B: next = w ? A : B;
    endcase

    assign out = ena ? q : 1'bz;  // A tri-state buffer

    ((sel[1:0] == 2'h0) ? a :     // A 3-to-1 mux
    (sel[1:0] == 2'h1) ? b :
                        c )
*/

module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    // assign intermediate_result1 = compare? true: false;
    wire [7:0] result_1, result_2;

    assign result_1 = a < b ? a : b;
    assign result_2 = c < d ? c : d;
    assign min = result_1 < result_2 ? result_1 : result_2;

    /* solution2 */
    // wire [7:0] min_mid, min_mid1, min_mid2;
    // assign min_mid = (a < b) ? a : b;
    // assign min_mid1 = (c < min_mid) ? c : min_mid;
    // assign min_mid2 = (d < min_mid1) ? d : min_mid1;
    // assign min = min_mid2;

endmodule
