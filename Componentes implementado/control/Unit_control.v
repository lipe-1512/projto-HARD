module Unit_control (
    //INPUT WIRE
    input wire clk, reset,
    input wire Overflow, OpCode404, div_0,
    input wire [5:0] OpCode, Funct,
    input wire zero, LT, EQ, GT, neg,

    //OUTPUT REG
    output reg [2:0] IorD,
    output reg [1:0] cause_control,
    output reg AluOutCtrl,
    output reg WritePC,
    output reg WriteEPC,
    


);
    
endmodule