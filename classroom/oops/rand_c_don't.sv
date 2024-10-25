class sample;

  randc bit[2:0] a;

endclass

module tb;

  sample s;
  

  initial 
    begin    
      repeat(8)
        begin
          s=new(); //don't do
          assert(s.randomize());
          $display("%p",s);
        end
    end


endmodule
