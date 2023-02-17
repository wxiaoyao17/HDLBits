/*
    https://hdlbits.01xz.net/wiki/Module_addsub
*/

module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] b_sub;
    wire [15:0] sum1, sum2;
    wire cout1, cout2;

    add16 inst1 (.a(a[15:0]), .b(b_sub[15:0]), .cin(sub), .sum(sum1), .cout(cout1));
    add16 inst2 (.a(a[31:16]), .b(b_sub[31:16]), .cin(cout1), .sum(sum2), .cout(cout2));

    // assign b_sub = !sub ? b : b ^ {32{sub}};
    assign b_sub = !sub ? b : ~b;
    assign sum = {sum2, sum1};

endmodule

module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
endmodule
