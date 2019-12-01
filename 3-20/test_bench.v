`timescale 10ns/1ns
module add8b_tb();
  reg cin;
  wire [7:0] dout;
  wire cout;
  reg [7:0]a,b;

initial
$monitor ("dout=%b",dout);
initial begin
  #0 a=8'b10000010;#5 a=8'b00000001;
end
initial begin
  #0 b=8'b11111111;#5 b=8'b00000001;
end
initial begin
  #0 cin=1'b0;     #5 cin =1'b1;     
end
add8b U1(.a(a),.b(b),.cin(cin),.cout(cout),.dout(dout));
endmodule
