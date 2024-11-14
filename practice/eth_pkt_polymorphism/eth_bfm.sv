class eth_bfm;

  eth_pkt pkt;


  task run_bfm;
    repeat(10)begin
      eth_pkt_common::gen2bfm_mb.get(pkt);
      pkt.print("bfm_print");
    end
  endtask


endclass