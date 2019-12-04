module cnt16(clk100khz,clk1hz,clk10hz,rst,en,din,scan,dout,flag);
input rst;//复位键
input en;//手动或自动计数开关
input din;//手动计数脉冲
input add;//add为1则递加，add为0则递减
input clk100khz,clk1hz,clk10hz;//分别为数码管刷新，自动计数和手动计数频率
output[7:0] dout;//输出数码管七段码
output [5:0] scan;//数码管的位码
reg[7:0] dout;
reg[5:0] scan;
reg f1,f2,c;//数码管个位和十位模块的敏感信号；c为手动计数参数。
reg[2:0]cnt;//数码管扫描参数
reg[3:0]dat;//数码管位码扫描参数
reg[3:0]data1,data2;//个位和十位计数参数

always@(posedge clk10hz)//设置自动计数和手动计数参数
	begin if(!din) c<=1;
		  else c<=0;
	end

always@(din or clk1hz)
begin f1<=(c&en)|(clk1hz&(~en));end

always@(posedge f1, negedge rst)
	begin
		if(!rst) 
		begin
		data1<=0;
		end
		else if(data1 == 15 && add)
			begin
				data1<=0;f2<=1;
			end
		else if(data1 == 0 && !add)
			begin
				data1<=15;f2<=1;
			end
		else
		begin
			if(add)
			begin
				data1<=data1+1;f2<=0;
			end
			else
			begin
				data1<=data1-1;f2<=0;
			end
		end
	end

always@(posedge f2, negedge rst)
	begin 
		if(!rst)
			begin data2<=0;end
		else if(data2 == 15 && add)
			begin data2<=0; end
		else if(data2 == 0 && !add)
			begin data2<=15; end
		else
			begin
				if(add) 
				begin data2<=data2+1; end
				else
				begin data2<=data2-1; end
			end
	end

always@(posedge clk100khz)
	begin
		if(cnt == 3'b001)
			begin cnt<=0;end
		else
			begin cnt<=cnt+1;end
	end

always@(cnt,data1,data2)//数码管显示
	begin
		case(cnt)
			3'b000:begin scan<=6'b001000;dat<=data1;end
			3'b001:begin scan<=6'b010000;dat<=data2;end
			default:begin scan<=6'b000000;end
			endcase
		end

always@(dat)	//数码管译码
	begin
	case(dat)
		4'b0000:dout[7:0]<=8'b00111111;	//0
		4'b0001:dout[7:0]<=8'b00000110;	//1
		4'b0010:dout[7:0]<=8'b01011011;	//2
		4'b0011:dout[7:0]<=8'b01001111;	//3
		4'b0100:dout[7:0]<=8'b01100110;	//4
		4'b0101:dout[7:0]<=8'b01101101;	//5
		4'b0110:dout[7:0]<=8'b01111101;	//6
		4'b0111:dout[7:0]<=8'b00000111;	//7
		4'b1000:dout[7:0]<=8'b01111111;	//8
		4'b1001:dout[7:0]<=8'b01101111;	//9
		4'b1010:dout[7:0]<=8'b01110111;	//A
		4'b1011:dout[7:0]<=8'b01111100;	//B
		4'b1100:dout[7:0]<=8'b00111001;	//C
		4'b1101:dout[7:0]<=8'b01011110;	//D
		4'b1110:dout[7:0]<=8'b01111001;	//E
		4'b1111:dout[7:0]<=8'b01110001;	//F
		default:dout[7:0]<=8'b00000000;
	endcase
	end
	endmodule
		