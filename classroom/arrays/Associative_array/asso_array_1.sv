//create an associative array with 5 random indexes from 100 to 200
//and values from 155 to 195
//then print index with values
//then print in descending order
//then in ascending order 

module tb;

int asso_arr[int];
int index;
int value;
int no_of_elements=7; //5

initial begin
 
  for(int i=0 ; i<no_of_elements ;)
	 begin
        index=$urandom_range(100,200);
        value=$urandom_range(155,195);

				if(!asso_arr.exists(index))begin
        asso_arr[index]=value;
				i++;
				end
	 end

			 foreach(asso_arr[i])
			  begin
          $display("asso_arr[%0d]=%0d",i,asso_arr[i]);
				end

       $display("%p",asso_arr);

       //note: its already printed in ascending order 
			 //lets print it in descending order 

        asso_arr.last(index);
				$display("last index=%0d with value=%0d",index,asso_arr[index]); //191
				//$display("%0d", asso_arr.last(index));//1

			  while(asso_arr.prev(index))
			  begin
				   $display("prev index=%0d with value=%0d",index,asso_arr[index]); 
				end


        $display("\n");
        //now in ascending order

        asso_arr.first(index);
				$display("first index=%0d with value=%0d",index,asso_arr[index]); //102

			  while(asso_arr.next(index))
			  begin
				   $display("next index=%0d with value=%0d",index,asso_arr[index]); 
				end




end
endmodule
