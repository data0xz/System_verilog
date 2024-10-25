class apb_tx;

  //properties
  rand bit [7:0] addr;
  rand bit [31:0] data;
  rand bit [3:0] sel;
  rand bit wr_rd;

  //methods

  function bit comp(apb_tx tx);
    if((addr==tx.addr)&&(data==tx.data)&&(sel==tx.sel)&&(wr_rd==tx.wr_rd))
      return 1;
    else
      return 0;
  endfunction



  //constarints



endclass

module top;

  apb_tx tx_1,tx_2,tx_3;

  initial 
    begin
      tx_1=new();
      tx_2=new();
      tx_3=new();

      assert( tx_1.randomize());
      assert( tx_2.randomize());
      assert( tx_3.randomize());
      tx_1=tx_3;
      comp_tx(tx_1,tx_2);
      comp_tx(tx_1,tx_3);

    end

  task comp_tx(apb_tx tx_x, apb_tx tx_y);

    if(tx_x.comp(tx_y))
      $display("Both transactions are same");
    else
      $display("Both transactions are different");
  endtask



endmodule

