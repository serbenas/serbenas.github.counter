
module counter (inf_counter.DUT cif);


  logic clk, rst, ce,load_n,up_down;
  logic [cif.width-1:0] data_load,count_out;

//assigning values to facilitate using it but you can use it directly by putting name of instance of modport before variable
  assign clk=cif.clk;
  assign cif.count_out=count_out;
  assign rst=cif.rst;
  assign ce=cif.ce;
  assign up_down=cif.up_down;
  assign load_n=cif.load_n;
  assign data_load=cif.data_load;


 always @(posedge clk or posedge rst) begin
      if (rst)
         count_out <= 0;
      else if (!load_n)
         count_out <= data_load;
      else if (ce)
         if (up_down)
            count_out <= count_out + 1;
         else 
            count_out <= count_out - 1;
 end

 assign max_count = (count_out == {cif.width{1'b1}})? 1:0;
 assign zero = (count_out == 0)? 1:0;

endmodule