//class methods copy , compare etc

class apb_tx;

  //class properties

  rand bit[31:0] data;
  rand bit[15:0] address;
  rand bit[3:0] sel;
  rand bit wr_rd;

  //class methods

  //1.//print//

  function void print(string tx_name);
    $display("Displaying %s properties",tx_name);
    $display("\t data=(%d)d",data);
    $display("\t address=0x(%h)h",address);
    $display("\t sel=(%b)b",sel);
    $display("\t wr_rd=%d",wr_rd);
  endfunction
  
  //2.//compare
  
  function bit compare(apb_tx tx);
    if(data==tx.data && address==tx.address && sel==tx.sel && wr_rd==tx.wr_rd)
      return 1;
    else
      return 0;
  endfunction
  
  //3.//deep copy
  
  function apb_tx copy();
    apb_tx tx;
    tx=new();
    tx.data=data;
    tx.address=address;
    tx.sel=sel;
    tx.wr_rd=wr_rd;
    return tx;
  endfunction

  //class constraints

  constraint sel_c
  {
    $onehot(sel);
  }

endclass


module tb;

  apb_tx tx_1=new(),tx_2=new();

  initial 
    begin
      tx_1.randomize();
      tx_2.randomize();
      repeat(5)
        begin
          tx_1.print("TX_1");
          tx_2.print("TX_2");
        end
      $display("%p",tx_1);
      $display("%p",tx_2);
      $display("comp=%d before copy",tx_1.compare(tx_2));
      
      //shallow copy (copy by handle)
      
      tx_1=tx_2;
      $display("comp=%d after copy",tx_1.compare(tx_2));
      $display("comp=%d after copy",tx_2.compare(tx_1));
      
      tx_1.address=16'h7f;
      $display("%p",tx_1);
      $display("%p",tx_2);
      
      //in the above copy both point to same address
      
      //create diff memlocations
      tx_1=new tx_2;
      $display("comp=%d after copy",tx_1.compare(tx_2));
      $display("comp=%d after copy",tx_2.compare(tx_1));
      
      tx_1.address=16'hff;
      $display("%p",tx_1);
      $display("%p",tx_2);
      $display("comp=%d after copy",tx_1.compare(tx_2));
      
      //deep copy //copying contents of tx_1 to tx_2
      tx_1=tx_2.copy();
      $display("%p",tx_1);
      $display("%p",tx_2);
      $display("comp=%d after copy",tx_1.compare(tx_2));
      
      
      
    end
endmodule

