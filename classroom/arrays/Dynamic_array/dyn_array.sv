class sample;
int count;
endclass

module tb_1;
 sample da[];
 initial 
  begin
    da=new[5];
		foreach(da[i])
		 begin
       da[i]=new();
		 end
		$display("%p",da);
	end
endmodule



//static vs dynamic print diff
//note : the printing diff of %p in static vs dynamic 

module tb_2;

 int intda[]; //dynamic
 int intda_sta[5:0]; //static

 initial 
  begin
    intda=new[6];
		//assign 5 random values to this array
		foreach(intda[i])begin
     intda[i]=i+1;
		 $display("intda[%0d]=%0d",i,intda[i]);
		end
    $display("%p",intda); //note it prints ulta intda[0:5] basis

		foreach(intda_sta[i])begin
     intda_sta[i]=i+1;
		 $display("intda_sta[%0d]=%0d",i,intda_sta[i]);
		end
    $display("%p",intda_sta);
	end


endmodule




///dynamic array methods explore


module tb_3;

 int intda[];

 initial 
  begin
    intda=new[5];
		foreach(intda[i])begin
       intda[i]=$urandom_range(10,15);
		   $display("intda[%0d]=%0d",i,intda[i]);
		end
    $display("%p",intda);

		//increase the size,while preserving existing values
		intda=new[15](intda);
		//note: upper 6 to 15 will be 0
    $display("%p",intda);

    
	end

endmodule


		//inserting a no in the dynamic array at a specific location say 3

module tb_4;

 int d[],d_1[];
 int len;

 initial 
  begin 
    d=new[10];
		foreach(d[i])
     begin

       d[i]=i;
			 $display("d[%0d]=%0d",i,d[i]);

		 end
  $display("%p",d);
	len=d.size();
	d_1=new[len+1];
	$display("len=%0d",len);
 //we want to insert 24 in position no 3 in the dynamic array d , how?
  for(int i=0 ; i<len+1;i++) begin
    if(i<3)
		 d_1[i]=d[i];
		else if(i==3)
		 d_1[i]=24;
		else
		 d_1[i]=d[i-1];
		$display("d_1[%0d]=%0d",i,d_1[i]);
	end

			 $display("%p",d_1);
	end
endmodule


		//deleting a no in the dynamic array at a specific location say 3

module tb_5;
 int da_1[];
 int len;
 int da_2[];
 int da_3[],da_4[];
 int no_of_element;


 initial 
  begin
	 da_1=new[11];
   da_1='{0,1,2,24,3,4,5,6,7,8,9};
	 //deleting 3rd element from array
	 foreach(da_1[i])
	  begin
      $display("da_1[%0d]=%0d",i,da_1[i]);
		end
   $display("%p",da_1);

	 len=da_1.size();
	 da_2=new[len-1];

  for( int i=0;i<len-1;i++)
	 begin
     if(i<3)
		   da_2[i]=da_1[i];
		 else
		 begin
		   da_2[i]=da_1[i+1];
		   if(i==3)
		   $display("deleting %0dth element=%0d ",i,da_1[i]);
		 end
		  if(i%2==0) //for printing just the even indexes
		   $display("da_2[%0d]=%0d",i,da_2[i]);
	 end
   $display("da_2=%p",da_2);

	 //reversing with method 
	 da_2.reverse(); //da_2 got reversed
   $display("da_2_rev=%p",da_2);

   $display("\n");
   $display("da_2=%p",da_2);

	 //without method
	 len=da_2.size();
   da_3=new[len];

	 for(int i =0; i<len;i++)
	  begin
      da_3[i]=da_2[len-1-i];
		end

   $display("da_3=%p",da_3);


  //copy first 6 elements from da_3

	no_of_element=6;
	da_3=new[no_of_element](da_3);
  $display("\n");
  $display("copying first %0d elements of da_3",no_of_element);
  $display("da_3_copy=%p",da_3);

	//copy last n elements from da_2

	no_of_element=4;
	da_4=new[no_of_element];


 while (no_of_element <= len)
  begin
			for(int i=0; i<no_of_element;i++)
			 begin
				da_4[i]=da_2[len-no_of_element+i];
			 end
			 break;
	end

  $display("\n");
  $display("copying last %0d elements of da_2",no_of_element);
  $display("da_4=%p",da_4);

	end
endmodule


