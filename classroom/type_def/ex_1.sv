
module tb;


  typedef int intA[4];

  intA arr[10];

  initial
    begin

      foreach (arr[i])
        begin

          for(int j=0;j<4;j++)

            arr[i][j]=i+j;

        end

      $display("%p",arr);
    end


endmodule

module tb_1;

  int arr_2D[10][4];
  int i,j;

  initial
    begin

      foreach(arr_2D[i,j])
        begin

          arr_2D[i][j] = i+j;

        end
      
      $display("%p",arr_2D);
    end



endmodule
