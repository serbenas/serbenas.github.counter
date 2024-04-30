interface inf_counter(clk);

  parameter width = 4;
  input bit clk;


  logic [width-1:0] data_load,count_out;
  logic rst,load_n,ce,up_down,max_count,zero;
 //modports
 modport DUT( input rst,ce,up_down,clk,load_n,data_load,output count_out);
 modport TEST( input count_out,clk,output  rst,ce,up_down,load_n,data_load);
 modport MONITOR( input rst,ce,up_down,clk,load_n,data_load,count_out);

 endinterface 






