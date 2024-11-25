`include "eth_pkt.sv"
class eth_good_pkt extends eth_pkt;

  static int count_good;

  integer name=8;

  function new();
    count_good++;
  endfunction

  function void print_good();
    
    super.print("parent through child class");
    $display("\tcount_good=%0d",count_good);
    $display("\tcount=%0d",count);
    $display("\t%s",super.name);
    $display("\t%0d",this.name);
    $display("\t%0d",name);
    
  endfunction

endclass

module tb;

  eth_good_pkt g_pkt;

  initial
    begin
      repeat(1)
        begin
          g_pkt=new();
          assert(g_pkt.randomize());
          g_pkt.print_good();
          g_pkt.print();
        end

    end

endmodule

