module mux_PCSource (
    input wire [31:0] Data_0, Data_1, Data_2, Data_3, Data_4,
    input wire [2:0] PCSource_control,
    output wire [31:0] m_PCS_out
);
    assign m_PCS_out = (PCSource_control == 3'b000) ? Data_0:
                      (PCSource_control == 3'b001) ? Data_1:
                      (PCSource_control == 3'b010) ? Data_2:
                      (PCSource_control == 3'b011) ? Data_3:
                      (PCSource_control == 3'b100) ? Data_4;    
endmodule