//eth generator , put these packets in a mail box

class eth_gen;

  //generate 10 random packets of good,bad,ill

  eth_good_pkt pkt_g;
  eth_bad_pkt  pkt_b;
  eth_ill_pkt  pkt_i;

  bit[1:0] pkt_type;

  //generate packet

  task run();

    for (int i=0 ; i<10 ; i++)
      begin

        pkt_type=$urandom_range(0,2);
        //it is assumed 0->good , 1->bad , 2->ill

        case(pkt_type)

          0: 
            begin
              pkt_g=new();
              assert(pkt_g.randomize());
              eth_common::gen2bfm_mb.put(pkt_g);
            end


          1:
            begin
              pkt_b=new();
              assert(pkt_b.randomize());
              eth_common::gen2bfm_mb.put(pkt_b);
            end


          2: 
            begin
              pkt_i=new();
              assert(pkt_i.randomize());
              eth_common::gen2bfm_mb.put(pkt_i);
            end

        endcase

      end

  endtask


endclass

