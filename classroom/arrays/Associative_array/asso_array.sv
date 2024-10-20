module asso_array;

 int aa[int];
 int count;
 int index;

 initial
  begin
   aa[5]=6;
	 aa[12]=13;
   aa[995]=14;
	 aa[1002]=1003;

	 //array methods
	 count=aa.num();
	 $display("%0d",count);

	 aa.first(index);
	 $display("%0d",index);

	 aa.last(index);
	 $display("%0d",index);

   index=12;

	 aa.next(index);
	 $display("%0d",index);


	 aa.prev(index);
	 $display("%0d",index);


	end
endmodule


//asso array assignment where indices might get repeated/////

module tb_1;

 reg[8:0] bitvecAA[integer];
 integer index;
 reg[8:0] data;

 initial 
  begin
    for(int i=0 ; i <10 ; i++)
		  begin
        index=$urandom_range(10,40);
        data=$urandom_range(50,90);
        bitvecAA[index]=data;
			end
     $display("%p",bitvecAA);
	end

endmodule


//asso array assignment where indices are non repeated/////

module tb_2;

 reg[8:0] bitvecAA[integer];
 integer index;
 reg[8:0] data;
 reg[8:0] value_DA[];
 integer  index_DA[];

 reg[8:0] value_SA[9:0]; //[0:9]
 integer  index_SA[9:0]; //[0:9]

 reg[8:0] valueQ[$];
 integer  indexQ[$];

 int count;
 initial 
  begin
    for(int i=0 ; i <10 ;)
		  begin
        index=$urandom_range(10,40);
        data=$urandom_range(50,90);

				if(!bitvecAA.exists(index))
				 begin
             bitvecAA[index]=data;
						 i=i+1;
			   end
			 end

	     foreach(bitvecAA[i])begin
          $display("bitvecAA[%0d]=%0d",i,bitvecAA[i]);
			 end

       $display("bitvecAA=%p",bitvecAA);

			 /*bitvecAA.reverse(); ///there is no method as such for associative array
       $display("%p",bitvecAA);*/

			 ///copy AA to DA

       value_DA=new[bitvecAA.num()]; //new[10]=new[0:9]
			 index_DA=new[bitvecAA.num()]; //new[10]=new[0:9]

       count=0;
       foreach(bitvecAA[i])begin
			    index_DA[count]=i;
					value_DA[count]=bitvecAA[i];
					count++;
			 end

        $display("index_DA=%p",index_DA);
        $display("value_DA=%p",value_DA);

			 ///copy AA to SA

       count=0;
       foreach(bitvecAA[i])begin
			    index_SA[count]=i;
					value_SA[count]=bitvecAA[i];
					count++;
			 end

        $display("index_SA=%p",index_SA);
        $display("value_SA=%p",value_SA);

       ///copy AA to Queue

       foreach(bitvecAA[i])begin
          indexQ.push_back(i);
					valueQ.push_back(bitvecAA[i]);
        end

				$display("indexQ=%p",indexQ);
				$display("valueQ=%p",valueQ);
	end

endmodule
