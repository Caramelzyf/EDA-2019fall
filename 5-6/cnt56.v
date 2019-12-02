
module cnt56(CLK, RST, EN, LOAD, COUT, DOUT, DATA);
	input CLK,EN,RST,LOAD;
	input [7:0] DATA;
	output[7:0] DOUT;
	output COUT;

   reg[7:0] Q1; 
	reg COUT;
   assign DOUT = Q1;

	always @(posedge CLK or negedge RST) 
		begin
			if(!RST)
				Q1 <= 0;
			else if(EN) 
				begin
					if(!LOAD) 
						Q1 <= DATA;
					else if (Q1 < 8'b11111111 )  
						Q1 <= Q1 +1 ;
					else 
						Q1 = 8'b00000000; 
				end
		end

	always @(Q1)
		if (Q1 == 8'b11111111) 
			COUT = 1'b1; 
		else 
			COUT = 1'b0;
endmodule