// Code your testbench here
// or browse Examples
module try;
  integer a,b,c;

  initial
    begin

      #4;

      fork
        #15;
        #5 a=4;
        b=6;

      join

      c=12;
    end

  initial
    begin

      $monitor("a=%0d b=%0d c=%0d at time %0t",a,b,c,$time);
      
    end


endmodule
