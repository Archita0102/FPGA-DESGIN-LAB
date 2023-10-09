`timescale 1ns / 1ps

module tb;
    reg [7:0] A;
    reg [7:0] B;
    wire [15:0] PRODUCT;

    multiplier_8bit uut(
        .A(A),
        .B(B),
        .PRODUCT(PRODUCT)
    );

    initial begin
       
        A = -5;
        B = -7;
        #10;

        $display("A = %b", A);
        $display("B = %b", B);
        $display("Product = %b", PRODUCT);

        $finish;
    end
endmodule
