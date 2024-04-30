module top_counter();

  bit clk;
 //clock initialization
    initial begin
       clk = 0;
       forever
          #1 clk = ~clk;
    end
	
 //instansiation for modules 	
   inf_counter        inf_ins(clk);
   counter            cntr_ins(inf_ins);
   tb_counter         tb_ins(inf_ins);
   monitor_counter    mon_ins(inf_ins);
 
 //binding assertions command
 bind counter asr_counter d1(cif);


endmodule 