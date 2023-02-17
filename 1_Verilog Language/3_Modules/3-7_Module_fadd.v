/*
    https://hdlbits.01xz.net/wiki/Module_fadd
*/

module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire [15:0] sum1, sum2;
    wire cout1, cout2;

    add16 inst1 (.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(sum1), .cout(cout1));
    add16 inst2 (.a(a[31:16]), .b(b[31:16]), .cin(cout1), .sum(sum2), .cout(cout2));

    assign sum = {sum2, sum1};

endmodule

// 全加器(Full adder)：
//     a-加数
//     b-被加数
//     cin-进位输入
//     cout-进位输出
//     sum-结果输出
module add1 ( input a, input b, input cin, output sum, output cout );

// Full adder module here
    assign {cout, sum} = a + b + cin; // 扩展为2bit

    /* solution */
    // Full adder equations:
    // assign sum = a ^ b ^ cin;
    // assign cout = a&b | a&cin | b&cin;
    // assign cout = (a&b)|((a^b)&cin);
endmodule

module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
endmodule
