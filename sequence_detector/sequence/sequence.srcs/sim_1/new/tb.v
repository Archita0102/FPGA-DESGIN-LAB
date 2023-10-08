module tb;



reg clk,rst,din;

wire dout;

integer i;



sequence_detector mm(clk,rst,din,dout);



always #10 clk = ~clk;



initial begin

clk = 0;

rst = 1;

#40;

rst = 0;

end



initial begin

#40

for(i=0; i<10; i=i+1) t();

end



task t;

begin

din = 1;

#20;

din = 0;

#20;

din = 0;

#20;

end

endtask



endmodule
