class sample;

  rand integer a;

  //constarint

  constraint a_c1
  {
    (50<a && a<100);
    //(a<100);
  }

  constraint a_c2
  {
    (a<20); 
  }

endclass

module tb;

  sample s_1=new();

  initial 
    begin
      s_1.a_c1.constraint_mode(0);
      assert(s_1.randomize() with {a>0;});
      $display("%p",s_1);
      
      s_1.a_c1.constraint_mode(1);
      s_1.a_c2.constraint_mode(0);
      assert(s_1.randomize() with {a>0;});
      $display("%p",s_1);
      
      s_1.a=165;
      s_1.a_c2.constraint_mode(1); //it will re introduce assertion error if (1)
      //& in assertion error def value will be last stored value i.e 165
      //if(0),it will carry randmozation according to constarints applicable
      assert(s_1.randomize() with {a>0;});
      $display("%p",s_1);

    end


endmodule

