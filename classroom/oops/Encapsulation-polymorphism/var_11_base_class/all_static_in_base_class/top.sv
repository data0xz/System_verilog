//forward declaration of class

typedef class eth_bad_pkt;
  typedef class eth_bfm;
    typedef class eth_base;
      typedef class eth_gen;
        typedef class eth_good_pkt;
          typedef class eth_ill_pkt;
            typedef class eth_pkt;
              typedef class eth_env;


                `include "eth_good_pkt.sv"
                `include "eth_ill_pkt.sv"
                `include "eth_pkt.sv"
                `include "eth_env.sv"
                `include "eth_bad_pkt.sv"
                `include "eth_bfm.sv"
                `include "eth_base.sv"
                `include "eth_gen.sv"

                module top;

                  eth_env env=new();


                  initial 

                    begin

                      $value$plusargs("testcase=%s",eth_base::testcase);

                      env.run();


                      begin
                        //note:procedural blk can be only declared in module
                        //not in class

                        $display("\n *****Total pkt counts*****");
                        $display("\t Total_pkts=%0d",eth_pkt::count);
                        $display("\t Good_pkts=%0d",eth_good_pkt::count_good);
                        $display("\t Bad_pkts=%0d",eth_bad_pkt::count_bad);
                        $display("\t ILL_pkts=%0d",eth_ill_pkt::count_ill);                                  
                      end

                    end
                endmodule

