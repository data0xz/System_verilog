class eth_bad_pkt extends eth_pkt;

  static int count_bad;

  function new();
    count_bad++;
  endfunction 

  function void print(string name);
    super.print("bad_pkt");
    $display("\t count_bad=%0d",count_bad);
  endfunction


endclass

