class samp_pkt;

  //properties
  bit[55:0] preamble; //no sfd,da
  rand  bit[47:0] sa;
  rand	bit[15:0] len;
  rand	bit[7:0]  payload[$];

  static int count;


  //methods

  function new();
    count++;
    preamble={28{2'b10}};
  endfunction

  function void print(string name="eth_packet");

    $display("printing %s fields",name);

    //prop
    $display("\t preamble=%0h",preamble);
    $display("\t sa=%0d",sa);
    $display("\t len=%0d",len);
    $display("\t payload=%p",payload);
    $display("\t count=%0d",count);

  endfunction


  function void copy(output samp_pkt pkt);

    pkt=new();
    pkt.preamble=preamble;
    pkt.sa=sa;
    pkt.len=len;
    pkt.payload=payload;

  endfunction

  function bit compare(samp_pkt pkt);

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


endclass




module top;

  samp_pkt pkt_1,pkt_2,pkt_3,pkt_4;


  byte pck_q[$];

  initial 
    begin
      pkt_1=new();
      assert(pkt_1.randomize() with {len==5;});
      pkt_1.print("pkt_1");
      $display("pkt_1=%p",pkt_1);

      pkt_2=new();
      assert(pkt_2.randomize() with {len==8;});
      pkt_2.print("pkt_2");      
      $display("pkt_2=%p",pkt_2);

      

      //copy 
      newline();
      $display("pkt_2 before copy=%p",pkt_2);
      pkt_1.copy(pkt_2);
      $display("pkt_2 after copy=%p",pkt_2);
          

      //compare
      newline();
      assert(pkt_2.compare(pkt_1));
      
      

      //packing
      $display("\npkt_1=%p",pkt_1);
      pck_q={>>byte{pkt_1}};
      $display("pck_q=%p",pck_q);


      //unpacking
       
      pkt_4=new();
      {>>byte{pkt_4}}=pck_q;
      $display("pkt_4=%p",pkt_4);

      //compare
      assert(pkt_4.compare(pkt_2)); 

    end

endmodule

task newline();
  $display("\n");
endtask

