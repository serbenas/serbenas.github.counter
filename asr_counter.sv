module asr_counter(inf_counter.DUT cif);

   logic clk, rst, ce,load_n,up_down,zero;
   logic [cif.width-1:0] data_load;

   assign zero = (cif.count_out == 0)? 1:0;
   
  //assigning values to facilitate using it but you can use it directly by putting name of instance of modport before variable 
   assign clk=cif.clk;
   assign rst=cif.rst;
   assign ce=cif.ce;
   assign up_down=cif.up_down;
   assign load_n=cif.load_n;
   assign data_load=cif.data_load;

   
  //to check that when reset is disabled ,load_n is high ,and ce is low then count_out will take past value
   property count_out;
      @(posedge clk) disable iff(rst) (load_n&&!ce) |=> (cif.count_out==$past(cif.count_out));
   endproperty
   
  //to check that when reset is disabled and load_n is low then count_out will take past value of data_load
   property load_count;
      @(posedge clk) disable iff(rst) (!load_n) |=> (cif.count_out==$past(data_load));
   endproperty

  //to check that when reset is disabled ,load_n is high ,ce is high ,and up_down is high then count_out will increment by one from past cycle
   property inc_count;
      @(posedge clk) disable iff(rst) (load_n&& ce&&up_down) |=> (cif.count_out==($past(cif.count_out)+1'd1));
   endproperty

   
  //to check that when reset is disabled ,load_n is high ,ce is high ,and up_down is low then count_out will decrement by one from past cycle
   property dcr_count;
     @(posedge clk) disable iff(rst) (load_n&& ce&&!up_down) |=> (cif.count_out==($past(cif.count_out)-1'd1));
   endproperty


 //to check functionality of reset process
  asr_rst:assert property (@(posedge clk) rst==1|=> cif.count_out==0 );

  prop_count_out:assert property (count_out);

  prop_load_count:assert property (load_count);

  prop_inc_count:assert property (inc_count);

  prop_dcr_count:assert property (dcr_count);

 
  cov_reset:       cover property (@(posedge clk) rst==1|=> cif.count_out==0 );
  prop_count_out:  cover property (count_out);
  prop_load_count: cover property (load_count);
  prop_inc_count:  cover property (inc_count);
  prop_dcr_count:  cover property (dcr_count);



endmodule

