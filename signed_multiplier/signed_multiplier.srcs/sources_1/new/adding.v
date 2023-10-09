`timescale 1ns / 1ps
module adding(A,B,product,carry); 
    input signed [7:0]A,B;
    //input reset;
    output signed [15:0]product;
    output signed carry;
    wire signed [15:0]p1,p2,p3,p4,p5,p6,p7,p8,p8_1;
    wire signed [15:0]s1,s2,s3,s4,s5,s6,s7,s8;
    wire sign;

    assign p1={{8{B[7]}}&{8{A[0]}},B&{8{A[0]}}};
    assign p2={{8{B[7]}}&{8{A[1]}},B&{8{A[1]}}}<<1;
    assign p3={{8{B[7]}}&{8{A[2]}},B&{8{A[2]}}}<<2;
    assign p4={{8{B[7]}}&{8{A[3]}},B&{8{A[3]}}}<<3;
    assign p5={{8{B[7]}}&{8{A[4]}},B&{8{A[4]}}}<<4;
    assign p6={{8{B[7]}}&{8{A[5]}},B&{8{A[5]}}}<<5;
    assign p7={{8{B[7]}}&{8{A[6]}},B&{8{A[6]}}}<<6;
    assign p8={{8{B[7]}}&{8{A[7]}},B&{8{A[7]}}}<<7;
    
    assign p8_1 = (~p8)+1;
    
    ripple RA1(.a(p1),.b(p2),.cin(1'b0),.s(s1),.cout(c1)); 
    ripple RA2(.a(p3),.b(p4),.cin(1'b0),.s(s2),.cout(c2));
    ripple RA3(.a(p5),.b(p6),.cin(1'b0),.s(s3),.cout(c3));
    //subtractor RA4(.a(p7), .b(p8), .bin(1'b0),.diff(s4),.borrow(c4));
    ripple RA4(.a(p7),.b(p8_1),.cin(1'b0),.s(s4),.cout(c4));    

    ripple RA5(.a(s1),.b(s2),.cin(c1),.s(s5),.cout(c5));
    ripple RA6(.a(s3),.b(s4),.cin(c2),.s(s6),.cout(c6));
    ripple RA7(.a(s5),.b(s6),.cin(c5),.s(s7),.cout(c7));


assign product = s7;

assign carry = c7;

endmodule