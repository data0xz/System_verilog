class eth_env;

  eth_gen pkt_gen=new();
  eth_bfm pkt_bfm=new();

  task run;
    fork
      pkt_gen.gen_run();
      pkt_bfm.run_bfm();
    join

  endtask

endclass