`define addr_width 16
`define width 32

`include "common.sv"
`include "memory.sv"
`include "mem_ass.sv"
`include "mem_tx.sv"
`include "mem_intf.sv"
`include "mem_mon.sv"
`include "mem_cov.sv"
`include "mem_bfm.sv"
`include "mem_gen.sv"
`include "mem_agent.sv"
`include "mem_env.sv"

module top;
    bit clk, rst;
    mem_env env;
    event start_env;
    
    // Instantiate interface
    mem_intf pif(clk, rst); 

    // DUT: Memory
    memory dut (
        .clk_i   (pif.clk_i), 
        .rst_i   (pif.rst_i), 
        .addr_i  (pif.addr_i), 
        .wr_rd_i (pif.wr_rd_i), 
        .wdata_i (pif.wdata_i), 
        .rdata_o (pif.rdata_o), 
        .valid_i (pif.valid_i), 
        .ready_o (pif.ready_o)
    );

    // Assertions
    assertions dut_ass (
        .clk_i   (clk),
        .rst_i   (rst),
        .addr_i  (pif.addr_i),
        .wdata_i (pif.wdata_i),
        .rdata_o (pif.rdata_o),
        .wr_rd_i (pif.wr_rd_i),
        .valid_i (pif.valid_i),
        .ready_o (pif.ready_o)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Reset and start environment
    initial begin
        rst = 1;
        repeat(2) @(posedge clk);
        rst = 0;
        ->start_env;
    end

    // Environment initialization
    initial begin
        assert($value$plusargs("testname=%s", common::testname));
        assert($value$plusargs("num_tx=%0d", common::num_tx));
        assert($value$plusargs("num_agents=%0d", common::num_agents));
        wait(start_env.triggered());
        env = new();
        env.run();
    end

    // Simulation end condition
    initial begin
        wait(common::func_start.triggered());
        repeat(2) @(posedge clk);
		rst=1;
		@(posedge clk);
		rst=0;
		@(posedge clk);
        $finish();
    end
endmodule

