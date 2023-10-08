module testbench;
    reg clk=0;      // Clock input
    reg rst=0;      // Reset input (active high)
    wire [3:0] q;

   always #5 clk = ~clk;
   
   reg q_internal1[3:0];
   
   pnseq dut(clk,rst,q);
   
   initial begin
        #10 rst=1'b1;
        #10 rst=1'b0;
        #10
        q_internal1[0]=1;
        
   end
   
   assign q[0]=q_internal1[0];
endmodule




