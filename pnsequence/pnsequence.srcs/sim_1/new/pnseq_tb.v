`timescale 1ns / 1ps

module pnseq_tb();
    reg clk=0,rst=0;
    reg load_initial=0;
    reg [3:0] ldvalue;
    wire [3:0]seq;
    
    pnseq uut(.clk(clk),.rst(rst),.load_initial(load_initial),.ldvalue(ldvalue),.seq(seq));
    
    always #5 clk=~clk;
    
    initial begin
        rst=1;
        ldvalue=4'b1011;
        #10;
        rst=0;
        load_initial=1;
        #10;
        load_initial=0;
        ldvalue=4'b1011;
        
        
    end
    
    initial begin
        #200;
        $finish();
    end
endmodule
