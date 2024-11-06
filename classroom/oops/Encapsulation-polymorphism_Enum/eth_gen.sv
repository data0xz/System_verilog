//eth generator , put these packets in a mail box
typedef enum bit[1:0]{
    GOOD=2'b00,
	BAD,
	ILL
}pkt_type_t;

class eth_gen;

  //generate 10 random packets of good,bad,ill

  eth_good_pkt pkt_g;
  eth_bad_pkt  pkt_b;
  eth_ill_pkt  pkt_i;

  pkt_type_t pkt_type;

  //generate packet

  task run();

    for (int i=0 ; i<10 ; i++)
      begin

        pkt_type=$urandom%3;

        case(pkt_type)

          GOOD: 
            begin
              pkt_g=new();
              assert(pkt_g.randomize());
              eth_common::gen2bfm_mb.put(pkt_g);
              $display("%s",pkt_type);
            end


          BAD:
            begin
              pkt_b=new();
              assert(pkt_b.randomize());
              eth_common::gen2bfm_mb.put(pkt_b);
              $display("%s",pkt_type);
            end


          ILL: 
            begin
              pkt_i=new();
              assert(pkt_i.randomize());
              eth_common::gen2bfm_mb.put(pkt_i);
              $display("%s",pkt_type);
            end

        endcase

      end

  endtask


endclass

