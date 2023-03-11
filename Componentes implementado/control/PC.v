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

// Signal of Control
 
// ALU

// MULT OR DIV

// JUMP

//MUX
mux_cause_control m_c_c(
    32'b00000000000000000000000011111101, 32'b00000000000000000000000011111110, 32'b00000000000000000000000011111111, cause_control, cause_control_out
);

mux_PCSource m_PCS(
    Result, AluOutCtrl, {PC[31:28],*/*Tem que fazer o jumpshifted*/}, {{24{1'b0}}, /*MemOut*/}, EPC_out, PCSource_control, m_PCS_out
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

// Unit_Control



endmodule: