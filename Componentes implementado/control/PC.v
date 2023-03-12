module PC (
    input clk, reset
);
// Data Wire
wire [31:0] PC_out;
wire [31:0] EPC _out;
wire [31:0] cause_control_out;
wire AluOut;
wire [31:0] Result;
wire [31:0] AluOutResult;
wire WritePC;
wire WriteEPC;
wire [31:0] EPC_out;
wire WRmem;
wire [31:0] SH_out;
wire [31:0] SB_out;
wire [31:0] S_out;
wire [31:0] Store_out;
wire [2:0] IorD;
wire [31:0] A;
wire WR_A;
wire WriteReg;
wire RS;
wire RT;
wire [4:0] RD;
wire MemDataRegWR;
wire [31:0] load_out;
wire [15:0] imediato;
wire [31:0] Mem_out;
wire [5:0] OpCode;
wire [31:0] ShiftReg_out;
wire [31:0] imediato32_32;
wire [4:0] B_out_5bits;
wire [4:0] MemDataReg_out_5bit;
wire [5:0] ShiftAmt_out;
wire [31:0] DataSrc_out;
wire [31:0] Registrador_A;
wire [31:0] Registrador_B;
wire [31:0] B;
wire [31:0] mux_ShiftSrc_out;
wire [31:0] Store_out;
wire [31:0] AluA_out;


//signal of control
wire [2:0] MemDataReg;
wire load_control;
wire [1:0] Store_control;
wire IR_write;
wire [1:0] Control_ShiftAmt;
wire [2:0] DataSrc_control;
wire WR_B;
wire [2:0] Shift_Control;
wire [1:0] Control_mux_ShiftSrc,
wire [1:0] Store_control,
wire [1:0] AluA_control,


//ALU
wire LT;
wire LT1_32;

//JUMP
wire [25:0] jumpinstruction;
wire [27:0] jump26_28;


parameter ra = 5'b11111;
parameter sp = 5'b11101;


// Signal Extend
signal_1_to_32 LT1_32(
    LT, LT1_32
);

signal_16_to_32 LT16_32(
    imediato, imediato16_32 
);
 
// ALU

//INSTRUÇÕES REG
Instr_Reg IR(
    clk, reset, IR_write, Mem_out, OpCode, RS, RT, imediato
);

//RegDesloc
RegDesloc ShiftReg(
    clk, reset, Shift_Control, ShiftAmt_out, mux_ShiftSrc_out, ShiftReg_out
);

// SHIFT
Shift_26_28 S26_28(
    jumpinstruction, jump26_28
);

Shift_32_32 S32_32(
    imediato, imediato32_32
);

// MULT OR DIV

// JUMP

//MUX
mux_cause_control m_c_c(
    32'b00000000000000000000000011111101, 32'b00000000000000000000000011111110, 32'b00000000000000000000000011111111, cause_control, cause_control_out
);

mux_PCSource m_PCS(
    Result, AluOutCtrl, {PC_out[31:28], jump26_28}, {{24{1'b0}}, Mem_out[7:0]}, EPC_out, PCSource_control, m_PCS_out
);

muxStore Store(
    SH_out, SB_out, S_out, Store_control, Store_out
);

mux_iord iord(
    PC_out, cause_control_out, A, B, Result, IorD,
);

mux_RegDst RegDst(
    RT, RD, ra, sp, RegDst_control, RegDst_out
);

mux_DataSrc DataSrc(
    AluOut, load_out, /*registrador hi*/, /*registrador lo*/, LT1_32, imediato16_32, ShiftReg_out, 32'b00000000000000000000000011100011, DataSrc_control, DataSrc_out
);

muxload load(
    {16{1'b0},MemDataReg_out[15:0]}, {24{1'b0},MemDataReg_out[7:0]}, MemDataReg_out, load_control, load_out 
);

mux_ShiftAmt ShiftAmt(
    B_out_5bits, 5'b10000, Shamt, MemDataReg_out_5bit, Control_ShiftAmt, ShiftAmt_out
);

mux_ShiftSrc ShiftSrc(
    A , imediato16_32, B, Shift_Ctrl, mux_ShiftSrc_out
);

mux_Store Store(
    SH_out, SB_out, S_out, Store_control, Store_out
);

mux_AluSrcA AluSrcA(
    PC_out, Mem_out, A, AluA_control, AluA_out
);

mux_AluSrcB AluSrcB(
    B, 32'b00000000000000000000000000000100, imediato16_32, 
);
//REG

Registrador AluOut(
    clk, reset, AluOutCtrl, Result, AluOutResult 
);

Registrador PC(
    clk, reset, WritePC, m_PCS_out, PC_out
);

Registrador EPC(
    clk, reset, WriteEPC, Result, EPC_out
);

Registrador A(
    clk, reset, WR_A, Registrador_A, A
);

Registrador MemDataReg(
    clk, reset, MemDataRegWR, Mem_out, MemDataReg_out
);

Registrador B(
    clk, reset, WR_B, Registrador_B, B
);
// Unit_Control


//Memory

Memoria Mem(
    IorD, clk, WRmem, Store_out, Mem_out
);

//Bank_of_Reg
Banco_reg Registrador(
    clk, reset, WriteReg, RS, RT, RegDst_out, DataSrc_out, Registrador_A, Registrador_B
);


endmodule: