/////////////////////////////////////////////////////////////////////////
///practice for packed / unpacked array system verilog

 /*  packed: 
     -1 dimension
		 -2 dimension

   unpacked:
     -1 dimension
		 -2 dimension

   mixed packed & unpacked: 
     - multi dimension */
	
	//printing all above as packed %p

/////////////////////////////////////////////////////////////////////////

                  //////// PACKED (1D & 2D)//////////

/////////////////////////////////////////////////////////////////////////


//ex_1: packed 1 dimension

module tb_1;

 reg[3:0] packed_1; //same as vector in verilog , packed array in sv

 initial 
  begin 
    
		 packed_1=3'b111;
		 $display("%p",packed_1); //ans=7

		 #3;
		 packed_1={1'b1,1'b1,1'b1,1'b1};
		 $display("%p",packed_1); //ans=15 

	end

endmodule


//ex_2: packed 2 dimension

module tb_2;

 reg[3:0] [2:0] packed_2; 

 reg[3:0] [2:0] packed_2_check; 

 initial 
  begin 
    
		 packed_2=12'b1110_0011_0101;
		 $display("at%0tns %p",$time,packed_2); //ans={7,0,6,5}

		 #3;
		 packed_2='{'{1,1,1},'{1,1,0},'{1,0,1},'{1,0,0}};
		 $display("at%0tns %p",$time,packed_2); //ans={7,6,5,4} 

     #3;
		 packed_2={7,6,5,4};
		 $display("at%0tns %p",$time,packed_2); //ans={0,0,0,4} 

		 $display("\n");

		 #3;
		 for(int i=0; i<4; i++) //outer[3:0]
		  begin
         for(int j=0;j<3;j++) //inner[2:0]
				  begin
            packed_2[i][j]= i+j;
						$display("at%0tns packed_2[%0d][%0d]=%0d",$time,i,j,packed_2[i][j]);
					end
					$display("\n");
			end
      $display("\nat%0tns %p",$time,packed_2); //ans={5,2,5,2} or {{1,0,1},{0,1,0},{1,0,1},{0,1,0}}

     // note : but if u feed this  {{1,0,1},{0,1,0},{1,0,1},{0,1,0}} it is wrong as size would be diff

		 #4;
     packed_2_check =  {{1,0,1},{0,1,0},{1,0,1},{0,1,0}}; //wrong
		 $display("\nat%0tns %p",$time,packed_2_check); 


		 #4;
     packed_2_check =  {'{1,0,1},'{0,1,0},'{1,0,1},'{0,1,0}}; //still wrong technically without " '{ "   it means unpacked concatenation
		 $display("\nat%0tns %p",$time,packed_2_check); //but gives correct result with warning


		 #4;
     packed_2_check =  '{'{1,0,1},'{0,1,0},'{1,0,1},'{0,1,0}}; //correct
		 $display("\nat%0tns %p",$time,packed_2_check); 
	end
endmodule


/////////////////////////////////////////////////////////////////////////

                  //////// UN-PACKED (1D & 2D)//////////

/////////////////////////////////////////////////////////////////////////

//ex_1: un-packed 1 dimension

module tb_3;

 integer un_packed_1[3:0]; //same as array in verilog , packed array in sv

 initial 
  begin 
    
		 un_packed_1={10,11,12,13};
		 $display("%p",un_packed_1); //ans={10,11,12,13} //value can be assigned like this

		 for( int i=0;i<4;i++)
		  begin
       $display("un_packed_1[%0d]=%0d",i,un_packed_1[i]);
			end

		 #3;
		 $display("%p",un_packed_1); //ans='{10,11,12,13} 

	end

endmodule


//ex_2: un-packed 2 dimension

module tb_4;

 integer un_packed_1[3:0][2:0]; 

 initial 
  begin 
    
		 for( int i=0;i<4;i++)
		  begin
			  for(int j=0;j<3;j++)
			  begin
        un_packed_1[i][j]=i+j+120;
        $display("un_packed_1[%0d][%0d]=%0d",i,j,un_packed_1[i][j]);
			  end
					$display("\n");
			end

		 #3;
		 $display("%p",un_packed_1); 

	end

endmodule



/////////////////note examples////////////

module tb_ex_1;

 reg[2:0] d; //1D packed

 initial begin
	 foreach(d[i])begin
	 d[i]=i;
	 $display("d[%0d]=%0d",i,d[i]);
	 end
	 $display("%p",d);
 end

endmodule


////////////////////////////////////////////////

module tb_ex_2;

 reg[2:0] [1:0] d; //2D packed

 initial begin
	 foreach(d[i,j])begin
	 d[i][j]=i+j+3;
	 $display("d[%0d][%0d]=%0d",i,j,d[i][j]);
	 end
	 $display("%p",d);
	 #1;
	 d[2]=3; //max it can support 2 bit no as [1:0]
	 $display("%p",d);
 end

endmodule


////////////////////////////////////////////////

module tb_ex_3;

 int d[2:0]; //1D unpacked

 initial begin
	 foreach(d[i])begin
   d[i]=i;
	 $display("d[%0d]=%0d",i,d[i]);
	 end
	 $display("%p",d);
 end

endmodule


////////////////////////////////////////////////


module tb_ex_4;

 integer d[2:0][1:0]; //2D unpacked

 initial begin
	 foreach(d[i,j])begin
	 d[i][j]=i+j+120;
	 $display("d[%0d][%0d]=%0d",i,j,d[i][j]);
	 end
	 $display("%p",d);
 end

endmodule

///////////////////////////////////////////////////////

         ///pack-unpack mixed ///

//////////////////////////////////////////////////////

 module tb_ex_5;

 reg[1:0] d[2:0]; //2D mixed

 initial begin
	 foreach(d[i,j])begin
	 d[i][j]=i+j;
	 $display("d[%0d][%0d]=%0d",i,j,d[i][j]);
	 end
	 $display("%p",d);
 end

endmodule

///////////////////////////////////////////////////////


 module tb_ex_6;

 reg[2:0] [1:0] d[2:0]; //3D mixed

 initial begin
	 foreach(d[i,j])begin
	 d[i][j]=i+j;
	 $display("d[%0d][%0d]=%0d",i,j,d[i][j]);
	 end
	 $display("%p",d);
 end

endmodule

///////////////////////////////////////////////////////


module chck;

 reg[2:0][2:0] d[2:0][1:0];

 initial 
  begin
   foreach(d[i,j,k])begin

      d[i][j][k]=i+j+k;


	 end
 $display("%p",d);
	end




endmodule
