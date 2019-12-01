
module fsm_exp(clk,reset,state_inputs,comb_outputs);
  input clk;
  input reset;
  input [0:1] state_inputs;
  output [3:0] comb_outputs;
  reg [3:0] comb_outputs;
  parameter s0=0,s1=1,s2=2,s3=3,s4=4;
  reg[4:0] c_st,next_state;
always @ (posedge clk or negedge reset)
begin 
	if(!reset) c_st<=s0;
	else c_st<=next_state;
end

always@ (c_st or state_inputs)
begin
	case(c_st)
	s0:begin 
	if(state_inputs==2'b00) next_state<=s0;
	else next_state<=s1;
	end
	s1:begin 
	if(state_inputs==2'b01) next_state<=s1;
	else next_state<=s2;
	end

	s2:begin
	if(state_inputs==2'b10) next_state<=s0;
	else next_state<=s3;
	end
	s3:begin
	if(state_inputs==2'b11) next_state<=s3;
	else next_state<=s4;
	end
	s4:begin 
	next_state<=s0;
	end
	default :next_state<=s0;
	endcase
end 
always@ (c_st or state_inputs)
begin
	case(c_st)
	s0:comb_outputs<=5;
	s1:begin comb_outputs<=8;end
	s2:begin comb_outputs<=12;end
	s3:begin comb_outputs<=14;end
	s4:begin comb_outputs<=9;end
	default :comb_outputs<=0;
	endcase
end 
endmodule
