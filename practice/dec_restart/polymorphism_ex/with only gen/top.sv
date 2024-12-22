`include "eth_pkt.sv"
`include "eth_good_pkt.sv"
`include "eth_bad_pkt.sv"
`include "eth_ill_pkt.sv"
`include "eth_common.sv"
`include "eth_gen.sv"


module top;
  eth_gen gen_pkt=new();
  
  initial
    begin
      gen_pkt.gen_run(); 
      
      
      $display("\n**** TOTAL COUNT ******");
      $display("\tTotal packet=%0d",eth_pkt::count);
      $display("\tTotal good packet=%0d",eth_good_pkt::count_good);
      $display("\tTotal bad packet=%0d",eth_bad_pkt::count_bad);
      $display("\tTotal ill packet=%0d",eth_ill_pkt::count_ill);

    end
  
endmodule