
module tb_1;

  int a,b,c,d;

  initial 
    begin

      #10;
      fork
        #2 a=4;
        #3; b=7;
        #8 c=6;
      join_none
      d=5;
    end

  //monitor

  initial 
    begin
      $monitor("At t=%0t a=%0d,b=%0d,c=%0d,d=%0d",$time,a,b,c,d);
    end


endmodule


module tb_2;

  integer a,b,c,d;

  initial 
    begin

      #10;
      fork

        #5 c=1;
        #5 b=0;
        #5 d=c;       

      join_any
    end

  //monitor

  initial 
    begin
      $monitor("At t=%0t b=%0d,c=%0d,d=%0d",$time,b,c,d);
    end


endmodule


module tb_3;

  integer a,b,c,d;

  initial 
    begin

      #10;
      fork

        #5 c=1;
        #5 b=0;
        #5 d=c;       

      join
    end

  //monitor

  initial 
    begin
      $monitor("At t=%0t b=%0d,c=%0d,d=%0d",$time,b,c,d);
    end

endmodule



