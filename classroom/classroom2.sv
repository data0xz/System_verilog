module tb_2;

int intA[2:0];
int intB[2:0];
int intC[];

byte b;
bit signed [7:0] a;

int p;
integer q;

initial 
 begin
  intA={2,3,4};
  intB='{3,4,5};
	intC=new[4];
	intC=intA;
  $display("%p",intA);
  $display("%p",intB);
  $display("%p",intC);
	a=-15;
	b=-15;
	$display("a=%0d b=%0d",a,b);

	p=32'h10xz;
	q=32'h10xz;
	$display("a=%b b=%b",p,q);
	$display("a=%h b=%h",p,q);

 end




endmodule
