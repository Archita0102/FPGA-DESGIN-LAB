`timescale 1ns / 1ps

module dff_tb();

reg din=0,clk=0;
wire q,qbar;
integer i=0;
dff dut(din,clk,q,qbar);

always #5 clk=~clk;


initial begin
    
    din=0;
    #10;
    din=1;
    #10;
    din=0;
    #10;
    
end
initial begin
    #100;
    $finish;
end
endmodule
