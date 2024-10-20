//50 students and 10 subjects
module tb_1;

int marks[49:0][9:0]; //50 students and 10 subjects
int sub_5[49:0]; //5th subject
int exam_no=5; //(0,10)

initial 
 begin
   for(int i=0;i<50;i++)
	  begin
      for(int j=0;j<10;j++)
			 begin
          marks[i][j]=$urandom_range(50,100);
			 end
    $display("student %0d marks=%p",i,marks[i]);
		end

 for(int i=0;i<50;i++)
	  begin
      $display("%p",marks[i][exam_no]);
			sub_5[i]=marks[i][exam_no];
	  end
 $display("%p",sub_5);
end
endmodule

//inserting element inn dynamic array using queue

module tb_2;

int da[];

initial 
 begin


 end



endmodule
