module mux_AluSrcA (
    input wire [31:0] Data_0, Data_1, Data_2,
    input wire [1:0] Seletor,
    output wire [31:0] Data_out 
);
    assign Data_out = (Seletor == 2'b00) ? Data_0:
                      (Seletor == 2'b01) ? Data_1:
                      (Seletor == 2'b10) ? Data_0;
endmodule