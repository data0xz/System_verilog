class eth_bad_pkt extends eth_pkt;

 static count_bad;

 function new();
  count_bad++;
 endfunction 

 function void print(string name="eth_pkt");
  super.print(name);
	$display("\t count_bad=%0d",count_bad);
 endfunction


endclass
