//------------------------------------------------------------------------------
// Copyright 2021 Dominik Salvet
// https://github.com/dominiksalvet/raptorv
//------------------------------------------------------------------------------

module register_file (
    input clk,

    input rs1_re,
    input [4:0] rs1_addr,
    output [31:0] rs1_data,

    input rs2_re,
    input [4:0] rs2_addr,
    output [31:0] rs2_data,

    input rd_we,
    input [4:0] rd_addr,
    input [31:0] rd_data
);

logic [4:0] rs1_addr_final, rs2_addr_final;

assign rs1_addr_final = rs1_re ? rs1_addr : 0;
assign rs2_addr_final = rs2_re ? rs2_addr : 0;

logic [31:0] registers [31:1];

assign rs1_data = rs1_addr_final == 0 ? 0 : registers[rs1_addr_final];
assign rs2_data = rs2_addr_final == 0 ? 0 : registers[rs2_addr_final];

always_ff @(posedge clk) begin: registers_write
    if (rd_addr != 0 && rd_we)
        registers[rd_addr] <= rd_data;
end

endmodule
