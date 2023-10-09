`timescale 1ns / 1ps

module signed_multiplier_tb;
    reg [7:0] A;
    reg [7:0] B;
    wire [15:0] product;
    wire carry;

    adding uut(
        .A(A),
        .B(B),
        .product(product),
        .carry(carry)
    );

    initial begin
       
        A = -3;
        B = -3;
        #10;

        $display("A = %b", A);
        $display("B = %b", B);
        $display("Product = %b", product);

        $finish;
    end
endmodule
