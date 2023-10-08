`timescale 1ns / 1ps
module fatb();

reg a,b,cin;
wire sum,cout;

fa uut(a,b,cin,sum,cout);

initial begin

a=1;b=0;cin=0;
$display("Sum=%d at time=%t",sum,$time());
#10;
a=0;b=0;cin=0;
$display("Sum=%d at time=%t",sum,$time());
#10;
a=0;b=1;cin=1;
$display("Sum=%d at time=%t",sum,$time());
#10;
a=1;b=0;cin=0;
$display("Sum=%d at time=%t",sum,$time());
#10;
//a=1;b=1;cin=1;
//$display("Sum=%d at time=%t",sum,$time());
//#10;

//$display("Sum=%d at time=%t",sum,$time());

$finish();
end
endmodule