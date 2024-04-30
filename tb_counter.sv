module tb_counter(inf_counter.TEST vt);
 
 
 //importing package command
  import my_pck ::*;
  
  
  logic clk, rst, ce,load_n,up_down;
  logic [vt.width-1:0] data_load,count_out;

 //assigning values to facilitate using it but you can use it directly by putting name of instance of modport before variable
  assign clk=vt.clk;
  assign count_out=vt.count_out;
  assign vt.rst=rst;
  assign vt.ce=ce;
  assign vt.up_down=up_down;
  assign vt.load_n=load_n;
  assign vt.data_load=data_load;
  counter_transaction cls=new;




  covergroup cov_g @(posedge clk);
     p1:coverpoint data_load;
     p2:coverpoint up_down;
     p3:coverpoint ce;
     p4:coverpoint rst;
  endgroup 
   
   
 //initialization for cover group 
  cov_g cov=new();

  
  initial begin
    repeat(1000) begin
        @(negedge clk);
		//assigning randomized values from class to test bench values
        cls.randomize();
        rst=cls.rst;
        ce=cls.ce;
        load_n=cls.load_n;
        up_down=cls.data_load;
        data_load=cls.data_load;
  end
  $stop;
 end
endmodule