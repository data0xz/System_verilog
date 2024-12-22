class eth_bfm;

  eth_pkt pkt;

  task bfm_run();
    forever
      begin
        eth_env::mb.get(pkt);
        pkt.print("received_bfm_pkt");  
      end
  endtask


endclass