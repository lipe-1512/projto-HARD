module mux_RegDst (
    input wire [4:0] Data_0, Data_1, Data_2, Data_3, Data_4,
    input wire [2:0] Seletor,
    output wire [4:0] Data_out
);
    assign Data_out = (Seletor == 3'b000) ? Data_0:
                      (Seletor == 3'b001) ? Data_1:
                      (Seletor == 3'b010) ? Data_2:
                      (Seletor == 3'b011) ? Data_3:
                      (Seletor == 3'b100) ? Data_4;
endmodule