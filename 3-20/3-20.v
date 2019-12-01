module add8b(a,b,cin,cout,dout);
  output[7:0] dout;
  output cout;
  input[7:0]a,b;
  input cin;
  wire [8:0] data,tmp;
  reg [7:0]A,B;
  
  assign data = a+b+cin;
  assign cout = data[8];
  assign dout = data[7:0];
  assign tmp = data>>4;
always @(*)
begin
  A= dout<<4;
  B = tmp[7:0];
end
endmodule
