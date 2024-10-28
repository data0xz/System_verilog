// Code your testbench here
// or browse Examples
//packet array

class sample_pkt;

  //properties

  randc bit[2:0] a;
  rand bit[6:0] b;

  //constarint
  constraint ab_c{

    a inside {[0:7]};
    b inside {'h12,'h5,'h64};
  }

endclass

module top; 
  sample_pkt pkt_1;
  sample_pkt pkt_sa[6]; //packet_array [0:4]
  int count;

  parameter repeat_cnt=12;

  initial 
    begin
      pkt_1=new();
      repeat(repeat_cnt)
        begin
          assert(pkt_1.randomize());
          $display("%0d:\t %p",count,pkt_1);
          count++;

          if(count==repeat_cnt/2)
            $display("\n");
        end


      foreach(pkt_sa[i])
        begin
          pkt_sa[i]=new();
          //pkt_sa[i].randomize();
          $display("\t%0d:%p",i,pkt_sa[i]);
        end


      $display("pkt_sa[2] handle address =%0d",pkt_sa[2]);
      $display("\n");
      
      //note for a particular da element ,randc property will be maintained

      repeat(8)
        begin
          pkt_sa[2].randomize();
          $display("%p",pkt_sa[2]);       
        end


    end



endmodule
