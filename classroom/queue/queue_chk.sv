/*///check multi dimensional queue later /////
module tb_1;

reg[2:0][3:0] bit_vecQ[$];

initial 
 begin
   //bit_vecQ={16,8,7};
	// $display("%p",bit_vecQ);
   bit_vecQ={16,8,7};
	 foreach(bit_vecQ[i,j])
	  begin
    bit_vecQ[i][j]=i+j+14;
	  $display("bit_vecQ[%0d][%0d]=%0d",i,j,bit_vecQ[i][j]);
		end
	 $display("%p",bit_vecQ);
 end
endmodule */

///1D QUEUE///
module tb_2;

 reg[2:0] bit_vecQ[$];

 //it will grow and shrink by 3 bit , lets check

 initial 
  begin
    bit_vecQ={7,8,9};
		$display("%p",bit_vecQ); //ans:'{7,0,1}
	end

endmodule


