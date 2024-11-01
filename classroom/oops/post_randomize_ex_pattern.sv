// Code your testbench here
// or browse Examples
class sample;

  rand bit a;
  static bit count;
  
  function void post_randomize();
   // a inside {1'b1}; //inline constraint can'be be given here 
    if(a==1 && count%2==0) a=~a;    
  endfunction
  
  function new();
    count++;
  endfunction

endclass

module tb;

  sample pkt;

  initial 
    begin
      repeat(6)
        begin       
          pkt=new();
          assert(pkt.randomize() with {a==1;});
          $display("%p",pkt);
        end
    end

endmodule
