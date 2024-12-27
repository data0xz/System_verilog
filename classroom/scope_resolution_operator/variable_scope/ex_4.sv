int count=10;

function void print();

  $display("\n global print");

endfunction

class ex;

  static function void print();

    $display("\n static class print");

  endfunction

endclass


module top;

  function void print();

    $display("\n module print");

  endfunction

  initial
    begin

      print();

      $unit::print();

      ex::print();

      top_sub.print();

      $display("\ntop_sub.L1.count=%0d",top_sub.L1.count); //$root could be used as well too but its redundant

      $display("\ntop_sub.L2.count=%0d",$root.top_sub.L2.count);

    end

endmodule


module top_sub;

  function void print();

    $display("\n submodeule print");

  endfunction

  initial
    begin :L1

      int count=100;

    end

  initial
    begin :L2

      int count=200;

    end

endmodule
