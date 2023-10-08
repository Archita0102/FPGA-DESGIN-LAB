`timescale 1ns / 1ps

module jkff_tb();

reg j,k;
reg clk=0;
wire q;

jkff uut(.j(j),.k(k),.clk(clk),.q(q));


always #5 clk=~clk;


initial begin
    
    j=0;k=1;
    #10;
    j=1;k=0;
    #10;
    j=1;k=1;
    #10;
    j=0;k=0;
    #10;
end
initial begin
    #100;
    $finish;
end

endmodule
