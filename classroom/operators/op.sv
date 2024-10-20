module op;

 //set memebership operator 

 int a[4:0];
 int b[4:0];

 int c=$urandom_range(12,14);
 int flag_match;

initial 
 begin
 foreach(a[i])
  begin
   a[i]=$urandom_range(40,50);
	 if(c==a[i]) flag_match=1;
	 else flag_match=0;
	end

 foreach(b[i])
  begin
   b[i]=$urandom_range(10,20);
	 if(c==b[i]) flag_match=2;
	 else flag_match=0;
	end

 $display("a=%p b=%p",a,b);
 $display("c=%0d flag_match=%0d",c,flag_match);

 //using set membership

 flag_match=(c inside {a,b})?3:0;
 $display("c=%0d flag_match=%0d",c,flag_match);


end

endmodule
