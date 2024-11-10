class eth_gen;

  bit[1:0] pkt_type;

  //instances
  eth_pkt_ill    pkt_i;
  eth_pkt_good   pkt_g;
  eth_pkt_bad    pkt_b;

  //1->bad, 2->good , 0-> ill

  task gen_run;

    repeat(10)begin

      pkt_type = $urandom_range(0,2);

      case(pkt_type)
        //ill
        0:
          begin
            pkt_i=new();
            assert(pkt_i.randomize());
            //pkt_i.print_i();
            eth_pkt_common::gen2bfm_mb.put(pkt_i);
          end

        //bad
        1:
          begin
            pkt_b=new();
            assert(pkt_b.randomize());
            //pkt_b.print_b();
            eth_pkt_common::gen2bfm_mb.put(pkt_b);
          end

        //good
        2:
          begin
            pkt_g=new();
            assert(pkt_g.randomize());
            //pkt_g.print_g();
            eth_pkt_common::gen2bfm_mb.put(pkt_g);
          end

      endcase

    end
  endtask



endclass
