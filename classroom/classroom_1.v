//check if int a matches with any element of array

module tb;

integer a;
integer intA[9:0];
integer i;

initial 
begin
  a=$urandom_range(10,20);

	for(i=0;i<10;i=i+1)
	 begin
    intA[i]=$urandom_range(10,20);
		if(intA[i]==a)
		 $display("%0dth element of array matches with a",i);
		else
		 $display("%0dth element doesn't match",i);
	 end

	 $display("\na=%0d",a);
	 $display("\nintA=%p",intA);
end
endmodule
