//static casting examples

//use +define+EX_MACRO_2 in Run options 

`ifdef EX_MACRO_1

module casting;
  
  real r_a;
  int  i_a;
  
  initial begin
    
    r_a = (2.1 * 3.2);
    
    //real to integer conversion
    i_a = int'(2.1 * 3.2); //or i_a = int'(r_a);
    
    $display("real value is %f",r_a);
    $display("int  value is %0d",i_a);
  end
endmodule

`elsif EX_MACRO_2

module casting;
  
  real r_a;
  int  i_a;
  
  initial begin
    
    r_a = (19.87 * 7.82);
    
    //real to integer conversion
    i_a = int'(r_a);
    
    $display("real value is %f",r_a);
    $display("int  value is %0d",i_a);
  end
endmodule

`endif


