typedef enum bit[1:0]{
  GOOD,
  BAD,
  ILL
}pkt_type_t;

class eth_common;
  static mailbox gen2bfm_mb=new();
  static string testcase;
  static int count=15;
  
endclass

class eth_common_non_static; 
  rand  pkt_type_t pkt_type;
endclass

