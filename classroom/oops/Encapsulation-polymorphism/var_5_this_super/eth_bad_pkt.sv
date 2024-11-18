class eth_bad_pkt extends eth_pkt;

 static int count_bad;
 static int count; //same name as base class

  function new();
    count_bad++;
    count=13;
  endfunction 

  function void print(string name);
    super.print("bad_pkt");
    $display("\t count_bad=%0d",count_bad);
    $display("\t this.count=%0d",this.count);
    $display("\t super.count=%0d",super.count);
  endfunction

  constraint bad_c{
    pkt_type == BAD;
  }


endclass

