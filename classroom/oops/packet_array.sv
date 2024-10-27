//packet array

class sample_pkt;

  //properties

  randc bit[5:0] a;
  rand bit[6:0] b;

  //constarint
  constraint ab_c{

    a inside {[20:30]};
    b inside {'h12,'h5,'h64};
  }

endclass

module top; 
  sample_pkt pkt_1;
  sample_pkt pkt_sa[5];
  int count;

  initial 
    begin
      pkt_1=new();
      repeat(22)
        begin
          assert(pkt_1.randomize());
          $display("%0d:\t %p",count,pkt_1);
          count++;
          
          if(count==11)
            $display("\n");
        end

    end



endmodule
