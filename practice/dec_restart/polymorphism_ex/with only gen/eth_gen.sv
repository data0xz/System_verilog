class eth_gen;

  eth_good_pkt g_pkt;
  eth_bad_pkt  b_pkt;
  eth_ill_pkt  i_pkt;


  //method

  task gen_run();

    string test_pkt;
    int test;
    void'($value$plusargs("test=%s",test_pkt));

    repeat(5)
      begin
        case(test_pkt)
          "only_good":
            begin
              g_pkt=new();
              assert(g_pkt.randomize());
              eth_common::mb.put(g_pkt);
              g_pkt.print("good");
            end

          "only_bad":
            begin
              b_pkt=new();
              assert(b_pkt.randomize());
              eth_common::mb.put(b_pkt); 
              b_pkt.print("bad");
            end

          "only_ill":
            begin
              i_pkt=new();
              assert(i_pkt.randomize());
              eth_common::mb.put(i_pkt);
              i_pkt.print("ill");
            end

          "random_pkt":
            begin
              test=$urandom%3;
              case(test)
                0:
                  begin
                    i_pkt=new();
                    assert(i_pkt.randomize());
                    eth_common::mb.put(i_pkt);
                    i_pkt.print("ill");
                  end

                1:
                  begin
                    g_pkt=new();
                    assert(g_pkt.randomize());
                    eth_common::mb.put(g_pkt);
                    g_pkt.print("good");

                  end

                2:
                  begin
                    b_pkt=new();
                    assert(b_pkt.randomize());
                    eth_common::mb.put(b_pkt); 
                    b_pkt.print("bad");
                  end

              endcase
            end

          default:
            $display("give valid input");
        endcase

      end
  endtask


endclass