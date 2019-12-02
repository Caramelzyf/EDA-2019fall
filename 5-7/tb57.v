`timescale 10ns/1ns
module cnt57_tb();
reg clk, en, rst,load;
reg[15:0]data;
wire[15:0]dout;
wire cout;

always #3 clk = ~clk;

initial begin
#0 clk = 1'b0;
#0 rst = 1'b1; #20 rst = 1'b0; #2 rst = 1'b1;
end
initial begin
#0 en = 1'b0; #5 en = 1'b1;
end
initial begin

#0 load=1'b1; #49 load =1'b0;#3 load=1'b1;

end

initial begin
#0 data = 15'h7; #30 data = 15'h2; #30 data = 15'h5; #30 data = 15'h4;
end
cnt57 U1(.clk(clk), .rst(rst), .data(data), .en(en), .cout(cout), .dout(dout),.load(load));
endmodule
