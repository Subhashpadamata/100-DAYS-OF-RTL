class mem_env;
	mem_agent agent[];

	function new();
		agent=new[common::num_agents];
		$display("num_agents=%0d",common::num_agents);
		$display("num_tx=%0d",common::num_tx);
		foreach(agent[i])
			agent[i]=new(i);
	endfunction

	task run();
		foreach(agent[i])
			begin
				fork 
					begin
						$display("i=%0d",i);
						agent[i].run();
					end
				join_none
				#0;
			end
	endtask
endclass

