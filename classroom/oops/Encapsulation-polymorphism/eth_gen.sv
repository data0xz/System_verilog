class eth_gen;

 //generate 10 random packets of good,bad,ill

 eth_good_pkt pkt_g;
 eth_bad_pkt  pkt_b;
 eth_ill_pkt  pkt_i;

 bit[1:0] pkt_type;

 //generate packet

 task run();
  
	for (int i=0 ; i<10 ; i++)
	 begin

	    pkt_type=$urandom_range(0,2);

			case(pkt_type)
			 
			 0: begin
           pkt_g=new();
					 assert(pkt_g.randomize());
					 pkt_g.print("pkt_g");
			    end
					

			 1: begin
           pkt_b=new();
					 assert(pkt_b.randomize());
					 pkt_b.print("pkt_b");
			    end


			 2: begin
           pkt_i=new();
					 assert(pkt_i.randomize());
					 pkt_i.print("pkt_i");
			    end

	 end

 endtask


endclass
