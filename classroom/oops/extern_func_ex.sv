// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
class eth_pkt;

  //properties
  rand bit[55:0] preamble;
  rand bit[7:0]  sfd;
  rand bit[47:0] da;
  rand bit[47:0] sa;
  rand bit[15:0] len;
  rand byte  data[]; //note its a dyn_array
  rand bit[31:0] crc;
  static int     count;


  //methods

  extern function new();
    extern function void pre_randomize();
      extern function void print();
        extern function void copy(output eth_pkt pkt);
          extern function bit  compare(eth_pkt pkt);
            extern function void pack(output byte byteQ[$]);
              extern function void unpack(byte byteQ[$]);

                //constraints

                constraint len_data_c{
                  data.size() == len;
                  len inside {[5:10]};
                }
endclass

                //new
                function eth_pkt::new();
                  {preamble,sfd}={{28{2'b10}},8'hab};  
                  count++;
                endfunction

                //pre_randomize
                function void eth_pkt::pre_randomize();
                  preamble.rand_mode(0);
                  sfd.rand_mode(0);
                endfunction

                //print
                function void eth_pkt::print();
                  $display("\t preamble=%h",preamble);
                  $display("\t sfd=%h",sfd);
                  $display("\t da=%0d",da);
                  $display("\t sa=%0d",sa);
                  $display("\t len=%0d",len);
                  foreach(data[i])
                    $display("\t data[%0d]=%0d",i,data[i]);
                  $display("%p",data);
                endfunction

                //copy
                function void eth_pkt::copy(output eth_pkt pkt);
                  pkt=new();
                  pkt.preamble=this.preamble;
                  pkt.sfd=this.sfd;
                  pkt.da=this.da;
                  pkt.sa=this.sa;
                  pkt.len=this.len;
                  pkt.crc=this.crc;
                  pkt.data=this.data;
                endfunction

                //compare
                function bit  eth_pkt::compare(eth_pkt pkt);

                  bit compare_flag = 1'b1;

                  if(this.preamble != pkt.preamble) compare_flag=1'b0;
                  if(this.sfd!= pkt.sfd) compare_flag=1'b0;
                  if(this.da != pkt.da) compare_flag=1'b0;
                  if(this.sa != pkt.sa) compare_flag=1'b0;
                  if(this.len != pkt.len) compare_flag=1'b0;
                  if(this.data != pkt.data) compare_flag=1'b0;
                  if(this.crc != pkt.crc) compare_flag=1'b0;

                  return compare_flag;

                endfunction

                //pack

                function void eth_pkt::pack(output byte byteQ[$]);
                  byteQ={>>byte{preamble,sfd,da,sa,len,data,crc,count}};
                endfunction

                //unpack

                function void eth_pkt::unpack(byte byteQ[$]);
                  {>>byte{preamble,sfd,da,sa,len,data,crc,count}}=byteQ;
                endfunction



                module top;
                  eth_pkt pkt_1,pkt_2,pkt_3;
                  byte eth_byte_q[$];
                  initial
                    begin  

                      //randomize

                      pkt_1=new();
                      assert(pkt_1.randomize());
                      pkt_1.print();  

                      pkt_2=new();
                      assert(pkt_2.randomize());
                      pkt_2.print();  

                      
                      //note: pckts are of variable length len
                      $display("pkt_1=%p",pkt_1);
                      $display("pkt_2=%p",pkt_2);
                      
                      //copy
                      pkt_2.copy(pkt_1);
                      $display("pkt_1=%p",pkt_1);
                      $display("pkt_2=%p",pkt_2);

                      assert(pkt_2.compare(pkt_1));

                      //changing one of the data of pkt_2
                      $root.top.pkt_2.data[8]=-59;
                      $display("\npkt_2=%p",pkt_2);
                      //assert(pkt_2.compare(pkt_1));

                      pkt_2.copy(pkt_1);
                      assert(pkt_2.compare(pkt_1));

                      //pack
                      pkt_2.pack(eth_byte_q);
                      $display("eth_byte_q=%p",eth_byte_q);

                      //unpack
                      pkt_3=new();
                      pkt_3.unpack(eth_byte_q); 
                      $display("pkt_3=%p",pkt_3);


                      assert(pkt_3.compare(pkt_2)); 

                    end
                endmodule








