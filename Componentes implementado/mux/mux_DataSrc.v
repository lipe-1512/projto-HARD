module DataSrc (
    input wire [31:0] Data_0, Data_1, Data_2, Data_3, Data_4, Data_5, Data_7, Data_8, Data_9
    input wire [3:0] DataSrc_control,
    output wire [31:0] Data_out
);
    assign Data_out = (DataSrc_control == 4'b0000) ? Data_0:
                      (DataSrc_control == 4'b0001) ? Data_1:
                      (DataSrc_control == 4'b0010) ? Data_2:
                      (DataSrc_control == 4'b0011) ? Data_3:
                      (DataSrc_control == 4'b0100) ? Data_4:
                      (DataSrc_control == 4'b0101) ? Data_5:
                      (DataSrc_control == 4'b0110) ? Data_6:
                      (DataSrc_control == 4'b0111) ? Data_7:
                      (DataSrc_control == 4'b0111) ? Data_8:
                      (DataSrc_control == 3'b1000) ? Data_9;
endmodule