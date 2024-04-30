package my_pck;

 
  class counter_transaction;
    rand bit rst,ce,up_down,load_n;
    rand byte data_load;

  
  //constraint block 
   constraint c_dist{ 
    rst dist {0:=70,1:=30};
    load_n dist {1:=70,0:=30};
    ce dist {1:=70,0:=30};
   }

  endclass
endpackage 