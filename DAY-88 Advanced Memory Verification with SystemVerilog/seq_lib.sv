class mem_base_seq extends uvm_sequence#(mem_tx);
`uvm_object_utils(mem_base_seq);
`OBJ_NEW

	task pre_body();
		`uvm_info("pre_body","pre_boby of mem_base_seq",UVM_NONE)	
	endtask
		
	task post_body();
		`uvm_info("post_body","post_boby of mem_base_seq",UVM_NONE)	
	endtask

endclass

class mem_wr_rd_seq extends mem_base_seq;
	mem_tx tx;
	`uvm_object_utils(mem_wr_rd_seq)
	`OBJ_NEW

	task body();
		`uvm_do_with(req,{req.wr_rd==1;})
		tx = new req;
		`uvm_do_with(req,{req.wr_rd==0; req.addr == tx.addr;})
	endtask
endclass


class mem_n_wr_rd_seq extends mem_base_seq;
	int tx_num;
	mem_wr_rd_seq seq;
	`uvm_object_utils(mem_n_wr_rd_seq)
	`OBJ_NEW

	task body();
		uvm_resource_db#(int)::read_by_name("GLOBAL","tx_num",tx_num,this);
		repeat(tx_num) `uvm_do(seq) 
	endtask

endclass

class mem_5_wr_rd_seq extends mem_base_seq;
	mem_wr_rd_seq seq;
	`uvm_object_utils(mem_5_wr_rd_seq)
	`OBJ_NEW

	task body();
		repeat(5) `uvm_do(seq) 
	endtask

endclass

