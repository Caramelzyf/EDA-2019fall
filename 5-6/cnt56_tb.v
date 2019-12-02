`timescale 10ns/1ns
module cnt56_tb();
reg clk, en, rst;
reg[7:0]data;
wire[7:0]dout;
wire cout;
wire ld;
always #3 clk = ~clk;
initial
$monitor("dout = %h", dout);
initial begin
#0 clk = 1'b0;
#0 rst = 1'b1; #20 rst = 1'b0; #2 rst = 1'b1;
end
initial begin
#0 en = 1'b0; #5 en = 1'b1;
end
initial begin
#0 data = 8'h7; #30 data = 8'h2; #30 data = 8'h5; #30 data = 8'h4;
end
cnt56 U1(
.CLK(clk), .RST(rst), .DATA(data), .EN(en), .COUT(cout), .DOUT(dout), .LOAD(ld)
);

endmodule
