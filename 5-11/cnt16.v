
module cnt16(clk,rst,en,cout,dout,add);
  input clk,en,rst,add;
  output [15:0] dout;

  output cout;
  reg [15:0] data;
  reg cout;

always@(posedge clk or negedge rst)
  begin
    if(!rst) data<=0;
    else if(en)
  begin
  if(add==1)
    begin
    if(data<65535) data<=data+1;
    else data<=16'h0000;
    end
  else if(add==0)
    begin
    if(data!=0) data<=data-1;
    else data<=16'hffff;
    end
  end
  end
always@(data)
  begin
    if(add==1)
  begin
      if(data==16'hffff) cout=1'b1;
      else cout=1'b0;
  end
    else if(add==0)  cout=1'b0;
  end
assign dout=data;
endmodule
