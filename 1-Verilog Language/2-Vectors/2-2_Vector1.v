/* 
    https://hdlbits.01xz.net/wiki/Vector1
*/

/* 
    Declaring Vectors
    Vectors must be declared:
        type [upper:lower] vector_name;

    type specifies the datatype of the vector. This is usually wire or reg. If you are declaring a input or output port, the type can additionally include the port type (e.g., input or output) as well. Some examples:
        wire [7:0] w;         // 8-bit wire
        reg  [4:1] x;         // 4-bit reg
        output reg [0:0] y;   // 1-bit reg that is also an output port (this is still a vector)
        input wire [3:-2] z;  // 6-bit wire input (negative ranges are allowed)
        output [3:0] a;       // 4-bit output wire. Type is 'wire' unless specified otherwise.
        wire [0:7] b;         // 8-bit wire where b[0] is the most-significant bit.
 */

// 隐式wire类型
wire [2:0] a, c;   // Two vectors
assign a = 3'b101;  // a = 101
assign b = a;       // b =   1  implicitly-created wire
assign c = b;       // c = 001  <-- bug
my_module i1 (d,e); // d and e are implicitly one-bit wide if not declared.
                    // This could be a bug if the port was intended to be a vector.

`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );

    assign out_hi = in[15:8];
    assign out_lo = in[7:0];
    // Concatenation operator also works: assign {out_hi, out_lo} = in;
endmodule
