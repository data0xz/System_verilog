class no_dec;

  rand int i;

  virtual function void print();

    $display("i=%0d",i);

  endfunction


endclass


class no_hex extends no_dec;


  function void print();

    $display("i_h=%h",i);

  endfunction


endclass

module test;

  no_dec dec_o=new();
  no_hex hex_o=new();

  task run(no_dec arg);
    assert(arg.randomize() with {i<50;i>40;});
    arg.print;
  endtask

  initial
    begin
      run(dec_o);
      run(hex_o);
    end

endmodule


