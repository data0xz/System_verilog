                         //Dynamic casting examples

                    //use +define+EX_MACRO_X in Run options 

`ifdef EX_MACRO_1

/*Assigning child class handle to parent class handle */

class parent_class;
  bit [31:0] addr;
  function display(string name);
    $display("Printing %s fields",name);
    $display("\t Addr = %0d",addr);
  endfunction
endclass

class child_class extends parent_class;
  bit [31:0] data;
  function display(string name);
    $display("\n");
    $display("Printing %s fields",name);
    super.display("p");
    $display("\t Data = %0d",data);
  endfunction
endclass

module inheritence;
  initial begin
    parent_class p=new();
    child_class  c=new();
    c.addr = 10;
    c.data = 20;

    p.display("p");
    c.display("c");

    $display("\n After assigning child class handle to parent class handle ");

    p = c;        
    p.display("p");

  end
endmodule





`elsif  EX_MACRO_2


/*Assigning  parent class handle to child class handle illegal though */

class parent_class;
  bit [31:0] addr;
  function display(string name);
    $display("Printing %s fields",name);
    $display("\t Addr = %0d",addr);
  endfunction
endclass

class child_class extends parent_class;
  bit [31:0] data;
  function display(string name);
    $display("\n");
    $display("Printing %s fields",name);
    super.display("p");
    $display("\t Data = %0d",data);
  endfunction
endclass

module inheritence;
  initial begin
    parent_class p=new();
    child_class  c=new();
    p.addr = 10;
    c.addr = 30;
    c.data = 20;

    p.display("p");
    c.display("c");

    $display("\n After assigning parent class handle to child class handle ");

    c = p;  //it will throw error 
    c.display("c");

  end
endmodule







`elsif  EX_MACRO_3


/*Assigning child class handle to parent class handle & then assigning that to another child class logically correct but will throw error  */

class parent_class;
  bit [31:0] addr;
  function display(string name);
    $display("Printing %s fields",name);
    $display("\t Addr = %0d",addr);
  endfunction
endclass

class child_class extends parent_class;
  bit [31:0] data;
  function display(string name);
    $display("\n");
    $display("Printing %s fields",name);
    super.display("p");
    $display("\t Data = %0d",data);
  endfunction
endclass

module inheritence;
  initial begin
    parent_class p=new();
    child_class  c=new(),c1;
    p.addr = 10;
    c.addr = 30;
    c.data = 20;

    p.display("p");
    c.display("c");

    $display("\n After assigning parent class handle to child class handle ");

    p = c;  //possible
    p.display("p");
    
    c1=p; //it's valid but it  will also throw error use $cast
    c1.display("c1");

  end
endmodule







`elsif  EX_MACRO_4


/*Assigning child class handle to parent class handle & then assigning that to another child class logically correct but will throw error, hence USE $CAST */

class parent_class;
  bit [31:0] addr;
  function display(string name);
    $display("Printing %s fields",name);
    $display("\t Addr = %0d",addr);
  endfunction
endclass

class child_class extends parent_class;
  bit [31:0] data;
  function display(string name);
    $display("\n");
    $display("Printing %s fields",name);
    super.display("p");
    $display("\t Data = %0d",data);
  endfunction
endclass

module inheritence;
  initial begin
    parent_class p=new();
    child_class  c=new(),c1;
    p.addr = 10;
    c.addr = 30;
    c.data = 20;

    p.display("p");
    c.display("c");

    $display("\n After assigning parent class handle to child class handle ");

    p = c;  //possible
    p.display("p");
    
    $cast(c1,p); 
    c1.display("c1");

  end
endmodule

`endif


