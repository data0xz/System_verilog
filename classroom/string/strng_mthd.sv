//len
module sm_1;

 string name;
 int length;

 initial 
  begin	 
	  name = "string verilog";
		length= name.len();// len method 
		$display("%0d",length);
	end

endmodule

//putc


module sm_2;

 string name;

 initial 
  begin	 
	  name = "string verilog";
		name.putc(0,"&");
		$display("%s",name);
	end

endmodule

//getc

module sm_3;

 string name;
 byte get;

 initial 
  begin	 
	  name = "system verilog";
		name.putc(6,"&");
		$display("%s",name);
		get=name.getc(6);
		$display("%s",get);
	end

endmodule

//toupper & tolower

module sm_4;

 string name,name_u,name_l;
 byte get;

 initial 
  begin	 
	  name = "system verilog";
		name.putc(6,"&");
		$display("%s",name);
		get=name.getc(6);
		$display("%s",get);
		name_u=name.toupper();
		$display("%s",name_u);
		name_l=name_u.tolower();
		$display("%s",name_l);
	end

endmodule

//substr

module sm_5;
 
  string name,name_sub;

	initial 
	 begin
	   name="string&verilog";
		 name_sub=name.substr(0,5);
		 $display("%s",name_sub);
	 end


endmodule


//insert space in string

module sm_6;

 string name;
 string name_conc;

 initial 
  begin
    name="stringverilog";
		name_conc={name.substr(0,5)," ",name.substr(6,12)};
		$display("%s",name);
		$display("%s",name_conc);


	end

endmodule

//remove a space or character

module sm_7;

 string name;
 string name_rem;

 initial 
  begin
    name="string&verilog";
		name_rem={name.substr(0,5),name.substr(7,13)};
		name_rem={name.substr(0,5),name.substr(7,name.len()-1)};
		$display("%s",name);
		$display("%s",name_rem);
	end

endmodule

//string reversal

module sm_8;

 string name,name_rev;

 initial 
  begin
	  name="verilog";
		name_rev=name;
		for(int i=0;i<name.len();i++)
		 begin
        // name_rev.putc(i,name.getc(name.len()-1-i));
         name_rev.putc(name.len()-1-i,name.getc(i)); //same only
		 end

		$display("%s",name);
		$display("%s",name_rev);

	end



endmodule
