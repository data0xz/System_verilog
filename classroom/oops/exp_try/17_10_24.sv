//apb tx class definition , class properties , print method and constraints
class apb_tx;

  //properties

  rand bit[31:0] data;
  rand bit[15:0] address;
  rand bit[3:0] sel; //slave sel
  rand bit wr_rd; 



  //methods

  //print method

  function void prop_print(string comment);
    $display("\n****** Printing APB TX field=%s **************",comment);
    $display("\t data=%0d",data);
    $display("\t address=0x%hh",address);
    $display("\t sel=%0d",sel);
    $display("\t wr_rd=%0d",wr_rd);
  endfunction

  function void newline();
    repeat(1)
      $display("\n");  
  endfunction

  //copy method




  //constraints

  constraint sel_c
  {
   // sel inside {4'h1,4'h2,4'h4,4'h8}; 
	 $onehot(sel);
  }
  
  constraint addr_c
  {
    address inside {[16'h0:16'h50]};
  }
  
  constraint data_c
  {
    data inside {[16'd400:16'd800]};
  }



endclass 

module top;

  apb_tx tx_1=new(),tx_2=new();

  initial 
    begin

      repeat(3)
        begin
          tx_1.randomize();
          tx_1.prop_print("tx_1"); 
          $display("%p",tx_1);
        end

      tx_1.newline();

      repeat(3)
        begin
          tx_2.randomize() with {wr_rd==1'b1;address==16'h25;};//inline constarint
          tx_2.prop_print("tx_2");
          $display("%p",tx_2);
        end
      //tx2=tx1;

    end
endmodule

  

