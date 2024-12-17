// Code your testbench here
// or browse Examples

class apb_tx;

  //properties

  rand bit[7:0] addr;
  rand bit[31:0] data;
  rand bit[3:0]  sel;
  rand bit   wr_rd;

  //methods

  function void print(string name="default_name");
    $display("printing %s class",name);
    $display("\t addr=%h",addr);
    $display("\t data=%h",data);
    $display("\t sel=%h",sel);
    $display("\t wr_rd=%h",wr_rd);   
  endfunction 

  //constraints

  constraint sel_c{

    sel inside {4'h0,4'h1,4'h2,4'h4,4'h8};

  }

endclass


module top;

  apb_tx tx_1,tx_2;

  initial
    begin
      repeat(5)
        begin
          tx_1=new();
          tx_1.randomize();
          tx_1.print("apb tx_1");  
        end
       
      repeat(3)
        begin
          tx_2=new();
          tx_2.randomize();
          tx_2.print("apb tx_2");  
        end
    end

endmodule
