module assembler_Op (
    // INPUT
    input wire [31:0] PC_out,
    input wire [4:0] RS, RT,
    input wire [15:0] imediato,
    input wire [31:0] MemDataReg_out,
    //OUTPUT
    output wire [31:0] SH_out,
    output wire [31:0] SB_out,
    output wire [31:0] S_out,
    output wire [4:0] RD,
    output wire [4:0] Shamt,
    output wire [25:0] jumpinstruction, 
    output wire [4:0] B_out_5bits,
    output wire [4:0] MemDataReg_out_5bit

);

    wire [15:0] SH_B_in;
    wire [15:0] SH_Mem_in;
    wire [7:0] SB_B_in;
    wire [23:0] SB_Mem_in;

    assign SH_B_in = B[15:0];
    assign SH_Mem_in = MemDataReg_out [31:16];
    assign SB_B_in = B[7:0];
    assign SB_Mem_in = MemDataReg_out [31:8];

    assign SH_out = {SH_Mem_in, SH_B_in}
    assign SB_out = {SB_Mem_in, SB_B_in};
    assign S_out = B;
    assign RD = imediato[15:11];
    assign Shamt = imediato[10:6];
    assign jumpinstruction = {RS, RT, imediato};
    assign B_out_5bits = B[4:0];
    assign MemDataReg_out_5bit = MemDataReg_out[4:0];
endmodule