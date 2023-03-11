module mux_cause_control (
    input wire [31:0] Data_0, Data_1, Data_2
    input wire [1:0] cause_control,
    output wire Data_out
);
    assign cause_control_out = (cause_control == 2'b00) ? Data_0 :
                               (cause_control == 2'b01) ? Data_1 :
                                Data_2;
endmodule