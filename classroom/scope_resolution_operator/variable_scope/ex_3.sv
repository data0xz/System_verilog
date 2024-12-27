int count=10;
static int s_count=30;

function void g_print();

  $display("\n global print");

endfunction

static function void gs_print();

  $display("\n global static print");

endfunction

class ex;

  static int count=20;

endclass


module top;

  initial
    begin
      ex::count=30;
      $display("%0d",ex::count);
    end

endmodule
