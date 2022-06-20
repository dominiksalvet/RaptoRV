// https://github.com/dominiksalvet/RaptoRV

module if_stage #(
    parameter RST_PC_VAL = 0
) (
    input rst_l,
    input clk,
    input stall,

    input jmp_en,
    input [31:2] jmp_addr,

    output inst_re,
    output [31:2] if_pc
);

assign inst_re = !stall;

logic [31:2] pc;

always_ff @(posedge clk, negedge rst_l) begin: next_pc
    if (!rst_l)
        pc <= RST_PC_VAL;
    else if (!stall)
        pc <= jmp_en ? jmp_addr : pc + 1; // todo: check increment
end

assign if_pc = pc;

endmodule
