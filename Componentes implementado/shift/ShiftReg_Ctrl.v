module ShiftReg_Ctrl (
    input wire [31:0] Data_0, Data_1, Data_2,
    input wire [1:0] ShiftReg_Control,
    output wire [31:0] ShiftReg_Control_out
);
    assign ShiftReg_Control_out = (ShiftReg_Control == 2'b00) ? Data_0:
                                  (ShiftReg_Control == 2'b01) ? Data_1:
                                  Data_2;
    
endmodule