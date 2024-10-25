typedef enum bit[1:0]
{
  SMALL  =2'b00,	
  MEDIUM =2'b01,	
  LARGE  =2'b10
}pkt_type_t;

class eth_pkt;

  //properties
  protected 	bit[55:0] preamble;
  protected rand	bit[47:0] sa;
  protected rand	bit[7:0] len;
  protected rand	bit[7:0] payload[$];

  protected static int count;


  //methods

  function new();
    count++;
    preamble={28{2'b10}};
  endfunction

  function void print(string name="eth_packet");
    $display("printing %s fields",name);
    $display("\t count=%0d",count);
    $display("\t preamble=%0h",preamble);
    $display("\t sa=%0d",sa);
    $display("\t len=%0d",len);
    $display("\t payload=%p",payload);
  endfunction


  function void copy_1(output eth_pkt pkt);

    pkt=new();
    pkt.preamble=preamble;
    pkt.sa=sa;
    pkt.len=len;
    pkt.payload=payload;

  endfunction
  
  function eth_pkt copy_2(input eth_pkt pkt_x);
    
    eth_pkt pkt_6=new();
    
    pkt_6.preamble=pkt_x.preamble;
    preamble=pkt_6.preamble;
    
    pkt_6.sa=pkt_x.sa;
    sa=pkt_6.sa;
    
    pkt_6.len=pkt_x.len;
    len=pkt_6.len;
    
    pkt_6.payload=pkt_x.payload;
    payload=pkt_6.payload;
    
    return pkt_6;

  endfunction

  function bit compare(eth_pkt pkt);
    if(preamble ==pkt.preamble &&
       sa==pkt.sa &&
       len==pkt.len &&
       payload==pkt.payload)

      return 1;
    else 
      return 0;

  endfunction

  //constraint

  constraint len_sa_c
  {
    len inside {[5:10]};
    sa inside {[100:150]};
  }

  constraint payload_c
  {
    payload.size()==len;
    foreach (payload[i])
      payload[i] inside {8'h1f,8'h5f};
  }


endclass

module top;

  eth_pkt pkt_1,pkt_2;

  initial 
    begin
      pkt_1=new();
      assert(pkt_1.randomize());
      pkt_1.print("pkt_1");

      pkt_2=new();
      assert(pkt_2.randomize());		
      pkt_2.print("pkt_2");
      
      //assert(pkt_2.compare(pkt_1));
      
      //copy & then compare
      
      pkt_1.copy_2(pkt_2); //copying contents of 1 to 2
      //both should have now same values of pkt_1
      
      $display("%p",pkt_1);
      $display("%p",pkt_2);
      
      //compare
    
      assert(pkt_1.compare(pkt_2));
      
      
      
      

    end

endmodule




