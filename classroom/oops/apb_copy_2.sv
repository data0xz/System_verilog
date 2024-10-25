class apb_tx;

  //properties
  rand bit [7:0] addr;
  rand bit [31:0] data;
  rand bit [3:0] sel;
  rand bit wr_rd;


endclass

module top;

  apb_tx tx_1=new(),tx_2;

  initial
    begin
      assert(tx_1.randomize());
      tx_2=new tx_1;
      $display("tx_1=%p",tx_1);
      $display("tx_2=%p",tx_2);
      
      if(tx_1==tx_2) $display("\n comp success");
      else $display("\n comp fail");

    end

endmodule
