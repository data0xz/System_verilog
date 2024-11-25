class eth_ill_pkt extends eth_pkt;

  static int count_ill;

  function new();
    count_ill++;
  endfunction 

  function void print(string name);
    super.print("ill_pkt");
    $display("\t count_ill=%0d",count_ill);
  endfunction

  constraint ill_c{
    pkt_type == ILL;
  }



endclass

