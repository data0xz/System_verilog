//1.arrays are homogeneuos while mailbox is non-homogeneous

module ex_1;

int a;
string name;
bit[2:0] bit_vec;

mailbox mbox;

initial 
 begin
  mbox=new();
	mbox.put(10);
	mbox.put("susmit");
	mbox.put(3'b110);

	mbox.get(a);
	mbox.get(name);
	mbox.get(bit_vec);
 
  $display("%0d",a);
  $display("%s",name);
  $display("%d",name); //%d prints string name
	//how to print ascii vaue of susmit ? cast?
	$display("%d",longint'("susmit"));
  $display("%0d",bit_vec);

 end

endmodule
