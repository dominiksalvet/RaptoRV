//------------------------------------------------------------------------------
// Copyright 2021 Dominik Salvet
// https://github.com/dominiksalvet/raptorv
//------------------------------------------------------------------------------

module id_stage
    import raptorv_pkg::*;
(
    input rst_l,
    input clk,
    input stall,
    input flush,

    input [31:0] inst,
    input [31:2] if_pc,

    output reg [31:2] id_pc
);

logic [31:0] ir;

always_ff @(posedge clk, negedge rst_l) begin
    if (!rst_l || flush) // todo: check async/sync signals together
        ir <= NOP_INST;
    else if (!stall) begin
        id_pc <= if_pc;
        ir <= inst;
    end
end

decoder decoder0 (
    .inst(ir)
);

endmodule
