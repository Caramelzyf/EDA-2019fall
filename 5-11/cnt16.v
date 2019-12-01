module cnt16(clk,rst,en,cout,dout);
  input clk,en,rst;
  output [15:0] dout;

  output cout;
  reg [15:0] data;
  reg cout;

always@(posedge clk or negedge rst)
  begin
	if(!rst) data<=0;
	else if(en)
	begin
	  if(data<65535) data<=data+1;
	  else data<=16'h0000;
	end
  end
always@(data)
begin
  if(data==16'hffff) cout=1'b1;
  else cout=1'b0;
end
assign dout=data;
endmodule
