class sr;

  static int count;
  typedef int intA_t[3:0];

endclass

module top;

  initial
    begin
      sr::intA_t intA1;
      foreach(intA1[i])
        intA1[i]=$urandom_range(20,50);
      $display("intA1=%p",intA1);
    end

endmodule


