// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
typedef enum bit[1:0]
{
  SMALL  =2'b00,	
  MEDIUM =2'b01,	
  LARGE  =2'b10

}pkt_type_t;

class eth_pkt;



  //properties

  rand  pkt_type_t pkt_type;  
  bit[55:0] preamble; //no sfd,da
  rand  bit[47:0] sa;
  rand	bit[15:0] len;
  rand	bit[7:0] payload[$];

  static int count;


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


  function void copy(output eth_pkt pkt);

    pkt=new();
    pkt.preamble=preamble;
    pkt.sa=sa;
    pkt.len=len;
    pkt.payload=payload;

  endfunction

  function bit compare(eth_pkt pkt);
    
    if(preamble == pkt.preamble &&
       sa==pkt.sa &&
       len==pkt.len &&
       payload==pkt.payload)

      return 1;
    else 
      return 0;

  endfunction

  //constraint

  constraint sa_c
  {
    sa inside {[100:150]};
  }

  constraint payload_c
  {
    payload.size()==len;
    foreach (payload[i])
      payload[i] inside {8'h1f,8'h5f};
  }

  constraint pkt_type_c
  {
    (pkt_type == SMALL)  -> (len inside {[1:5]});  
    (pkt_type == MEDIUM) -> (len inside {[6:10]}); 
    (pkt_type == LARGE)  -> (len inside {[11:15]}); 
  }


endclass

module top;

  eth_pkt pkt_1,pkt_2,pkt_3;


  byte pck_q[$];

  initial 
    begin
      pkt_1=new();
      assert(pkt_1.randomize());
      pkt_1.print("pkt_1");
      $display("pkt_1=%p",pkt_1);

      pkt_2=new();
      assert(pkt_2.randomize());
      pkt_2.print("pkt_2");      
      $display("pkt_2=%p",pkt_2);
      
      //GENERATE 5 SMALL PACKETS
      
      repeat(5)
        begin
          pkt_3=new();
          assert(pkt_3.randomize() with {pkt_type == SMALL;});
          $display("pkt_3=%p",pkt_3);        
        end
      
      //copy 
      newline();
      $display("pkt_1 before copy=%p",pkt_1);
      pkt_3.copy(pkt_1);
      $display("pkt_1 after copy=%p",pkt_1);
      
      //compare
      newline();
      assert(pkt_3.compare(pkt_1));

      //packing
      $display("\n pkt_1=%p",pkt_1);
      pck_q={>>byte{pkt_1}};
      $display("pck_q=%p",pck_q);

      
      ////unpacking object not working ///check

      /*
      //unpacking

      {<<byte{pkt_2}}=pck_q;
      $display("pkt_2=%p",pkt_2);

      //compare
      assert(pkt_2.compare(pkt_1)); */



    end


endmodule

task newline();
  $display("\n");
  
endtask
