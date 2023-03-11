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
wire [1:0] Store_control;
wire [31:0] Store_out;
wire [2:0] IorD;
wire [31:0] A; /**/
wire WR_A;
wire WriteReg;
wire RS;
wire RT;





// Signal of Control
 
// ALU

// MULT OR DIV

// JUMP

//MUX
mux_cause_control m_c_c(
    32'b00000000000000000000000011111101, 32'b00000000000000000000000011111110, 32'b00000000000000000000000011111111, cause_control, cause_control_out
);

mux_PCSource m_PCS(
    Result, AluOutCtrl, {PC[31:28],*/*jumpshifted*/}, {{24{1'b0}}, Mem_out[7:0]}, EPC_out, PCSource_control, m_PCS_out
);

muxStore Store(
    SH_out, SB_out, S_out, Store_control, Store_out
);

mux_iord iord(
    PC_out, cause_control_out, /*Registrador a*/, /*Registrador b*/, Result, IorD,
);

mux_RegDst RegDst(

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
    clk, reset, WR_A, /* Banco de Reg */,
);

// Unit_Control


//Memory

Memoria Mem(
    /* muxiord */, clk, WRmem, Store_out, Mem_out
);

//Bank_of_Reg
Banco_reg Registrador(
    clk, reset, WriteReg, RS, RT, /*mux_RegDst*/
);


endmodule: