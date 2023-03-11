module ShiftAmt (
    input wire [4:0] Data_0, Data_1, Data_2,
    input wire [1:0] Control_ShiftAmt,
    output wire [4:0] ShiftAmt_out
);
    assign ShiftAmt_out = (Control_ShiftAmt == 2'b00) ? Data_0:
                          (Control_ShiftAmt == 2'b01) ? Data_1:
                          Data_2;    
endmodule