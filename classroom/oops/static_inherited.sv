// Code your testbench here
// or browse Examples
class sample;
  
  static int a;
  int b;
  
endclass

class sample_ext extends sample;
  
  int c;
  
endclass

module top;
  
  sample s_1,s_2,s_3;
  sample_ext s_4;
  
  initial
     begin
       s_1=new();
       s_2=new();
       s_3=new();
       s_4=new();
       
       s_3.a=100;
       s_2.b=200;
       s_4.c=300;
       //s_1.c=50; //note cant access inherited class properties
       $display("s_4=%p",s_4);
       
     end
  
  
endmodule
