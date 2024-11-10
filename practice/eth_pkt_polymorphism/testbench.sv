// Code your testbench here
// or browse Examples
`include "eth_pkt_common.sv"
`include "eth_pkt.sv"
`include "eth_pkt_good.sv"
`include "eth_pkt_bad.sv"
`include "eth_pkt_ill.sv"
`include "eth_gen.sv"
`include "eth_bfm.sv"
`include "eth_env.sv"



module tb;
  eth_env pkt_env=new();

  initial
    begin

      pkt_env.run();

      //total count
      $display("\n*****Displaying total pkt counts*********");
      $display("\tTotal_count=%0d",eth_pkt::count);
      $display("\tgood_count=%0d",eth_pkt_good::count_good);
      $display("\tbad_count=%0d", eth_pkt_bad::count_bad);
      $display("\till_count=%0d", eth_pkt_ill::count_ill);
    end

endmodule