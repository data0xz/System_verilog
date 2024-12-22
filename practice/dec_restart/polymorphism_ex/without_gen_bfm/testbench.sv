// Code your testbench here
// or browse Examples

`include "eth_pkt.sv"
`include "eth_good_pkt.sv"
`include "eth_bad_pkt.sv"
`include "eth_ill_pkt.sv"

module top;

  eth_good_pkt g_pkt;
  eth_bad_pkt  b_pkt;
  eth_ill_pkt  i_pkt;

  int test_no;

  initial
    begin
      repeat(10)
        begin
          test_no=$urandom%3;
          case(test_no)
            0:
              begin
                g_pkt=new();
                g_pkt.randomize();
                g_pkt.print("good");
              end
            1:
              begin
                b_pkt=new();        
                b_pkt.randomize();         
                b_pkt.print("bad");
              end

            2:
              begin
                i_pkt=new();        
                i_pkt.randomize();         
                i_pkt.print("ill");
              end

            default: $display("Enter valid case");
          endcase
        end

      $display("\n**** TOTAL COUNT ******");
      $display("\tTotal packet=%0d",eth_pkt::count);
      $display("\tTotal good packet=%0d",eth_good_pkt::count_good);
      $display("\tTotal bad packet=%0d",eth_bad_pkt::count_bad);
      $display("\tTotal ill packet=%0d",eth_ill_pkt::count_ill);
      
    end



endmodule