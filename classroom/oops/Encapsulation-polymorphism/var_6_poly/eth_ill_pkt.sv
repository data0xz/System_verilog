class eth_ill_pkt extends eth_pkt;

  static int count_ill;
  static int count; //same name as base class

  function new();
    count_ill++;
    count++;
  endfunction 

  function void print(string name);
    super.print("ill_pkt");
    $display("\t count_ill=%0d",count_ill);
    $display("\t this.count=%0d",this.count);
    $display("\t super.count=%0d",super.count);
  endfunction

  constraint ill_c{
    pkt_type == ILL;
  }



endclass

