module monitor_counter(inf_counter.MONITOR vmon);


 //assigning values to facilitate using it but you can use it directly by putting name of instance of modport before variable 
  assign clk=vmon.clk;
  assign count_out=vmon.count_out;
  assign rst=vmon.rst;
  assign ce=vmon.ce;
  assign up_down=vmon.up_down;
  assign load_n=vmon.load_n;
  assign data_load=vmon.data_load;


 initial begin
  $monitor("rst= %b , clk= %b , data_load =%b ,count_out=%b",rst,clk,data_load,count_out);
 end
endmodule