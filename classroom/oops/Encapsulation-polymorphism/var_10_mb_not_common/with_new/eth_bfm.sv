class eth_bfm;


  eth_pkt pkt;
  
  mailbox mbox_bfm;
  
  function new(mailbox abc);
    mbox_bfm=abc;
  endfunction

  task run();
    forever begin
      mbox_bfm.get(pkt);
      pkt.print();
    end
  endtask

  


endclass

