class eth_pkt;
  rand bit[3:0] a;
endclass

module tb;

  eth_pkt pkt_1;

  eth_pkt qop[$];

  typedef eth_pkt qop_t[$];

  qop_t aoq[3];

  typedef qop_t aoq_t[3];

  aoq_t aoa[5];



  initial
    begin

      foreach(aoa[i])
        begin
          foreach(aoq[j])
            begin
              for(int k=0;k<3;k++)
                begin
                  pkt_1=new();
                  assert(pkt_1.randomize());
                  //aoq[j].push_back(pkt_1); //wrong
                  aoa[i][j].push_back(pkt_1);
                end
            end
        end

      $display("%p",aoa);
      $display("%p",aoa[0]);
      $display("%p",aoa[0][0]);
      $display("%p",aoa[0][0][0]);
    end

endmodule



