// Code your testbench here
// or browse Examples

module tb;

  integer a,b,c,d;

  initial 
    begin 
      
      fork
        #10;
        #5 c=1;
        #5 b=0;
        #5 d=c;
      join
      //$monitor("At t=%0t b=%0d,c=%0d,d=%0d",$time,b,c,d);
    end

  initial 
    begin
      $monitor("At t=%0t b=%0d,c=%0d,d=%0d",$time,b,c,d);
    end


endmodule
