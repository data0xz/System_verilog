// Code your testbench here
// or browse Examples

class sample;

  static int count=2;

  static function void incr_count();
    count++;
  endfunction

endclass

module top;

  initial
    begin
      $display("count=%0d",sample::count);

      sample::incr_count();

      $display("count=%0d",sample::count);


    end

endmodule
