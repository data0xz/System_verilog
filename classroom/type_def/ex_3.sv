class eth_pkt;

  rand bit[2:0] sfd;
  rand bit[4:0] len;

endclass


module tb;

  typedef eth_pkt pktQ_t[$];
  //eth_pkt pkt_1;

  pktQ_t AQ[5];

  initial
    begin

      foreach(AQ[i])
        begin
          for(int j=0;j<3;j++)
            begin
              //pkt_1=new();
              //pkt_1.randomize();
              
              AQ[i][j]=new();
              assert(AQ[i][j].randomize());
              AQ[i].push_back(AQ[i][j]);
              $display("AQ[%0d][%0d]=%p",i,j,AQ[i][j]);
              
            end
        end

      $display("AQ=%p",AQ);
    end

endmodule

module tb_1;
  
  eth_pkt pktQ[5][$];
  
  eth_pkt pkt_2;
  
  initial
    begin

      foreach(pktQ[i])
        begin
          for(int j=0;j<3;j++)
            begin
              pkt_2=new();
              pkt_2.randomize();
              pktQ[i].push_back(pkt_2);
              $display("pktQ[%0d][%0d]=%p",i,j,pktQ[i][j]);
            end
        end

      $display("pktQ=%p",pktQ);
    end
  
  
  
endmodule


