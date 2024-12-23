//eth generator , put these packets in a mail box

class eth_gen;

  //generate 10 random packets of good,bad,ill

  eth_good_pkt pkt_g;
  eth_bad_pkt  pkt_b;
  eth_ill_pkt  pkt_i;

  bit[1:0] test_num;
  int num;

  //generate packet

  task run();

    case(eth_common::testcase)

      "test_random_pkts":

        begin

          for (int i=0 ; i<10 ; i++)
            begin

              test_num=$urandom_range(0,2);

              case(test_num)

                1: 
                  begin
                    pkt_g=new();
                    assert(pkt_g.randomize());
                    eth_common::gen2bfm_mb.put(pkt_g);
                  end


                2:
                  begin
                    pkt_b=new();
                    assert(pkt_b.randomize());
                    eth_common::gen2bfm_mb.put(pkt_b);
                  end


                0: 
                  begin
                    pkt_i=new();
                    assert(pkt_i.randomize());
                    eth_common::gen2bfm_mb.put(pkt_i);
                  end


              endcase

              $display("test_num=%0d",test_num);
              num++;

            end
        end

      "test_good_pkt":
        begin
          for(int i=0;i<10;i++)
            begin
              pkt_g=new();
              assert(pkt_g.randomize());
              eth_common::gen2bfm_mb.put(pkt_g);
            end
        end


      "test_bad_pkt":
        begin
          for(int i=0;i<10;i++)
            begin
              pkt_b=new();
              assert(pkt_b.randomize());
              eth_common::gen2bfm_mb.put(pkt_b);
            end
        end

      "test_ill_pkt":
        begin
          for(int i=0;i<10;i++)
            begin
              pkt_i=new();
              assert(pkt_i.randomize());
              eth_common::gen2bfm_mb.put(pkt_i);
            end
        end
      
       default:
         $display("\n check no test name passed");

    endcase
  endtask


endclass

