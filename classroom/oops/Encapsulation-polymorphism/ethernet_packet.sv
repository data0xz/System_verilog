////////////////////// eth_pkt class/////////////////

class eth_pkt;

  static int count;
  rand bit[9:0] len;
  rand byte payload[$];

  function new();
    count++;
  endfunction

  //method:1 print

  function void print(string name="eth_pkt");

    $display(" printing %s fields",name);
    $display("\t count=%0d",count);
    $display("\t len=%0d",len);
    $display("\t payload=%p",payload);

  endfunction

  //constarint:1 len_c

  constraint len_c{
    len inside {[5:10]};
  }

  //constarint:1 payload_c

  constraint payload_c{
    payload.size() == len;
  }

endclass

//////////////good pkt inherited class /////////////

class eth_good_pkt extends eth_pkt;

  static int count_good;

  function new();
    count_good++;
  endfunction 

  function void print(string name="eth_pkt");
    super.print(name);
    $display("\t count_good=%0d",count_good);
  endfunction


endclass

//////////////bad pkt inherited class /////////////

class eth_bad_pkt extends eth_pkt;

  static int count_bad;

  function new();
    count_bad++;
  endfunction 

  function void print(string name="eth_pkt");
    super.print(name);
    $display("\t count_bad=%0d",count_bad);
  endfunction

endclass

//////////////ill  pkt inherited class /////////////

class eth_ill_pkt extends eth_pkt;

  static int count_ill;

  function new();
    count_ill++;
  endfunction 

  function void print(string name="eth_pkt");
    super.print(name);
    $display("\t count_ill=%0d",count_ill);
  endfunction

endclass

//eth generator

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

        case(pkt_type)

          0: begin
            pkt_g=new();
            assert(pkt_g.randomize());
            pkt_g.print("pkt_g");
          end


          1: begin
            pkt_b=new();
            assert(pkt_b.randomize());
            pkt_b.print("pkt_b");
          end


          2: begin
            pkt_i=new();
            assert(pkt_i.randomize());
            pkt_i.print("pkt_i");
          end

        endcase

      end

  endtask


endclass

////////////////////module//////////////

module tb;

  eth_gen pkt;

  initial 
    begin
      pkt=new();
      pkt.run();
      $display("\n");
      $display("Total packets =%0d",eth_pkt::count);
      $display("Total Good packets =%0d",eth_good_pkt::count_good);
      $display("Total Bad packets =%0d",eth_bad_pkt::count_bad);
      $display("Total Ill packets =%0d",eth_ill_pkt::count_ill);
    end


endmodule





