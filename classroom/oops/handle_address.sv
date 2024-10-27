// Code your testbench here
// or browse Examples

class eth_pkt;

  rand  bit[7:0] a;
  rand  bit[2:0] b;

endclass


module tb_1;

  eth_pkt pkt_1,pkt_2;

  initial 
    begin


      pkt_ha_addr(pkt_1,pkt_2);

      pkt_1=new();
      pkt_2=new();

      pkt_ha_addr(pkt_1,pkt_2);

      pkt_1.randomize();
      pkt_2.randomize();

      pkt_ha_addr(pkt_1,pkt_2);

      pkt_print(pkt_1,pkt_2);


    end


endmodule

module tb_2;

  eth_pkt pkt_3,pkt_4;

  initial 
    begin


      pkt_ha_addr(pkt_3,pkt_4);

      pkt_3=new();
      pkt_4=new();

      pkt_ha_addr(pkt_3,pkt_4);

      pkt_3.randomize();
      pkt_4.randomize();

      pkt_ha_addr(pkt_3,pkt_4);

      pkt_print(pkt_3,pkt_4);


    end


endmodule


task pkt_ha_addr(eth_pkt pkt_x,pkt_y);

  $display("\t%h",pkt_x);
  $display("\t%h",pkt_y);

endtask

task pkt_print(eth_pkt pkt_x,pkt_y);

  $display("\t%p",pkt_x);
  $display("\t%p",pkt_y);

endtask


//note: in vcs run options :  -xlrm hier_inst_seed 
//+ntb_random_seed_automatic







