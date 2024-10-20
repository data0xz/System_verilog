module str1;

reg[8*6:1] name;

initial 
 begin
  name="susmit"; 
  name="susmit datta"; //name is a reg static data type in verilog , it dynamically doesn't change
	//but in sv , string data type is introduced which will dynamically change 
	$display("%s",name);
 end


endmodule
