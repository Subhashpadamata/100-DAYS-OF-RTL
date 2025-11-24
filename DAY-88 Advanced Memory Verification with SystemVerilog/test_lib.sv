class mem_base_test extends uvm_test;
	`uvm_component_utils(mem_base_test)
	mem_env env;
	`COMP_NEW

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("MEM_BASE_TEST","build_phase of mem_base_test",UVM_NONE)
		env = mem_env::type_id::create("env",this);
	endfunction

	task run_phase(uvm_phase phase);
		mem_base_seq seq;
		`uvm_info("MEM_BASE_TEST","run_phase of mem_base_test",UVM_NONE)
		seq=mem_base_seq::type_id::create("seq");
		phase.raise_objection(this);
		seq.start(env.agent.sqr);
		phase.phase_done.set_drain_time(this,100);
		phase.drop_objection(this);
	endtask

	function void end_of_elaboration_phase(uvm_phase phase);
		uvm_top.print_topology();
	endfunction
	
endclass

class mem_wr_rd_test extends mem_base_test;
	`uvm_component_utils(mem_wr_rd_test)
	`COMP_NEW
	task run_phase(uvm_phase phase);
		mem_wr_rd_seq seq;
		`uvm_info("MEM_WR_RD_TEST","run_phase of mem_wr_rd_test",UVM_NONE)
		seq=mem_wr_rd_seq::type_id::create("seq");
		phase.raise_objection(this);
		seq.start(env.agent.sqr);
		phase.phase_done.set_drain_time(this,100);
		phase.drop_objection(this);
	endtask

endclass

class mem_n_wr_rd_test extends mem_base_test;
	`uvm_component_utils(mem_n_wr_rd_test)
	`COMP_NEW
	
	task run_phase(uvm_phase phase);
		mem_n_wr_rd_seq seq;
		`uvm_info("MEM_N_WR_RD_TEST","run_phase of mem_n_wr_rd_test",UVM_NONE)
		seq=mem_n_wr_rd_seq::type_id::create("seq");
		phase.raise_objection(this);
		seq.start(env.agent.sqr);
		phase.phase_done.set_drain_time(this,100);
		phase.drop_objection(this);
	endtask

endclass

class mem_5_wr_rd_test extends mem_base_test;
	`uvm_component_utils(mem_5_wr_rd_test)
	`COMP_NEW
	
	task run_phase(uvm_phase phase);
		mem_5_wr_rd_seq seq;
		`uvm_info("MEM_5_WR_RD_TEST","run_phase of mem_5_wr_rd_test",UVM_NONE)
		seq=mem_5_wr_rd_seq::type_id::create("seq");
		phase.raise_objection(this);
		seq.start(env.agent.sqr);
		phase.phase_done.set_drain_time(this,100);
		phase.drop_objection(this);
	endtask

endclass
