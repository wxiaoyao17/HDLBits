/* 
    https://hdlbits.01xz.net/wiki/Always_nolatches
*/

/* 
    Assign a "default value" to the outputs before the case statement, if there are too many cases in default.

    always @(*) begin
        up = 1'b0; down = 1'b0; left = 1'b0; right = 1'b0;
        case (scancode)
            ... // Set to 1 as necessary.
        endcase
    end
*/

// synthesis verilog_input_version verilog_2001
module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  );

    always @(*) begin
        up = 1'b0; down = 1'b0; left = 1'b0; right = 1'b0;
        case (scancode)
            16'he06b: left = 1;
            16'he072: down = 1;
            16'he074: right = 1;
            16'he075: up = 1;
            default: ;
        endcase
    end

endmodule
