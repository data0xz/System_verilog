module da_ex;

 bit[7:0] da_1[];
 bit[7:0] da_2[];

 initial
  begin
    da_1=new[9];
		da_2=new[4];
		disp();

		foreach(da_1[i])
		 da_1[i]=$urandom_range(20,30);
		foreach(da_2[i])
		 da_2[i]=$urandom_range(40,50);

		 disp();

		 da_2=da_1;
		 disp();

	end

task disp();
    $display("\n");
		$display("da_1=%p",da_1);
		$display("da_2=%p",da_2);
endtask

endmodule
