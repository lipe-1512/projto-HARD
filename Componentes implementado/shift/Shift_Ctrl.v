module Shift_Ctrl (
    input wire [31:0] Data_0, Data_1, Data_2,
    input wire [2:0] Shift_Control,
    output wire [31:0] Shift_Control_out
);
    assign Shift_Control_out = (Shift_Control == 2'b00) ? Data_0:
                                (Shift_Control == 2'b01) ? Data_1:
                                Data_2;
    
endmodule