// Code your testbench here
// or browse Examples


`define SIZE_Q 3

module tb;

  int intQA[$:`SIZE_Q-1][5];

  initial
    begin

      for(int i=0;i<`SIZE_Q;i++)
        begin

          foreach(intQA[i][j])
            begin
              intQA[i][j]=$urandom_range(10,20);
              $display("intQA[%0d][%0d]=%0d",i,j,intQA[i][j]);
            end
          $display("\n");

        end

      $display("%p\n",intQA);


      //other way of displaying 
      foreach(intQA[i,j])
        $display("intQA[%0d][%0d]=%0d",i,j,intQA[i][j]);
    end

endmodule



//Q2:ARRAY of ARRAY of Integers: top array size(3),lower array size(5)


module tb_1;

  int intA[3][5];

  initial
    begin
      foreach(intA[i,j])
        begin
          intA[i][j]=i+j;
        end
      $display("%p",intA);
    end


endmodule

//Q3:ARRAY OF QUEUE OF BYTES , ARRAY SIZE=5, Q_SIZE=`SIZE_Q


module tb_2;

  byte aq[5][$:`SIZE_Q-1];

  initial
    begin
      for(int i=0;i<5;i++)
        begin
           
          for(int j=0;j<`SIZE_Q;j++)
            begin
               
              aq[i][j]=$urandom_range(250,500);
              
            end

        end

      $display("%p",aq);
    end

endmodule
