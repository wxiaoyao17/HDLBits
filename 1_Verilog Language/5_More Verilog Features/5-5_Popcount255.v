/* 
    https://hdlbits.01xz.net/wiki/Popcount255
*/

/* 
    A "population count" circuit counts the number of '1's in an input vector. Build a population count circuit for a 255-bit input vector.
*/

module top_module( 
    input [254:0] in,
    output [7:0] out );

    always @(*) begin
        out = 0;
        for (integer i=0; i<255; i++) begin
            // out = out + in[i];
            out += in[i];
            // if (in[i])
            //     out = out + 1;
            // else
            //     out = out;
        end
    end

endmodule
