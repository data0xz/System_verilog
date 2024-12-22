class eth_env;

  eth_gen gen_pkt=new();
  eth_bfm bfm_pkt=new();
  
  static mailbox mb=new();

  task env_run();


    fork //you can use repeat too with same count
      gen_pkt.gen_run();
      bfm_pkt.bfm_run();
    join


  endtask

endclass