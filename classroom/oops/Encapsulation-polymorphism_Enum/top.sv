//forward declaration of class

typedef class eth_bad_pkt;
  typedef class eth_bfm;
    typedef class eth_common;
      typedef class eth_gen;
        typedef class eth_good_pkt;
          typedef class eth_ill_pkt;
            typedef class eth_pkt;
              typedef class eth_env;


                `include "eth_bad_pkt.sv"
                `include "eth_bfm.sv"
                `include "eth_common.sv"
                `include "eth_gen.sv"
                `include "eth_good_pkt.sv"
                `include "eth_ill_pkt.sv"
                `include "eth_pkt.sv"
                `include "eth_env.sv"

                module top;

                  eth_env env=new();

                  initial 
                    begin
                      env.run();
                    end

                endmodule

