class sample;

  rand int count_1;
  rand int count_2;

  constraint c{

    count_1 inside {[200:300]};
    count_2 inside {[300:400]};                     
  };

endclass

class sample_1;

  rand int count_3;
  rand int count_4;

  constraint c{

    count_3 inside {[400:500]};
    count_4 inside {[500:600]}; 
  };

endclass

class eth_pkt;

  rand int count_5;
  rand int count_6;

  sample     s=new(); //not rand
  sample_1 s_1=new(); //not rand

endclass

module top;

  eth_pkt pkt_1=new(),pkt_2=new();

  mailbox mbox=new();

  initial
    begin

      assert(pkt_1.randomize() with {count_5>0;count_5<50;count_6>0;count_6<50;});

      assert(pkt_2.randomize() with {count_5>50;count_5<100;count_6>50;count_6<100;});

      $display("pkt_1=%p",pkt_1);
      $display("pkt_2=%p",pkt_2);

      assert(pkt_1.s.randomize());
      assert(pkt_1.s_1.randomize());

      assert(pkt_2.s.randomize());
      assert(pkt_2.s_1.randomize());


      $display("pkt_1.s=%p",pkt_1.s);
      $display("pkt_1.s_1=%p",pkt_1.s_1);

      $display("pkt_2.s=%p",pkt_2.s);
      $display("pkt_2.s_1=%p",pkt_2.s_1);



    end

endmodule