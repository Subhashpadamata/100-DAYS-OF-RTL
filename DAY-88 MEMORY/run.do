vlog top.sv
vopt top +cover=fcbest -o n_wr_rd_test
vsim -coverage n_wr_rd_test +testname=n_wr_rd_test +num_tx=30 +num_agents=2 -novopt -suppress 12110 
coverage save -onexit n_wr_rd_test.ucdb
add wave -position insertpoint sim:/top/dut/*
#add wave /top/dut_ass/handshake_chk_assert
#add wave /top/dut_ass/rst_applied_clk_assert
#add wave /top/dut_ass/clk_freq_chk_assert
do exclusion.do
run -all


