// Code your testbench here
// or browse Examples
module nested_frk;

  integer a,b,c,d,e;

  initial
    begin

      fork : top_fork

        begin

          #10;
          $display("%0t #print1",$time);

        end

        begin

          fork:low_fork

            #15;
            $display("%0t #print2",$time);
            #3 $display("%0t #print3",$time);

          join
          
          $display("i came out at %0t",$time);
          
        end

        begin

          #5;
          $display("%0t #print4",$time);

        end

      join_any
      
      #11;
      $display("%0t #print5",$time);
      

    end

endmodule
