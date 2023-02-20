/* 
    https://hdlbits.01xz.net/wiki/Bcdadd100
*/

/* 
    You are provided with a BCD one-digit adder named bcd_fadd that adds two BCD digits and carry-in, and produces a sum and carry-out.

    module bcd_fadd (
        input [3:0] a,
        input [3:0] b,
        input     cin,
        output   cout,
        output [3:0] sum );

    Instantiate 100 copies of bcd_fadd to create a 100-digit BCD ripple-carry adder. Your adder should add two 100-digit BCD numbers (packed into 400-bit vectors) and a carry-in to produce a 100-digit sum and carry out.
*/

module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

    wire [99:0] cout_temp;

    bcd_fadd inst1 (
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .cout(cout_temp[0]),
        .sum(sum[3:0])
    );

    genvar i;

    generate
        for (i=1; i<100; i++)
        begin: Bcd_adder_block
            bcd_fadd inst2 (
                .a(a[(4*i+3):(4*i)]),
                .b(b[(4*i+3):(4*i)]),
                .cin(cout_temp[i-1]),
                .cout(cout_temp[i]),
                .sum(sum[(4*i+3):(4*i)])
            );
        end
    endgenerate

    assign cout = cout_temp[99];

endmodule

module bcd_fadd (
    input [3:0] a,
    input [3:0] b,
    input     cin,
    output   cout,
    output [3:0] sum );
endmodule
