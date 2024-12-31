
class sample;

  int count;

endclass

class eth_pkt;

  int a,b;

  sample s_o=new();

  function eth_pkt copy(eth_pkt pkt);

    this.a=pkt.a;
    this.b=pkt.b;
    
    //s_o=new();
    this.s_o.count=pkt.s_o.count;

  endfunction

 

endclass


module tb;

  eth_pkt pkt_1=new(),pkt_2=new();

  initial
    begin
      
      n();
      $display("\t***before_copy***");
      $display("pkt_1_handle=%0d",pkt_1);
      $display("pkt_2_handle=%0d",pkt_2);

      //object s_o handle

      $display("pkt_1.s_o=%0d",pkt_1.s_o);
      $display("pkt_2.s_o=%0d",pkt_2.s_o);

      pkt_1.a=10;
      pkt_1.b=20;

      pkt_2.a=30;
      pkt_2.b=40;

      pkt_1.s_o.count=200;
      pkt_2.s_o.count=300;


      $display("pkt_1=%p, pkt_2=%p",pkt_1,pkt_2);
      $display("pkt_1.s_o.count=%0d",pkt_1.s_o.count);
      $display("pkt_2.s_o.count=%0d",pkt_2.s_o.count);



      pkt_1.copy(pkt_2); //deep copy imp 1

      n();
      $display("\t****after_copy pkt_1=pkt_2***");
      $display("pkt_1_handle=%0d",pkt_1);
      $display("pkt_2_handle=%0d",pkt_2);
      //object s_o handle

      $display("pkt_1.s_o=%0d",pkt_1.s_o);
      $display("pkt_2.s_o=%0d",pkt_2.s_o);


      $display("pkt_1=%p, pkt_2=%p",pkt_1,pkt_2);
      $display("pkt_1.s_o.count=%0d",pkt_1.s_o.count);
      $display("pkt_2.s_o.count=%0d",pkt_2.s_o.count);

      //changing pkt_2 contents

      n();
      pkt_2.a=70;
      pkt_2.b=80;

      pkt_2.s_o.count=400;

      $display("pkt_1=%p",pkt_1);
      $display("pkt_2=%p",pkt_2);

      $display("pkt_1.s_o.count=%0d",pkt_1.s_o.count);
      $display("pkt_2.s_o.count=%0d",pkt_2.s_o.count);



    end

  function n();
    $display("\n");
  endfunction

endmodule


