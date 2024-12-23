`define LIFO 13
`define FIFO 14

class lifo_fifo #(bit[3:0] DS_TYPE=`LIFO ,type DT=int);

  //prop
  DT intQ[$];


  //methods
  function void put(input int a);

    intQ.push_back(a);    

  endfunction

  function void get(output int b);

    if(DS_TYPE==`FIFO) b=intQ.pop_front();
    if(DS_TYPE==`LIFO) b=intQ.pop_back();

  endfunction


endclass


module top;

  lifo_fifo #(.DS_TYPE(`LIFO),.DT(byte)) lifo_fifo_o=new();

  byte num;

  initial
    begin

      repeat(5)
        begin
          num=$urandom_range(50,300);
          lifo_fifo_o.put(num);
          $display("putting num=%0d",num);
        end

      $display("\n");

      repeat(5)
        begin
          lifo_fifo_o.get(num);
          $display("getting the num=%0d",num);
        end
    end

endmodule

