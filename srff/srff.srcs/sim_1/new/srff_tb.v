`timescale 1ns / 1ps

module srff_tb();

reg s,r;
reg clk=0;
wire q;

srff uut(.s(s),.r(r),.clk(clk),.q(q));


always #5 clk=~clk;


initial begin
    
    s=0;r=1;
    #10;
    s=1;r=0;
    #10;
    s=0;r=0;
    #10;
    s=1;r=1;
    #10;
    
end
initial begin
    #100;
    $finish;
end
endmodule