class eth_bfm extends eth_base;


  eth_pkt pkt;

  task run();
    repeat(count) begin
      gen2bfm_mb.get(pkt);
      pkt.print();
    end
  endtask

  


endclass

