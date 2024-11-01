typedef enum bit[1:0]{

  SMALL,
  MED,
  BIG

}pkt_type_t;

class sample_pkt;

  //properties
  static string test_name_cls;


  rand bit[55:0] preamble;
  rand bit[47:0] sa;
  rand bit[47:0] da;
  rand bit[7:0] len;
  rand pkt_type_t pkt_type;


  //method

  function void print();

    $display("\t preamble=%0h",preamble);
    $display("\t sa=%0d",sa);
    $display("\t da=%0d",da);
    $display("\t len=%0d",len);
    $display("\t pkt_type=%s",pkt_type);


  endfunction

  //constraint

  constraint sa_c{
    soft sa inside {[20_000:30_000]};
  }

  constraint da_c{
    soft da inside {[40_000:50_000]};
  }

  constraint len_c{
    len inside {[200:255]};
  }

  constraint pkt_c{

    (pkt_type == SMALL) -> len inside {[1:50]};
    (pkt_type == MED)   -> len inside {[51:150]};
    (pkt_type == BIG)   -> len inside {[151:255]};

  }

  //pre-randomize


  function void pre_randomize();

    case(test_name_cls)
      
      "test_1":
        begin
          da_c.constraint_mode(0);
        end
      
      "test_2":
        begin
          sa_c.constraint_mode(0);
          //sa.rand_mode(0);
          len_c.constraint_mode(0);
        end

      default:
        $display("check");
    endcase

  endfunction 

endclass

module tb;

  sample_pkt pkt_1;
  string test_name;

  initial
    begin
      void'($value$plusargs("test=%s",test_name));
      void'($value$plusargs("test=%s",sample_pkt::test_name_cls));

      case(test_name)

        "test_1":

          begin
            pkt_1=new();
            assert(pkt_1.randomize() with {preamble==56'habab; sa inside{[100:200]};});
            pkt_1.print();
          end

        "test_2":

          begin
            pkt_1=new();
            assert(pkt_1.randomize() with {preamble==56'hbbab; da inside{[43000:44000]}; len inside {[20:110]};});
            pkt_1.print();
          end

        default:
          $display("\n check");

      endcase

    end

endmodule


