typedef enum bit[1:0]{  
  GOOD,
  BAD,
  ILL 
}pkt_type_t;


module tb;

  pkt_type_t pkt_type;
  int a;

  initial
    begin
      pkt_type=ILL;
      a=int'(pkt_type);

      $display("a=%0d",a);
      
      a=1;
      pkt_type=pkt_type_t'(a);      
      $display("pkt_type=%s",pkt_type);
      
      a=2;
      $cast(pkt_type,a);
      $display("pkt_type=%s",pkt_type);
      
      
    end

endmodule


