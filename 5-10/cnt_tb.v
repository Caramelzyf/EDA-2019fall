
module stimulus();
reg CP, MR, CET, CEP;
reg[3:0]P;
reg PE;
wire[3:0]Q;
wire TC;
cnt r1(CP, MR,CET,CEP,PE,TC,Q,P);
initial
CP = 1'b0;
always
#5 CP = ~CP;
initial
begin
CET = 1'b0;MR = 1'b1;PE = 1'b1; P = 4'd0;
CEP = 1'b0;
#5 P = 4'd5;
#5 CET = 1'b1;CEP = 1'b1;
#10 MR = 1'b0;
#10 MR = 1'b1;
#30 P = 4'd7;
#5 PE = 1'b0;
#5 PE = 1'b1;
#50 PE = 1'b0;
#3 PE = 1'b1;
#20 P = 4'd9;
#100 PE = 1'b0;
#10 PE = 1'b0;
#10 PE = 1'b1;
#20 P = 4'd4;
#20 $finish;
end
initial
$monitor(
$time,"CP = %b, MR = %b, CET = %b, CEP = %b, PE = %b, TC = %b, Q = %d, P = %d",
CP, MR, CET, CEP, PE, TC, Q, P
);
endmodule
