typedef class eth_bad_pkt;
  typedef class eth_bfm;
    //typedef class eth_common;
      typedef class eth_gen;
        typedef class eth_good_pkt;
          typedef class eth_ill_pkt;
            typedef class eth_pkt;
              typedef class eth_env;


                `include "eth_bad_pkt.sv"
                `include "eth_bfm.sv"
                //`include "eth_common.sv"
                `include "eth_gen.sv"
                `include "eth_good_pkt.sv"
                `include "eth_ill_pkt.sv"
                `include "eth_pkt.sv"
                `include "eth_env.sv"




                module top;

                  eth_env env_pkt=new();

                  initial
                    begin

                      env_pkt.env_run();
                    end

                  initial
                    begin
                      #1;
                      $display("\n**** TOTAL COUNT ******");
                      $display("\tTotal packet=%0d",eth_pkt::count);
                      $display("\tTot goodpacket=%0d",eth_good_pkt::count_good); 
                      $display("\tTotal bad packet=%0d",eth_bad_pkt::count_bad);
                      $display("\tTotal ill packet=%0d",eth_ill_pkt::count_ill);
                      #2;
                      $finish;
                    end





                endmodule