module cnt57(clk, rst, en, cout, dout, data,load);
input clk, rst, en,load;
input[15:0] data;
output[15:0] dout;
output cout;
reg cout;
reg full;
reg[15:0]q1;

always@(posedge clk or posedge load or negedge rst)
begin	
	if(!rst) begin q1 <= 0; full <= 0; end
	else if(load) begin q1 <= data; full <= 1; end
	else if(en) begin q1 <= q1 + 1; full <=0; end
end
always@(q1)
	if(q1==16'hffff) cout=1'b1;
	else cout=1'b0;
assign load = (q1 == 16'h0000);
assign dout = q1;

endmodule
