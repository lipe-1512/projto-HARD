module signal_1_to_32 (
    input wire Data_in,
    output wire [31:0] Data_out
);
    assign Data_out = 32{Data_in};    
endmodule