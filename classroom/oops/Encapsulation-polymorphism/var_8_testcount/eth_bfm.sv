class eth_bfm;


  eth_pkt pkt;

  task run();
    forever begin
      eth_common::gen2bfm_mb.get(pkt);
      pkt.print();
    end
  endtask

  


endclass

