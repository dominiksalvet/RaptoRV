//------------------------------------------------------------------------------
// Copyright 2022 Dominik Salvet
// https://github.com/dominiksalvet/riscv-soc
//------------------------------------------------------------------------------

module core (
    input rst_l,
    input clk,

    //------------------------- AXI4-Lite interface ----------------------------
    // Write address channel
    output          axi_awvalid,
    input           axi_awready,
    output [31:0]   axi_awaddr,
    output [2:0]    axi_awprot,

    // Write data channel
    output          axi_wvalid,
    input           axi_wready,
    output [31:0]   axi_wdata,
    output [3:0]    axi_wstrb,

    // Write response channel
    input           axi_bvalid,
    output          axi_bready,
    input  [1:0]    axi_bresp,

    // Read address channel
    output          axi_arvalid,
    input           axi_arready,
    output [31:0]   axi_araddr,
    output [2:0]    axi_arprot,

    // Read data channel
    input           axi_rvalid,
    output          axi_rready,
    input  [31:0]   axi_rdata,
    input  [1:0]    axi_rresp
);
    
endmodule
