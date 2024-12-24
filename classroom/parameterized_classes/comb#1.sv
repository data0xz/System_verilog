`define LIFO 13
`define FIFO 14

`define DEPTH 5

typedef string dt_t; //need to change both to either int or string 

`define PRINT_FORMAT "string" //need to change both to either int or string 


////base class parameterized /////////////

class lifo_fifo #(bit[3:0] DS_TYPE=`LIFO ,type DT=int,int DEPTH=5);
 
  //prop
  DT dtQ[$:DEPTH-1];

  //methods
  function void put(input DT a);

    dtQ.push_back(a);

  endfunction

  function void get(output DT b);

    if(DS_TYPE==`FIFO) b=dtQ.pop_front();
    if(DS_TYPE==`LIFO) b=dtQ.pop_back();
    
  endfunction
  
endclass

///extended class parameterized ////

class lifo_fifo_name #(bit[3:0] DS_TYPE=`LIFO ,type DT=int,int DEPTH=5,string NAME="INT_LIFO")  extends lifo_fifo #(.DS_TYPE(DS_TYPE),.DT(DT),.DEPTH(DEPTH));
  
  ///put method////
  
   function void put(input DT a);

     super.put(a);

    if(DS_TYPE==`FIFO)
      begin
        if(`PRINT_FORMAT=="string")
          $display("Putting %s to %s_FIFO",a,NAME);
        else if(`PRINT_FORMAT=="int")
          $display("Putting %0d to %s_FIFO",a,NAME);
      end

    if(DS_TYPE==`LIFO)
      begin
        if(`PRINT_FORMAT=="string")
          $display("Putting %s to %s_LIFO",a,NAME);
        else if(`PRINT_FORMAT=="int")
          $display("Putting %0d to %s_LIFO",a,NAME);
      end

  endfunction

  
  ////get method ////
  
    function void get(output DT b);

      super.get(b);

    if(DS_TYPE==`FIFO)
      begin
        if(`PRINT_FORMAT=="string")
          $display("Getting %s from %s_FIFO",b,NAME);
        else if(`PRINT_FORMAT=="int")
          $display("Getting %0d from %s_FIFO",b,NAME);
      end

    if(DS_TYPE==`LIFO)
      begin
        if(`PRINT_FORMAT=="string")
          $display("Getting %s from %s_LIFO",b,NAME);
        else if(`PRINT_FORMAT=="int")
          $display("Getting %0d from %s_LIFO",b,NAME);
      end
  endfunction
  
endclass

module top;

lifo_fifo_name #(.DS_TYPE(`FIFO),.DT(dt_t),.DEPTH(`DEPTH),.NAME(`PRINT_FORMAT))  lifo_fifo_name_o=new();

  dt_t num;

  initial
    begin

      repeat(`DEPTH)
        begin
          if(`PRINT_FORMAT=="string")
            num = $sformatf("name%0d",$urandom_range(50,300));
          else
            num = $urandom_range(50,300);

          lifo_fifo_name_o.put(num);
          //$display("putting num=%0d",num);
        end

      $display("\n");

      repeat(`DEPTH)
        begin
          lifo_fifo_name_o.get(num);
          //$display("getting the num=%0d",num);
        end
    end

endmodule

