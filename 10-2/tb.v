
`timescale 10ns/1ns
module fsm_tb();
reg clk,reset;

reg [0:1] state_inputs;
wire [3:0] comb_outputs;


always #3 clk=~clk;

initial begin
  #0 clk=1'b0;
  #0 reset=1'b1;#3 reset=1'b0;#3 reset=1'b1;
 
end
initial begin
  #0 state_inputs=2'b01;
  #10 state_inputs=2'b10;
  #10 state_inputs=2'b11;
  #15 state_inputs=2'b00;
  #10 state_inputs=2'b10;
  #15 state_inputs=2'b11;
  #15 state_inputs=2'b01;
end

fsm_exp U1(.clk(clk),.reset(reset),.state_inputs(state_inputs),.comb_outputs(comb_outputs));
endmodule
