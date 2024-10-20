class eth_frame;

 rand bit[55:0] preamble;
 rand bit[7:0]  sfd;
 rand bit[47:0] da;
 rand bit[47:0] sa;
 rand bit[15:0] len;
 rand bit[7:0]  payload[$];
 rand bit[31:0] crc;


    typedef bit[3:0] nibble;

    nibble dataQ[$];

    function void pack();
   
    dataQ={>>nibble{preamble,sfd,da,sa,len,payload,crc}};
  	$display("%p",dataQ);

    endfunction

endclass

 eth_frame eth_1;


module tb;

	
 initial 
  begin
	  eth_1=new();
		eth_1.pack();
		eth_1.randomize();
	end

endmodule
