class eth_frame;

 bit[55:0] preamble={$random,$random};
 bit[7:0]  sfd=$random;
 bit[47:0] da=$random;
 bit[47:0] sa;
 bit[15:0] len;
 bit[7:0]  payload[$];
 bit[31:0] crc;


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
	end

endmodule
