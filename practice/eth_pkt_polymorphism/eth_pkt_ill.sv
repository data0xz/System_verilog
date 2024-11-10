class eth_pkt_ill extends eth_pkt;

  //new property

  static int count_ill;

  //method

  function new();
    count_ill ++;    
  endfunction

  function void print(string xyz);
    //above function prototype needs to match exactly with parent
    //for polymorphism to work
    super.print("ill_pkt");
    $display("\tcount_ill=%0d",count_ill);
  endfunction



endclass


