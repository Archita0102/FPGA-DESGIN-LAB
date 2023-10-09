`timescale 1ns / 1ps

module sign_multiplier(
    input [7:0] A,
    input [7:0] B,
    output [15:0] PRODUCT
);

    wire [6:0] PARTIAL_PRODUCTS [6:0];
    reg [15:0] SUM;
    wire [15:0]SUM_1,SUM_2,SUM_3,SUM_4,SUM_5,SUM_6,SUM_7;
    
    // Generate partial products
    genvar i;
    generate
        for (i = 0; i < 7; i = i + 1) begin
            assign PARTIAL_PRODUCTS[i] = A[6:0] & (B[i] ? 8'b1111111 : 8'b0000000);
        end
    endgenerate

    // Sum the partial products
    assign SUM_1 = PARTIAL_PRODUCTS[0];
    assign SUM_2 = SUM_1 + (PARTIAL_PRODUCTS[1]<<1) ;
    assign SUM_3 = SUM_2 + (PARTIAL_PRODUCTS[2]<<2) ;
    assign SUM_4 = SUM_3 + (PARTIAL_PRODUCTS[3]<<3) ;
    assign SUM_5 = SUM_4 + (PARTIAL_PRODUCTS[4]<<4) ;
    assign SUM_6 = SUM_5 + (PARTIAL_PRODUCTS[5]<<5) ;
    assign SUM_7 = SUM_6 + (PARTIAL_PRODUCTS[6]<<6) ;
   // assign SUM = SUM_7 + (PARTIAL_PRODUCTS[7]<<7) ;
    
    always@(*)
    begin
    case({A[7],B[7]})
    
        2'b00 : SUM = {1'b0,SUM_7[14:0]};
        2'b01 : SUM = {1'b1,SUM_7[14:0]};
        2'b10 : SUM = {1'b1,SUM_7[14:0]};
        2'b11 : SUM = {1'b0,SUM_7[14:0]};
        
    
    
    endcase
    end
    assign PRODUCT = SUM;
endmodule

