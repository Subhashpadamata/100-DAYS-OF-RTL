class mem_agent;
	mem_gen gen;
	mem_bfm bfm;
	mem_mon mon;
	mem_cov cov;
	
	function new(int num=0);
		gen=new(num);
		bfm=new(num);
		mon=new(num);
		cov=new(num);
	endfunction

	task run();
		fork
			gen.run();
			bfm.run();
			mon.run();
			cov.run();
		join
	endtask
endclass

