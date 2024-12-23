// Code your testbench here
// or browse Examples
class fifo;

  //prop
  int intQ[$];


  //methods
  function void put(input int a);

    intQ.push_back(a);    

  endfunction

  function void get(output int b);

    b=intQ.pop_front();

  endfunction


endclass


module top;

  fifo fifo_o=new();

  int num;

  initial
    begin

      repeat(5)
        begin
          num=$urandom_range(50,100);
          fifo_o.put(num);
          $display("putting num=%0d",num);
        end

      $display("\n");
      
      repeat(5)
        begin
          fifo_o.get(num);
          $display("getting the num=%0d",num);
        end
    end

endmodule
