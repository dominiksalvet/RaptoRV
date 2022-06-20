//------------------------------------------------------------------------------
// Copyright 2021 Dominik Salvet
// https://github.com/dominiksalvet/raptorv
//------------------------------------------------------------------------------

module core (
    input rst_l,
    input clk,

    output inst_re, // todo: memory operation may fail
    output [31:0] inst_addr,
    input [31:0] inst,

    output data_access,
    output data_we,
    output [31:0] data_addr,
    output [31:0] wr_data,
    input [31:0] rd_data
);

endmodule
