class eth_pkt;

  static int count;

  typedef enum{
    GOOD=4,
    BAD,
    ILL
  }pkt_type_t;
  
  static pkt_type_t pkt_type_u; //note static should be defined 

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

       pkt_type_t pkt_type;

    endclass

  endclass

endclass

module top;

  eth_pkt::my_pkt::sample s_obj;

  initial
    begin
      s_obj=new();

      s_obj.pkt_type=11;

      $display("\t %s",s_obj.pkt_type);

      s_obj.pkt_type=eth_pkt::my_pkt::sample::ILL;

      $display("\t %0d",s_obj.pkt_type);
      
      
      
      //accessing upper packet type static prop & not creating object
      
      eth_pkt::pkt_type_u=6;
      
      $display("\t %s",eth_pkt::pkt_type_u);
      
      $display("\t %0d",eth_pkt::BAD);

    end


endmodule

