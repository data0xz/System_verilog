//defined a userdefined data type named apb_tx
class apb_tx;

 //properties
 //methods
 //constarints

 //properties
 rand bit[7:0] addr;
 rand bit[15:0] data;
 rand bit wr_rd;
 rand bit[3:0] sel;

 constraint sel_c{
   sel inside{4'h1,4'h2,4'h4,4'h8};
 }

endclass

module top;

apb_tx tx; //instantiation of class

initial 
 begin
  tx=new(); //memory allocation
	tx.randomize();
	$display("\n");
	$display("%p",tx);
	$display("\n");
 end
endmodule
