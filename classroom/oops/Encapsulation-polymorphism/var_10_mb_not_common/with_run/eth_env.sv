class eth_env;

  mailbox gen2bfm=new();//common mailbox
  
  eth_bfm bfm=new();
  eth_gen gen=new();
  
  

  task run();

    fork
      bfm.run(gen2bfm);
      gen.run(gen2bfm);
    join

  endtask


endclass

