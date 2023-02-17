/*
    https://hdlbits.01xz.net/wiki/Always_if2
*/

/* 
    A common source of errors: How to avoid making latches
    When designing circuits, you must think first in terms of circuits:
    - I want this logic gate
    - I want a combinational blob of logic that has these inputs and produces these outputs
    - I want a combinational blob of logic followed by a set of flip-flops
*/

// synthesis verilog_input_version verilog_2001
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //

    always @(*) begin
        if (cpu_overheated)
            shut_off_computer = 1;
        else
            shut_off_computer = 0;
    end

    always @(*) begin
        if (~arrived)
            keep_driving = ~gas_tank_empty;
        else
            keep_driving = 0;
    end

endmodule
