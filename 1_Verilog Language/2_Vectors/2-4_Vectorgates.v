/* 
    https://hdlbits.01xz.net/wiki/Vectorgates
*/

// 按位操作和逻辑运算符的区别
module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
    assign out_or_bitwise = a | b;
    assign out_or_logical = a || b;
    assign out_not[5:3] = ~b;   // Assigning to [5:3] does not conflict with [2:0]
    assign out_not[2:0] = ~a;   // Part-select on left side is o.
endmodule