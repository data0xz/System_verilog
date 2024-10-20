`include "apb_tx.sv"

module top;

apb_tx tx; //tx is object

initial 
 begin
  tx=new();//allocating memory
	$display("\n Before Rand");
	tx.print();

	$display("\n After Rand");
  repeat(10) begin
	tx.randomize();
	tx.print();
	end

 end
endmodule
