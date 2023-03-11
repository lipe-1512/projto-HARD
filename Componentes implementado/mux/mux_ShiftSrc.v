module mux_ShiftSrc (
    input wire [31:0] Data_0, Data_1,
    input wire [1:0] Control_mux_ShiftSrc,
    output wire [31:0] mux_ShiftSrc_out
);
    assign mux_ShiftSrc_out = (Control_mux_ShiftSrc == 2'b00) ? Data_0:
                              (Control_mux_ShiftSrc == 2'b01) ? Data_1:
                              Data_2;
endmodule