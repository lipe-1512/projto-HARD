module mux_AluSrcB (
    input wire [31:0] Data_0, Data_1, Data_2,
    input wire [1:0] AluSrcB_control,
    output wire [31:0] Data_out
);

    assign Data_out = (AluSrcB_control == 2'b00) ? Data_0:
                      (AluSrcB_control == 2'b01) ? {29{1'b0},3'b100}:
                      (AluSrcB_control == 2'b10) ? Data_1:
                      (AluSrcB_control == 2'b11) ? Data_2;

endmodule