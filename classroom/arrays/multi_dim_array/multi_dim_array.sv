//multi dimensional array 

module tb_1;

int d[1:0][3:0];

initial 
 begin
  for(int i=0;i<2;i++)
	 begin
     for(int j=0;j<4;j++)
		  begin
         d[i][j]=i+j;
				 $display("d[%0d][%0d]=%0d",i,j,d[i][j]);
			end
	 end
	 
	 $display("%p",d);
 end


endmodule


module tb_2;

int d[1:0][0:3];

initial 
 begin
  for(int i=0;i<2;i++)
	 begin
     for(int j=0;j<4;j++)
		  begin
         d[i][j]=i+j;
				 $display("d[%0d][%0d]=%0d",i,j,d[i][j]);
			end
	 end
	 
	 $display("%p",d);
 end


endmodule


module tb_3;

int d[0:1][0:3];

initial 
 begin
  for(int i=0;i<2;i++)
	 begin
     for(int j=0;j<4;j++)
		  begin
         d[i][j]=i+j;
				 $display("d[%0d][%0d]=%0d",i,j,d[i][j]);
			end
	 end
	 
	 $display("%p",d);
 end


endmodule


module tb_4;

int d[0:1][3:0];

initial 
 begin
  for(int i=0;i<2;i++)
	 begin
     for(int j=0;j<4;j++)
		  begin
         d[i][j]=i+j;
				 $display("d[%0d][%0d]=%0d",i,j,d[i][j]);
			end
	 end
	 
	 $display("%p",d);
 end


endmodule

module tb_5;

int d[0:1][0:3];

initial 
 begin
   d='{'{7,3,0,5},'{2,0,1,6}};
  for(int i=0;i<2;i++)
	 begin
     for(int j=0;j<4;j++)
		  begin
				 $display("d[%0d][%0d]=%0d",i,j,d[i][j]);
			end
	 end
	 
	 $display("%p",d);
 end


endmodule


module tb_6;

int d[0:1][0:3];

initial 
 begin
   //d='{'{7,3,0,5},'{2,0,1,6}};
   d='{2{'{7,3,0,5}}};
  for(int i=0;i<2;i++)
	 begin
     for(int j=0;j<4;j++)
		  begin
				 $display("d[%0d][%0d]=%0d",i,j,d[i][j]);
			end
	 end
	 
	 $display("%p",d);
 end


endmodule

///packed array


module tb_7;

reg[2:0] [3:0] pack;

initial 
 begin
  // pack=$urandom;
	// $display("%p",pack);
	 for(int i=0;i<3;i++)
	  begin
      for(int j=0;j<4;j++)
			 begin
         pack[i][j]=i+j;
				 $display("d[%0d][%0d]=%0d",i,j,pack[i][j]);
			 end
		end
	 $display("%p",pack);
 end
endmodule


//unpacked array 

module tb_8;

reg[2:0] unpack[3:0];

initial 
 begin
  // unpack=$urandom;
	// $display("%p",unpack);
	 for(int i=0;i<4;i++) //note: diff of i in this and prev one
	  begin
      for(int j=0;j<3;j++)
			 begin
         unpack[i][j]=i+j;
				 $display("d[%0d][%0d]=%0d",i,j,unpack[i][j]);
			 end
		end
	 $display("%p",unpack);
 end
endmodule

module tb_9;

reg[2:0] unpack[3:0];
initial 
 begin
   
	 unpack='{'{1,0,1},'{0,1,0},'{1,0,1},'{0,1,0}};


	 $display("%p",unpack);

 end




endmodule
