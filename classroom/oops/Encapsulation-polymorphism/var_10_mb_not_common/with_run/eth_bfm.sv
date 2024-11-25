class eth_bfm;


  eth_pkt pkt;
  

  task run(mailbox mbox_bfm);
    forever begin
      mbox_bfm.get(pkt);
      pkt.print();
    end
  endtask

  


endclass

