module tb_1;

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


module tb_2;

  integer a,b,c,d;

  initial 
    begin

      #10;
      fork

        #5; c=1;
        #5; b=0;
        #5; d=c;       


      join
    end

  //monitor

  initial 
    begin
      $monitor("At t=%0t b=%0d,c=%0d,d=%0d",$time,b,c,d);
    end


endmodule

