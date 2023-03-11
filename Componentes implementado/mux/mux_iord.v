module mux_iord (
    input wire [31:0] input_0, input__1, input__2, input__3,
    input wire [1:0] iord_control,
    output wire [31:0] mux_iord_out
);
    assign mux_iord_out = (iord_control == 2'b00) ? input_0:
                          (iord_control == 2'b01) ? input_1:
                          (iord_control == 2'b10) ? input_2:
                          (iord_control == 2'b11) ? input_3;
endmodule