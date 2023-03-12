module mux_Store(
    input wire [31:0] Data_0, Data_1, Data_2,
    input wire [1:0] Control,
    output wire [31:0] mux_Store_out
);
    assign mux_Store_out = (Control == 2'b00) ? Data_0:
                           (Control == 2'b01) ? Data_1:
                           Data_2; 
endmodule