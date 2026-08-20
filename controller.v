//Code → Testbench → Simulation → Fix → Synthesis 
//→ Implementation → Timing → Bitstream → FPGA
module controller(
input clk,
input reset,
input timer_done,
//define output 
output reg A_red ,
output reg A_yellow ,
output reg A_green,
output reg B_red,
output reg B_yellow,
output reg B_green
);
//defining state
//there is 6 combination but 2 combination has to co exist with other 
// like if road a is green then concurrently road b has to be red and vice verSA
// SO WE NEED 4 state so 2 bit can give us 4 state 
parameter A_GREEN  = 2'b00;
parameter A_YELLOW = 2'b01;
parameter B_GREEN  = 2'b10;
parameter B_YELLOW = 2'b11;

//defining state varibale 
reg[1:0]current_state;
reg[1:0]next_state;
//now define state register 
//we are defining one constant thing when there is problem or reset any one specific road to be green 
always@(posedge clk or posedge reset)
begin
if (reset)
current_state<=A_GREEN;
else 
current_state<=next_state;
end
//next state logic-here we decide current state ke baad kaha jana hai
//har ek parameter ka case banega aur check hoga ki time khtm hua ya nhi
always@(*)
begin
	case (current_state)
	
		A_GREEN://B_RED
		if (timer_done)
		current_state<= A_YELLOW;
		else
		current_state<=A_GREEN;
		A_YELLOW:
		if (timer_done)
		current_state<= A_red;
		else
		current_state<=A_YELLOW;
		B_GREEN://A_RED
		if (timer_done)
		current_state<= B_YELLOW;
		else
		current_state<=B_GREEN;
		B_YELLOW:
		if (timer_done)
		current_state<= B_red;
		else
		current_state<=B_YELLOW;
		
		// BUT WOULD HAPPEN IF THERE IS ERROR AND THERE IS PROBLEM IN THE CASE
		default:
		current_state=A_green;
		
	endcase
end


//output logic where the bulb will glow up
always@(*)
begin
	A_red =0;
	A_yellow =0;
	A_green=0;
	B_red=0;
	B_yellow=0;
	B_green=0;
	
	case(current_state)
		A_GREEN:
		begin
		A_green=1;
		B_red=1;
		end
		
		A_YELLOW:
		begin
		A_yellow=1;
		B_red=1;
		end
		
		B_GREEN:
		begin
		B_green=1;
		A_red=1;
		end
		
		B_YELLOW:
		begin
		B_yellow=1;
		A_red=1;
		end
	endcase
end
endmodule

