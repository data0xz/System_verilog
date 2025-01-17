module tb;

  string name="1";
  string pi="3.1415";

  int a;
  real b;

  initial
    begin

      $display("name=%0d",name); //ans: 1
      $display("name=%s",name);  //ans: 1

      /*
      $cast(a,name);
      $display("a=%0d",a);*/

      //the above isnt possible

      a=int'(name);
      $display("a=%0d",a); //ans: 49, ascii value of 1

      $display("pi=%f",pi); //ans: 3.1415

      //b=real'(pi); //not possible
      $display("pi=%f",b);

      b=int'(pi);
      $display("pi=%f",pi); ans: 3.1415





    end


endmodule 
