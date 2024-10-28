module tb;

  int intA[5:2];

  initial 
    begin
      foreach(intA[i])
        begin
          intA[i]=i;
          $display("intA[%0d]=%0d",i,intA[i]);
        end
      $display("%p",intA);

    end


endmodule
