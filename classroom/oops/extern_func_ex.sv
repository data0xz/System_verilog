// Code your testbench here
// or browse Examples
class ethernet_packet;

  //properties
  rand bit[55:0] preamble;
  rand bit[7:0]  sfd;
  rand bit[47:0] da;
  rand bit[47:0] sa;
  rand bit[15:0] len;
  rand byte      data[]; //note its a dyn_array
  rand bit[31:0] crc;
  static int     count;


  //methods

  extern function new();
  extern function void pre_randomize();
  extern function void print();

   /*extern function void copy(output ethernet_packet pkt);
      extern function bit  compare(ethernet_packet pkt);
      extern function void pack(output byte byteQ[$]);
      extern function void unpack(byteQ[$]);*/

  //constraints

  constraint len_data_c{
    len inside {[5:10]};
    data.size == len;
  }


endclass
    

   function ethernet_packet::new();
     {preamble,sfd}={{28{2'b10}},8'hab};      
   endfunction

   function void ethernet_packet::pre_randomize();
     preamble.rand_mode(0);
     sfd.rand_mode(0);
   endfunction

   function void ethernet_packet::print();
     $display("\t preamble=%h",preamble);
     $display("\t sfd=%h",sfd);
     $display("\t da=%0d",da);
     $display("\t sa=%0d",sa);
     $display("\t len=%0d",len);
     foreach(data[i])
      $display("\t data[%0d]=%0d",i,data[i]);
     $display("%p",data);
   endfunction
    
    function void ethernet_packet::copy(output ethernet_packet pkt);
      pkt=new();
			pkt.preamble=this.preamble;
			pkt.sfd=this.sfd;
			pkt.da=this.da;
			pkt.sa=this.sa;
			pkt.len=this.len;
			pkt.crc=this.crc;
      pkt.data=this.data;
		endfunction
    
    

   module top;
     ethernet_packet pkt_1,pkt_2;
     initial
       begin  
         
         //randomize
         
         pkt_1=new();
         assert(pkt_1.randomize());
         pkt_1.print();  
         
         pkt_2=new();
         assert(pkt_2.randomize());
         pkt_2.print();  
         
         //copy
         //note: pckts are of variable length len
				 $display("pkt_1=%p",pkt_1);
				 $display("pkt_2=%p",pkt_2);
         
       end
   endmodule


