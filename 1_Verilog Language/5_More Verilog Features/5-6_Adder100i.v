/* 
    https://hdlbits.01xz.net/wiki/Adder100i
*/

/* 
    Create a 100-bit binary ripple-carry adder by instantiating 100 full adders. The adder adds two 100-bit numbers and a carry-in to produce a 100-bit sum and carry out. To encourage you to actually instantiate full adders, also output the carry-out from each full adder in the ripple-carry adder. cout[99] is the final carry-out from the last full adder, and is the carry-out you usually see.

    Hint:
    There are many full adders to instantiate. An instance array or generate statement would help here.
*/

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    full_adder1 inst1 (
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .cout(cout[0]),
        .sum(sum[0])
    );

    genvar i;

    generate
        for (i=1; i<100; i++)
        begin : Full_adder_block
            full_adder1 inst2 (
                .a(a[i]),
                .b(b[i]),
                .cin(cout[i - 1]),
                .cout(cout[i]),
                .sum(sum[i])
            );
        end
    endgenerate

    /* solution2 */
    // assign sum[0] = a[0] ^ b[0] ^ cin;
    // assign cout[0] = (a[0] & b[0]) | (a[0] & cin) | (b[0] & cin);
    // always @(*) begin
    //     for (integer i=1; i<100; i++) begin
    //         sum[i] = a[i] ^ b[i] ^ cout[i-1];
    //         cout[i] = (a[i] & b[i]) | (a[i] & cout[i-1]) | (b[i] & cout[i-1]);
    //     end
    // end

endmodule

module full_adder1( 
    input a, b, cin,
    output cout, sum );

    // assign {cout, sum} = a + b + cin;
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);

endmodule