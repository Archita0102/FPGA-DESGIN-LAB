`timescale 1ns / 1ps

module signedmultiplier(
    input signed [7:0] A,
    input signed [7:0] B,
    output signed [15:0] product
);

    wire signed [15:0] PP [7:0];
    wire signed [15:0] SUM;
    wire signed [15:0]SUM_1,SUM_2,SUM_3,SUM_4,SUM_5,SUM_6,SUM_7;
    wire signed [15:0] y2_1,y3_1,y4_1,y5_1,y6_1,y7_1,y8_1;
    wire signed [7:1]t;
    reg signed [15:0]x;
    wire signed [7:0]y1;
    wire signed [8:0]y2;
    wire signed [9:0]y3;
    wire signed [10:0]y4;
    wire signed [11:0]y5;
    wire signed [12:0]y6;
    wire signed [13:0]y7;
    wire signed [14:0]y8;
    wire signed [15:0]y_s;
    // Generate partial products
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin
            assign PP[i] = A & ((B[i]==1'b1) ? 8'b11111111 : 8'b00000000);
        end
    endgenerate
    
    
     assign y1 = PP[0][7:0];
     assign y2_1 = (PP[1]<<1);
     assign y2 = y2_1[8:0];
     assign y3_1 = (PP[2]<<2);
     assign y3 = y3_1[9:0];
     assign y4_1 = (PP[3]<<3);
     assign y4 = y4_1[10:0];
     assign y5_1 = (PP[4]<<4);
     assign y5 = y5_1[11:0];
     assign y6_1 = (PP[5]<<5);
     assign y6 = y6_1[12:0];
     assign y7_1 = (PP[6]<<6);
     assign y7 = y7_1[13:0];
     assign y8_1 = (PP[7]<<7);
     assign y8 = y8_1[14:0];
     assign y_s = {{1{y8_1[14]}},y8};

    always@(*)
    begin
        if(B[7]==1'b1)
        begin
            x=(~y_s)+1;
        end
        else
        begin
            x=y_s;
        end
        
    end
     
     
     
     assign SUM_1 ={{8{PP[0][7]}},y1};
     ripple r2 (.a({{7{y2_1[8]}},y2}),.b(SUM_1),.cin(1'b0),.cout(t[1]),.s(SUM_2));
     ripple r3 (.a({{6{y3_1[9]}},y3}),.b(SUM_2),.cin(t[1]),.cout(t[2]),.s(SUM_3));
     ripple r4 (.a({{5{y4_1[10]}},y4}),.b(SUM_3),.cin(t[2]),.cout(t[3]),.s(SUM_4));
     ripple r5 (.a({{4{y5_1[11]}},y5}),.b(SUM_4),.cin(t[3]),.cout(t[4]),.s(SUM_5));
     ripple r6 (.a({{3{y6_1[12]}},y6}),.b(SUM_5),.cin(t[4]),.cout(t[5]),.s(SUM_6));
     ripple r7 (.a({{2{y7_1[13]}},y7}),.b(SUM_6),.cin(t[5]),.cout(t[6]),.s(SUM_7));
     ripple r8 (.a(x),.b(SUM_7),.cin(t[6]),.cout(t[7]),.s(SUM));
    
    //assign yz={{1{y8_1[14]}},y8};
    assign product = SUM;
endmodule


