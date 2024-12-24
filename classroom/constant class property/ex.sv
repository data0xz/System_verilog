class eth_pkt;

  const int count=2,len;

  function new(int mylen);
    len=mylen;
  endfunction


endclass

module tb;

  eth_pkt pkt_1,pkt_2;

  initial
    begin
      pkt_1=new(10);
      pkt_2=new(20);

      $display("%0d %0d",pkt_1.len,pkt_2.len);
      $display("%0d %0d",pkt_1.count,pkt_2.count);

    end

endmodule
