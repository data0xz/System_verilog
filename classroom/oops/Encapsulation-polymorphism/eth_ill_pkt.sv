class eth_ill_pkt extends eth_pkt;

 static count_ill;

 function new();
  count_ill++;
 endfunction 

 function void print(string name="eth_pkt");
  super.print(name);
	$display("\t count_ill=%0d",count_ill);
 endfunction


endclass
