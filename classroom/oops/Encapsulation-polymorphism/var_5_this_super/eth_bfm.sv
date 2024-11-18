class eth_bfm;


  eth_pkt pkt;

  task run();
    repeat(10) begin
      eth_common::gen2bfm_mb.get(pkt);
      pkt.print();
    end
  endtask

  


endclass

