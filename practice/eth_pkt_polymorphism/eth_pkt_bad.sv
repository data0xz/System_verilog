class eth_pkt_bad extends eth_pkt;

  //new property

  static int count_bad;

  //method

  function new();
    count_bad ++;    
  endfunction

  function void print(string xyz);
    //above function prototype needs to match exactly with parent upto the string name xyz , 
    //for polymorphism to work
    super.print("bad_pkt");
    $display("\tcount_bad=%0d",count_bad);
  endfunction



endclass


