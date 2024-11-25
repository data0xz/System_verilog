class eth_env;

  mailbox gen2bfm=new();//common mailbox
  
  eth_bfm bfm=new(gen2bfm);
  eth_gen gen=new(gen2bfm);
  
  

  task run();

    fork
      bfm.run();
      gen.run();
    join

  endtask


endclass

