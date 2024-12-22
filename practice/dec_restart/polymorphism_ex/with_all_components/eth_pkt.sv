class eth_pkt;

  //properties
  static int count ;
  rand bit[7:0] len;
  rand byte payload[$];

  //constarints
  constraint len_c{
    len inside {[5:8]};
  }

  constraint payload_c
  {
    payload.size()==len;
    foreach(payload[i]) 
      payload[i] inside {[16:31]};
  }

  //methods

  function new();
    count++;
  endfunction

  virtual function void print(string name="eth_pkt_default");

    $display("Displaying %s fields",name);
    $display("\tcount=%0d",count);
    $display("\tlen=%0d",len);
    $display("\tpayload=%p",payload);

  endfunction


endclass

