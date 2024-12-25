class sample;
  
  int count;
  
endclass

class eth_pkt;
  
  int a;
  sample s_inst=new();
  
  
endclass

module top;
  
  eth_pkt pkt_1;
  
  initial
    begin
      pkt_1=new();
      pkt_1.s_inst.count=20;
      $display("\t %0d", pkt_1.s_inst.count);
      
    end
  
endmodule
