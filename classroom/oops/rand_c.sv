class test;
//properties
 rand bit[2:0] a;
 randc bit[2:0] a_c;

endclass


module top;

 test tb_1=new();

 initial 
  begin
   $display("%p",tb_1);
	end

endmodule
