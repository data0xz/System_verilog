int count=10;
static int s_count=30;

function void g_print();

  $display("\n global print");

endfunction

static function void gs_print();

  $display("\n global static print");

endfunction

class ex;

  int count=20;

endclass


module top;

  ex ex_o=new();

  initial
    begin

      $display("s_count=%0d",s_count); //30

      $display("count=%0d",count); //global count =10

      $display("count=%0d",ex_o.count); //local count=20
      
      g_print();
      
      gs_print();


    end

endmodule
