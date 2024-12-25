class eth_pkt;

  static int count;

  class my_pkt;

    class sample;

      static int count;

      string name;

      typedef bit[5:0] bit_t;

      typedef enum{
        GOOD=11,
        BAD,
        ILL
      }pkt_type_t;

      static pkt_type_t pkt_type;

    endclass

  endclass

endclass

module top;

  //eth_pkt::my_pkt::sample s_obj;
  //no need to create obj for static properties

  initial
    begin

      eth_pkt::my_pkt::sample::pkt_type=12;

      $display("\t%s",eth_pkt::my_pkt::sample::pkt_type); //ANS:BAD

      $display("\t%0d",eth_pkt::my_pkt::sample::ILL); //ANS: 13

    end


endmodule

