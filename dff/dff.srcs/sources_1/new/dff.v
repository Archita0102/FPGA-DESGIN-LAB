`timescale 1ns / 1ps

module dff(
    input din,clk,
    output reg q,qbar
    );
    
    always @(posedge clk)
    begin
        q<=din;
        //qbar<=~din;
    end
endmodule