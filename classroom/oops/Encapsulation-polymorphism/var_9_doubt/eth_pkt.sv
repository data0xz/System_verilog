

class eth_pkt;

  static int count;
  rand bit[9:0] len;
  rand byte payload[$];
  //eth_common_non_static  comm=new();

  function new();
    count++;
  endfunction

  //method:1 print

  virtual function void print(string name="eth_pkt");

    $display(" printing %s fields",name);
    $display("\t count=%0d",count);
    $display("\t len=%0d",len);
    $display("\t payload=%p",payload);
    //$display("\t pkt_type=%0d",comm.pkt_type);
    //$display("\t pkt_type=%s",comm.pkt_type);

  endfunction

  //constarint:1 len_c

  constraint len_c{
    len inside {[5:10]};
  }

  //constarint:1 payload_c

  constraint payload_c{
    payload.size() == len;
  }

endclass




/*
module tb;

  eth_pkt pkt_1;

  initial 
    begin
      repeat(6)begin
        pkt_1=new();
        assert(pkt_1.randomize);
        pkt_1.print("pkt_1");
      end
    end

endmodule
*/


