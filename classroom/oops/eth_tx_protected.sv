// Code your testbench here
// or browse Examples
class eth_pckt;

  //properties

  protected bit[55:0] preamble;
  bit[7:0]  sfd;
  rand bit[47:0] da;
  rand bit[47:0] sa;
  rand bit[15:0] len;
  rand bit[7:0]  payload[$];
  bit[31:0] crc;

  //methods

  function void print(string name);
    $display("\n%s",name);
    $display("\tpreamble=%h",preamble); 
    $display("\tsfd=%h",sfd);
    $display("\tda=%h",da);
    $display("\tsa=%h",sa);
    $display("\tlen=%0d",len);
    foreach(payload[i])
      $display("\tpayload[%0d]=(0x%h)h",i,payload[i]);
    $display("\tpayload=%p",payload);
  endfunction

  //constraints

  function  new();

    {preamble,sfd}={{28{2'b10}},8'hab}; 

  endfunction

  function void preamble_t(bit[55:0] preamble_t);
    preamble=preamble_t;
  endfunction

  constraint len_c 
  {
    len inside {[10:50]};
  }

  constraint payload_c
  {
    payload.size() ==len;

  }

endclass


class eth_pckt_ext extends eth_pckt;
   
  /*constraint pre_c
  {
  preamble inside {500};
  }randomize will fail as there will be conflict in randomization*/
  
  function  preamble_change(bit[55:0] preamble_t);
    preamble=preamble_t;   
  endfunction
  
endclass

module top;
  //let's see if inherited class retained all  the property 
  
  eth_pckt_ext pkt_ext;
  
  initial 
     begin
       pkt_ext=new();
       pkt_ext.print("after new");
       $display("%p",pkt_ext);
       
       assert(pkt_ext.randomize());
       pkt_ext.print("after randomize");
       $display("%p",pkt_ext);
       
       //pramble is protceted , can't change here
       //pkt_ext.preamble = 500;
       
       //then how? from inherited exteded class? yes !
       
       pkt_ext.preamble_change(500);
       pkt_ext.print("after inherited class change");
       $display("%p",pkt_ext);
       
       
       
       
     end
  

endmodule



