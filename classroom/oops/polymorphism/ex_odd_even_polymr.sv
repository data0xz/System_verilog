// Code your testbench here
// or browse Examples
class num;
  //prop
  rand int i;

  //method
  virtual function void print();

    $display("Printing the num");

  endfunction

endclass


class even_num extends num;

  //method
  function void print();
    //super.print();
    $display("Printing the even num");
    $display("\ti=%0d",i);

  endfunction

  //constraint

  constraint num_c{

    i%2==0;
    i>0;
    i<20;
  }


endclass

class odd_num extends num;

  //method
  function void print();

    $display("Printing the odd num");
    $display("\ti=%0d",i);

  endfunction

  //constraint

  constraint num_c{

    i%2==1;
    i>0;
    i<20;
  }

endclass

module tb;

  //num n;
  odd_num o_n;
  even_num e_n;

  task run(num n_1);
    n_1.randomize();
    n_1.print;    
  endtask

  initial
    begin
      repeat(5)
        begin
          o_n=new();
          run(o_n);
        end
      
      $display("\n");
      
      repeat(5)
        begin
          e_n=new();
          run(e_n);
        end
    end



endmodule



