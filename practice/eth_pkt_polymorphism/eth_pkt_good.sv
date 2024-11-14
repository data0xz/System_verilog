class eth_pkt_good extends eth_pkt;

  //new property

  static int count_good;

  //method

  function new();
    count_good ++;    
  endfunction

  function void print(string xyz);
    //above function prototype needs to match exactly with parent
    //for polymorphism to work
    super.print("good_pkt");
    $display("\tcount_good=%0d",count_good);
  endfunction



endclass

