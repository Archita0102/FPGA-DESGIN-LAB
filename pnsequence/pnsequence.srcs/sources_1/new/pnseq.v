`timescale 1ns / 1ps

module pnseq(
    input clk,rst,
    input wire load_initial,
    input wire [3:0] ldvalue,
    output reg [3:0]seq
    );
    
    reg lfsr[3:0];
    always @(posedge clk,posedge rst)
    begin
        if(rst)
            seq<=4'b0000;
        else if(load_initial)
        begin
           
            seq <= ldvalue;
        end
        else
        begin
            seq <= {(seq[3]^seq[0]),seq[3:1]};
        end
    end
endmodule
