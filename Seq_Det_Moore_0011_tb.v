`timescale 1ns / 1ps


module Seq_Det_Moore_0011_tb;

reg Clock, Resetn, w;
wire z;
top_Seq_Det_Moore_0011 Moore(.Clock(Clock), .Resetn(Resetn), .w(w), .z(z));
initial begin
    Clock=0;
forever begin
    #1; Clock=~Clock;
end
end

initial begin
    Resetn=0;#0.5;
    Resetn=1;w=0;
    #2;
        w=0;
    #2;
        w=1;
    #2;
        w=1;
    #5;

$finish;

end
endmodule
