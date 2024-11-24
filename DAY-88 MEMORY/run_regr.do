# Compilation
vlog top.sv

# Optimization
vopt top +cover=fcbest -o n_wr_rd_test

# Open test list file
set fp [open "test_list.txt" r]

# Loop through test list
while { [gets $fp testname] >= 0 } {
    # Run simulation and coverage analysis for each test
    vsim -coverage n_wr_rd_test +testname=$testname +num_tx=30 +num_agents=2 -novopt -suppress 12110
	do exclusion.do

    # Run the simulation to completion
    run -all
}

# Close the test list file
close $fp
