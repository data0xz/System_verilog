// Code your testbench here
// or browse Examples

module stream;

  integer intSA[5];
  byte intSA_pkt[$];

  initial
    begin
      foreach(intSA[i])
        begin
          intSA[i]=$urandom_range(30,255);
          $display("intSA[%0d]=%0d",i,intSA[i]);
        end
      $display("\n intSA=%p",intSA);

      intSA_pkt={>>{intSA}};
      $display("intSA_pk=%p",intSA_pkt);
      
      intSA_pkt={<<8{intSA}};
      $display("intSA_pk=%p",intSA_pkt);
    end

endmodule

