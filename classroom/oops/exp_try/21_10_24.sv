// Code your testbench here
// or browse Examples
class apb_tx;

  //properties

  rand  bit[7:0] addr;
  rand	bit[31:0] data;
  rand  logic[3:0] sel;
  rand	bit wr_rd;


  //methods
  //print

  function void print(string name);
    $display("Printing TX fields of %s",name);
    $display("\taddr=%0d",addr);
    $display("\tdata=%h",data);
    $display("\tsel=%b",sel);
    $display("\twr_rd=%0d",wr_rd);
    $display("\n");

  endfunction


  //constarints
  //addr,data,sel

  constraint addr_c
  {
    addr inside {['d200:'d250]};
  }

  constraint data_c
  {

    data inside {['d4000:'d5000]};

  }

  constraint sel_c
  {
    $onehot(sel);
  }

endclass



module top;

  apb_tx tx_1,tx_2;

  initial 
    begin

      repeat(5)
        begin
          tx_1=new();
          assert(tx_1.randomize() with {wr_rd==0;});
          tx_1.print("TX_1");
          tx_1.addr.rand_mode(0);
          assert(tx_1.randomize() with {wr_rd==1;});
          tx_1.print("TX_1");
        end

      repeat(5)
        begin
          tx_2=new();
          assert(tx_2.randomize() with {wr_rd==0;});
          tx_2.print("TX_2");
          tx_2=new();
          assert(tx_2.randomize() with {wr_rd==1;});
          tx_2.print("TX_2");
        end
    end


endmodule


