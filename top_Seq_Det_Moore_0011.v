`timescale 1ns / 1ps


module Frequency_Divider(clock_in,clock_out);              // Clock Frequency divider module

input clock_in;
output reg clock_out;
reg [26:0]count;

initial begin
    clock_out=0;
end

always@(posedge clock_in)
begin
    count<=count+1;
    if(count==27'd50000000)
    begin
        clock_out=!clock_out;
        count<=0;
    end
end
       
endmodule


module top_Seq_Det_Moore_0011(Clock, Resetn, w, z);       // Moore machine for detecting the sequence 
input Clock, Resetn, w;                            // w is the input and Resetn stands for active low reset
output z;                                          // z is the output
reg [2:0] y, Y;                                    // Y is the next state variable, y is the present state variable
parameter [2:0] A = 0, B = 1, C = 2, D=3, E=4;     // States of Moore State machine

Frequency_Divider FD(clock,clk1);                 // Clock Frequency divider module


always @(w, y)
    case (y)
        A: if (w) Y = A;
           else Y = B;
        B: if (w) Y = B;
            else Y = C;
        C: if (w) Y = D;
            else Y = C;
        D: if (w) Y = E;
            else Y = B;
        E: if (w) Y = A;
            else Y = B;

    endcase

always @(negedge Resetn or posedge clk1)
begin
if (Resetn == 0)               // Active low reset
y <= A;
else
y <= Y;
end

assign z = (y == E);

endmodule
