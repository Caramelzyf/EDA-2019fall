
module cnt(CP, MR, CET, CEP, PE, TC, Q, P);
output[3:0] Q;
output TC;
input CP,MR, CET, PE, CEP;
input[3:0] P;
reg[3:0] Q;
reg TC, s;

always @(posedge CP or negedge MR)
begin
	s <= CET & CEP;
	if(!MR) begin Q = 0; end
	else 
begin
 if(!PE) begin Q = P; end
		else if(s) begin Q = Q + 1;
	if(Q == 4'b1111)begin TC = 1;end
	else begin TC = 0;end
		end
	else begin Q= Q;end
		end
end
endmodule
