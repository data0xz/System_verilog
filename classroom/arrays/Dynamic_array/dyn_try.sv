module dyn_try;
 int da[]; //declaration
 int len;

 int sa[10]; //[0:9]

 initial
 begin
  da=new[5];
	foreach(da[i]) begin
  da[i]=i+1;
	$display("da[%0d]=%0d",i,da[i]);
	end
  $display("da=%p",da);
  
	len=da.size();
	$display("size of da=%0d",len);

  da.reverse();
  $display("da_rev=%p",da);

  da.delete();
  $display("%p",da);

  da=new[10];
	foreach(da[i]) begin
  da[i]=i+1;
	$display("da[%0d]=%0d",i,da[i]);
	end
  $display("da_new=%p",da);

  
	foreach(sa[i]) begin
  sa[i]=i+1+100;
	$display("sa[%0d]=%0d",i,sa[i]);
	end
  $display("sa_new=%p",sa);

  //copying da to sa with same data type & size

	sa=da;
  $display("sa_new=%p",sa);

	 end
endmodule
