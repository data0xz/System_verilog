int count=40;

class sample;
  static int count =   30;
         int count_1 = 31;
endclass

module tb;
  
  int count =20;
  sample s;
  
  initial
    begin
      : L1
      int count=10;
      
      $display("\t %0d", count); //ans:10 L1 , closest
      $display("\t %0d", tb.count); //ans:20
      $display("\t %0d", sample::count); //ans:30 (static without new)
      $display("\t %0d", s.count); //ans:30 (static without new)
      //$display("\t %0d", s.count_1); //not possible without new
      $display("\t %0d", $unit::count); //ans:40 (global scope)
      
      $display("\n");
      
      s=new();
      $display("\t %0d", s.count_1); //can't declare without new 
      
      //using $root
      $display("\t %0d", $root.tb.count); //ans:20
      $display("\t %0d", $root.tb.L1.count); //ans:10
      
      //this doesn't work , $root only for module scope
      //$display("\t %0d", $root.s.count_1);
      
      
      
    end
  
endmodule
