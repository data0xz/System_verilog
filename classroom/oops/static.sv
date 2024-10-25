// Code your testbench here
// or browse Examples
class sample;
  
  static int a;
  int b;
  
endclass

module top;
  
  sample s_1,s_2;
  
  initial
     begin
       s_1=new();
       s_2=new();
       s_1.a=100;
       s_1.b=200;
       s_2.b=300;
       $display("s_2.a=%0d , s_2.b=%0d",s_2.a,s_2.b);
       
     end
  
  
endmodule
