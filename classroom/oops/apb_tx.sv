//tx class
class apb_tx;

//properties of class
rand bit wr_rd;
rand bit[7:0] addr;
rand bit[31:0] data;
rand bit[3:0] sel;

//constraints

constraint sel_con{
  sel inside {4'h1,4'h2,4'h4,4'h8};
}



//methods
//print

function void print();
 $display("tx class properties in decimal");
 $display("\twr_rd=%0d",wr_rd);
 $display("\taddr=%0d",addr);
 $display("\tdata=%0d",data);
 $display("\tsel=%0d",sel);
endfunction


endclass

/*
//gen class

class apb_gen;

 apb_tx tx_1;
 mailbox mbox;

 task run();
  tx1=new();
	tx1.randomize();
	mbox.put(tx1);

 endtask


endclass


//bfm class

class apb_bfm;

 apb_tx tx_1;
 mailbox mbox;

 task run();
  tx1=new();
	tx1.randomize();
	mbox.get(tx1);

 endtask


endclass
*/
