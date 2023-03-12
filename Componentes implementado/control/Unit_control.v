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
    output reg WRmem,
    output reg Store_control,
    output reg WR_A,
    output reg WriteReg,
    output reg [1:0] RegDst_control,
    output reg [2:0] MemDataReg,
    output reg MemDataRegWR,
    output reg [1:0] load_control,
    output reg IR_write,
    output reg [1:0] Control_ShiftAmt,
    output reg [2:0] DataSrc_control,
    output reg WR_B,
    output reg [2:0] Shift_Control;
    output reg [1:0] Store_control;
    output reg [1:0] AluA_control;



    


);
    
endmodule