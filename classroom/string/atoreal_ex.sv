module atoreal_ex;

 string numbers;
 integer fd;
 integer value;
 int total;
 int count;
 int arr[];

 initial
  begin
	 fd=$fopen("sample.txt","r");
	 arr=new[12];
	 while(!$feof(fd))
	 begin
			 $fgets(numbers,fd);
			 //$display("num_string=%s",numbers);
			 value=numbers.atoreal();
			 arr[count]=value;
			 //$display("num_actual_value=%0d",value);
			 total=total+value;
			 count=count+1;
	 end
	  
	 $display("%p",arr);
	 $display("\n total=%0d",total);
	 $display("\n count=%0d",count);
	 $display("\n average=%0d",total/count);
	end



endmodule


module atoreal_ex_1;

 string num;
 real val,val_1;

 initial 
  begin
	  num="1234.567";
		val=num.atoreal();
		num="4567.890";
		val_1=num.atoreal();
		val_1=val_1+val;
		$display("%f",val_1);


	end

endmodule


/*module itoa_ex;

 reg[14*4:1] number;
 string name,name_1;
 integer fd;
 int y;

 initial 
  begin
	 number='h76_65_72_69_6c_6f_67; //ascii value of verilog in hex
	 $display("%0d",number); //displays in decimal
	 $display("%s",number); //shows the string named verilog

	 //string.itoa(integer) stores ASCII decimal representation of integer into string
	 name="123"; //its a string
	 y=name.atoreal();
	 name_1.itoa(y);
	 $display("%d",name_1);
   end
endmodule */

module strng_cnv;

 string name,name_num;

 int x,y;

 initial begin

 name="sus"; //alphabet string
 name_num="123"; //number string

 $display("name=%s name_num=%s",name,name_num);
 $display("name=%d name_num=%d",name,name_num); //this doesn't show ASCII value

 //note name is a string data type , need to convert to integer , HOW ?? string.atoreal()

 x=name.atoreal();
 $display("%0d",x);


 y=name_num.atoreal();
 $display("%0d",y);

 //note: the above two difference 

 
 end

endmodule



module strng_cnv_2;

 integer num;
 string name_i,name_hex,name_oct,name_bin;
 integer fd;

 initial 
  begin
   num=7'b1110011;
	 name_i.itoa(num);
	 name_hex.hextoa(num);
	 name_oct.octtoa(num);
	 name_bin.bintoa(num);
	 $display("%s",name_i);
	 $display("%s",name_hex);
	 $display("%s",name_oct);
	 $display("%s",name_bin);
	 fd=$fopen("sample_write.txt","w");
	 $fdisplay(fd,"%s \n%s \n%s \n%s",name_i,name_hex,name_oct,name_bin);

	end


endmodule
