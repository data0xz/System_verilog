class eth_pkt;

  //properties

  string name="parent";
  static int count;
  rand bit[9:0] len;
  rand byte payload[$];

  //methods
  function new();
    count++;
  endfunction

  function void print(string name="parent class");
    $display("\n\tprinting %s",name);
    $display("\tcount=%0d",count);
    $display("\tlen=%0d",len);
    $display("\tpayload=%p",payload);
  endfunction

  //constraints
  constraint payload_c{
    payload.size()==len;
    len inside {[5:10]};
  }

endclass

