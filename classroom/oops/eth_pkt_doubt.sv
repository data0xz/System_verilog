
class eth_pkt;

  protected rand bit[47:0] da;
  protected rand bit[47:0] sa;

  //constraint

  constraint da_sa_c{

    da inside {[1200:1700]};
    sa inside {[900 :1000]};
  }

  //methods
  //print

  function void print(string name="transcation");
    $display("Displaying %s fields",name);
    $display("\t da=%0d",da);
    $display("\t sa=%0d",sa);
  endfunction

  //get_da

  function void get_da(output bit[47:0] da, input string name="test_bench");
    da=this.da;
    $display("da is given to %s, value=%0d",name,da);  
  endfunction

  //set_da

  function void set_da(bit[47:0] da, string name="test_bench");
    this.da=da;
    $display("da is updaed to %h by %s",da,name);  
  endfunction

endclass

//inherited class

class eth_pkt_ext extends eth_pkt;

  local rand bit[3:0] l_count;
  protected rand bit[3:0] p_count;
  randc bit[3:0] count;

  //get_da_inherited

  function void get_da_inherited(output bit[47:0] da, input string name="test_bench");
    da=this.da;
    $display("da is given to %s, value=%0d",name,da);  
  endfunction


endclass

module tb_1;
  eth_pkt pkt_1;//=new();
  //eth_pkt_ext pkt_1_ext=new();
  bit[47:0] value;


  initial
    begin
      pkt_1=new();
      assert(pkt_1.randomize());
      pkt_1.print("tb_1");
      $display("pkt_1=%p",pkt_1);
      //$display("da=%0d",pkt_1.da); //illegal access to proteted member
      pkt_1.get_da(value,"tb_1");


    end

endmodule 


module tb_2;
  //eth_pkt pkt_1=new();
  eth_pkt_ext pkt_1_ext;//=new();
  bit[47:0] value;

  initial
    begin  
      pkt_1_ext=new();
      assert(pkt_1_ext.randomize());
      pkt_1_ext.print("tb_2");
      $display("pkt_1_ext=%p",pkt_1_ext);
      //$display("da=%0d",pkt_1_ext.da); //illegal access to proteted member
      //note: if get method is declared within inherited class,da can be accessed
      pkt_1_ext.get_da_inherited(value,"tb_2");


    end

endmodule 
