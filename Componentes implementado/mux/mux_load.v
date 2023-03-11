module load (
    input wire [31:0] input_0, input_1, input_2,
    input wire [1:0] load_control,
    output wire [31:0] load_out
);
    assign load_out = (load_control == 2'b00) ? input_0:
                      (load_control == 2'b01) ? input_1:
                      input_2
endmodule