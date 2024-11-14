
module tb;

  integer a,b,c,d;

  initial 
    begin

      #15;
      fork      
        begin
          #2;
          a=3;
        end
        begin
          #5;
          b=4;
        end
      join
    end

  //monitor

  initial 
    begin
      $monitor("At t=%0t a=%0d,b=%0d",$time,a,b);
    end


endmodule


//note the diff of #15 outside & inside fork-join block


module tb_1;

  integer a,b,c,d;

  initial 
    begin

      fork 
        #15;
        begin
          #2;
          a=3;
        end
        begin
          #5;
          b=4;
        end
      join
    end

  //monitor

  initial 
    begin
      $monitor("At t=%0t a=%0d,b=%0d",$time,a,b);
    end


endmodule

