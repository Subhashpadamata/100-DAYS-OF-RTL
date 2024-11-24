#n_wr_n_rd_test
vlog top.sv
vsim top +testname=n_wr_n_rd_test +num_tx=30 +num_agents=2 -novopt -suppress 12110 
add wave -position insertpoint sim:/top/dut/*
add wave /top/dut_ass/handshake_chk_assert
add wave /top/dut_ass/rst_applied_clk_assert
add wave /top/dut_ass/clk_freq_chk_assert
run -all




