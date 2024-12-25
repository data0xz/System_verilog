class sr;

  class sr_nested;
    static protected int count=5;

    //static method

    static function void set_count(int count_t);
      count=count_t;
    endfunction

    static function int get_count();      
      $display("count=%0d",count);
      return count;
    endfunction

  endclass

endclass

module top;

  initial
    begin
      //$display("count=%0d",sr::sr_nested::count); //cant access as its protected

      sr::sr_nested::set_count(30);
      sr::sr_nested::get_count();

    end

endmodule


