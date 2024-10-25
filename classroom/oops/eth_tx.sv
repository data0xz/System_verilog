// Code your testbench here
// or browse Examples
class eth_pckt;

  //properties

  local bit[55:0] preamble;
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

module top;
  eth_pckt pckt_1;
  class eth_pkt;

    //properties
    protected bit[55:0] preamble;
    protected bit[47:0] preamble;

    protected bit[55:0] preamble;
    
    protected bit[55:0] preamble;







  endclass



  initial 
    begin
      pckt_1=new();
      pckt_1.print("pckt after new");
      assert( pckt_1.randomize());
      pckt_1.print("pckt after randomize");
      $display("pckt_1=%p",pckt_1);
      //pckt_1.preamble=200;
      pckt_1.preamble_t(200);
      $display("pckt_1=%p",pckt_1);
      //$display("%d",pckt_1.preamble);
    end


endmodule


