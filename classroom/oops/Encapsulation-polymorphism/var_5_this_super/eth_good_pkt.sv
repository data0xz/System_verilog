class eth_good_pkt extends eth_pkt;

  static int count_good;
  static int count; //same name as base class

  function new();
    count_good++;
    count=12;
  endfunction 

  function void print(string name);
    super.print("good_pkt");
    $display("\t count_good=%0d",count_good);
    $display("\t this.count=%0d",this.count);
    $display("\t super.count=%0d",super.count);
  endfunction

  constraint good_c{
    pkt_type == GOOD;
  }


endclass

