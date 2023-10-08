`timescale 1ns / 1ps

//module ha(
    //input a,b,
    //output sum,carry );
    
    //assign sum=a^b;
    //assign carry=a&b;
//endmodule


module fa(
    input a,b,cin,
    output sum,cout
    );
    
    wire w1,w2,w3;
    
    //ha h1(.a(a),.b(b),.sum(w1),.carry(w2));
    //ha h2(.a(w1),.b(cin),.sum(sum),.carry(w3));
    //assign cout=w2|w3;
    
    xor x1(w1,a,b);
    xor x2(sum,w1,cin);
    and a1(w2,a,b);
    and a2(w3,w1,cin);
    or o1(cout,w2,w3);
endmodule
