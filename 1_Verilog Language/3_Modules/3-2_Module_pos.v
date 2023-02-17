/* 
    https://hdlbits.01xz.net/wiki/Module_pos
*/

module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    mod_a inst1 (out1, out2, a, b, c, d);
endmodule

module mod_a ( output, output, input, input, input, input );
endmodule
