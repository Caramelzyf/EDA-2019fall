`timescale 10ns/1ns
module cnt16_tb();
reg clk,en,rst,add;

wire [15:0] dout;
wire cout;
always #3 clk=~clk;

initial begin
  #0 clk=1'b0;
  #0 rst=1'b1;#3 rst=1'b0;#3 rst=1'b1;
 
end
initial begin
  #0 en=1'b0;#5 en=1'b1;
  #0 add=1'b1; #10 add=1'b0; #10 add=1'b1;
end

cnt16 U1(.clk(clk),.rst(rst),.en(en),.cout(cout),.dout(dout),.add(add));
endmodule
