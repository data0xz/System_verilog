// Code your testbench here
// or browse Examples
class base;

  function new(input int  a);

    $display("\nbase class constructor");

  endfunction

endclass

class child extends base;

  function new();
    
     super.new(10);
    $display("\nchild class constructor");
   
  endfunction

endclass

module top;
  child c;

  initial
    begin
      c=new();   
    end
endmodule
