class sample_pkt;

  rand int count_0;  
  constraint c_0{
    count_0   inside {[1200:1300]};  
  }

endclass

class my_pkt;

  rand int count;
  rand int count_1;
  rand sample_pkt sp=new();

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
    $display("\t pkt.sp=%p",pkt.sp); 
  endfunction
  
  //3 levels of deep copy

  function sample copy();

    sample s;
    
    s=new this; //level 1
    s.pkt=new this.pkt; //level 2
    s.pkt.sp=new this.pkt.sp; //level 3
    return s;

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
          mbox.put(s1.copy());
        end

      repeat(4)
        begin
          mbox.get(s2);
          s2.print("s2");
          $display("\n");
        end

    end


endmodule
