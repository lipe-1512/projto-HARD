module Shift_26_28 (
    input wire [25:0] Data_in,
    output wire [27:0] Data_out
);

    assign Data_out = {2'b00,Data_in} << 2;
endmodule