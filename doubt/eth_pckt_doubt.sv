// Code your testbench here
// or browse Examples
class eth_pckt;
  
  static int count;

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
    
     count++;
    {preamble,sfd}={{28{2'b10}},8'hab}; 

  endfunction

  function void preamble_t(bit[55:0] preamble_t);
    preamble=preamble_t;
  endfunction

  constraint len_c 
  {
    len inside {[5:8]};
  }

  constraint payload_c
  {
    payload.size() ==len;

  }
  
  constraint da_sa
  {
    da inside {[100:200]};
    sa inside {[50:80]};
  }

endclass

module top;
  eth_pckt pckt_1;

  initial 
    begin
      repeat(5)
        begin
          pckt_1=new();
          assert( pckt_1.randomize());
          //pckt_1.print("pckt after randomize tb_1");
          $display("pckt_1=%p",pckt_1);
        end

    end


endmodule

module top_1;
  eth_pckt pckt_2;
  
 initial 
    begin
      $display("\n");
      repeat(3)
        begin
          pckt_2=new();
          assert( pckt_2.randomize());
          //pckt_2.print("pckt after randomize tb_2");
          $display("pckt_2=%p",pckt_2);
        end

    end
  
  
endmodule



