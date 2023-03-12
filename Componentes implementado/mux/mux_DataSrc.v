module DataSrc (
    input wire [31:0] Data_0, Data_1, Data_2, Data_3, Data_4, Data_5, Data_7, Data_8, Data_9
    input wire [2:0] DataSrc_control,
    output wire [31:0] DataSrc_out
);
    assign Data_out = (DataSrc_control == 3'b000) ? Data_0:
                      (DataSrc_control == 3'b001) ? Data_1:
                      (DataSrc_control == 3'b010) ? Data_2:
                      (DataSrc_control == 3'b011) ? Data_3:
                      (DataSrc_control == 3'b100) ? Data_4:
                      (DataSrc_control == 3'b101) ? Data_5:
                      (DataSrc_control == 3'b110) ? Data_6:
                      (DataSrc_control == 3'b111) ? Data_7;
endmodule