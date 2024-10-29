// Code your testbench here
// or browse Examples
class sample;
  
  randc bit a;
  
  constraint a_c
  {
    (a==1); 
  }
  
endclass

module top;
  sample s=new();
  bit count;
  
  initial
    begin
      repeat(6)
        begin
         s.a_c.constraint_mode(~count);
         assert(s.randomize());          
         $display("%0d",s.a);
         
         count++;
         $display("count=%0d",count);
        end
    end
  
endmodule
