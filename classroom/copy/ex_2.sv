class eth_pkt;

  int a,b;

endclass


module tb;

  eth_pkt pkt_1,pkt_2;

  initial
    begin

      pkt_1=new();
      pkt_2=new();

      n();
      $display("before_copy");
      $display("pkt_1_handle=%0d",pkt_1);
      $display("pkt_2_handle=%0d",pkt_2);

      pkt_1.a=10;
      pkt_1.b=20;

      pkt_2.a=30;
      pkt_2.b=40;


      $display("pkt_1=%p, pkt_2=%p",pkt_1,pkt_2);


      pkt_1= new pkt_2;

      n();
      $display("after_copy pkt_1=pkt_2");
      $display("pkt_1_handle=%0d",pkt_1);
      $display("pkt_2_handle=%0d",pkt_2);


      $display("pkt_1=%p, pkt_2=%p",pkt_1,pkt_2);

      //changing pkt_2 contents
      
      n();
      pkt_2.a=50;
      $display("pkt_1=%p",pkt_1);
      $display("pkt_2=%p",pkt_2);

    end

  function n();
    $display("\n");
  endfunction

endmodule


