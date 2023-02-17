/* 
    https://hdlbits.01xz.net/wiki/Wire_decl
*/

`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   );
    wire e;
    wire f;
    assign e = a & b;
    assign f = c & d;
    assign out = e | f;
    assign out_n = ~out;
endmodule
