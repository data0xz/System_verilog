class sr;

  class sr_nested;
    static int count;
    typedef int intA_t[3:0];
  endclass

endclass

module top;

  initial
    begin
      sr::sr_nested::intA_t intA2;
      foreach(intA2[i])
        intA2[i]=$urandom_range(20,50);
      $display("intA2=%p",intA2);
    end

endmodule


