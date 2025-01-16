class my_pkt;

  rand int count;
  rand int count_1;

  constraint c{
    count   inside {[200:300]};
    count_1 inside {[300:400]};   
  }

endclass


class sample;

  randc bit[1:0] a;
  randc bit[1:0] b;

  rand my_pkt pkt=new();
   
 

  //method

  function void print(string name="sample_default");
    $display("\n printing %s fields",name);
    $display("\t a=%0d",a);
    $display("\t b=%0d",b);
    $display("\t pkt=%p",pkt);   
  endfunction


endclass


module tb;

  sample s1,s2;
  mailbox mbox=new();

  initial
    begin

      s1=new();
      
      repeat(4)
        begin
          assert(s1.randomize());
          s1.print("s1");
          $display("\n");
          mbox.put(s1);
        end

      repeat(4)
        begin
          mbox.get(s2);
          s2.print("s2");
          $display("\n");
        end

    end


endmodule
