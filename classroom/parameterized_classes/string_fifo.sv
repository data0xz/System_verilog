`define LIFO 13
`define FIFO 14

`define DEPTH 5

typedef string dt_t;

class lifo_fifo #(bit[3:0] DS_TYPE=`LIFO ,type DT=int,int DEPTH=5,string NAME="INT_LIFO");
  //prop
  DT dtQ[$:DEPTH-1];


  //methods
  function void put(input DT a);

    dtQ.push_back(a);
    $display("putting %s into %s",a,NAME);

  endfunction

  function void get(output DT b);

    if(DS_TYPE==`FIFO) b=dtQ.pop_front();
    if(DS_TYPE==`LIFO) b=dtQ.pop_back();
    $display("Getting %s from %s",b,NAME);

  endfunction


endclass


module top;

  lifo_fifo #(.DS_TYPE(`FIFO),.DT(dt_t),.DEPTH(`DEPTH),.NAME("STRING_FIFO")) lifo_fifo_o=new();

  dt_t num;

  initial
    begin

      repeat(`DEPTH)
        begin
          num = $sformatf("name%0d",$urandom_range(50,300));
          lifo_fifo_o.put(num);
          //$display("putting num=%0d",num);
        end

      $display("\n");

      repeat(`DEPTH)
        begin
          lifo_fifo_o.get(num);
          //$display("getting the num=%0d",num);
        end
    end

endmodule
