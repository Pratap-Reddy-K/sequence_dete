//Verilog code for Sequence Detector using Mealy FSM
// The sequence being detected is "101"

module sequence_detector(
				input in,
				input clk,       //inputs clock, in, reset
				input rst,
				output reg out   // output of the sequence generator
				);
				
				reg [1:0] cst,nst;   // current states and next states
				
				parameter [1:0]s0 = 2'b00;  //input sates
				parameter [1:0]s1 = 2'b01;
				parameter [1:0]s2 = 2'b10;
				
				
				// sequential memory of the Mealy FSM
	always@(posedge clk)
		begin
				if(rst)
				out = 1'b0;   // when reset=1, reset the state of the FSM to "Zero" State
				cst = s0;
				nst = s0;
		end
				
			else
				begin
				  cst=nst; // otherwise, next state
				 end
				 
				  // combinational logic of the Mealy FSM
	           // to determine next state  
	  always@(cst or in)
		  begin
				  
		   case(cst)
				  
				 s0: if(in) begin
				    out = 1'b0;
					 nst = s1; end
					 else  begin
					 out = 1'b0;
					 nst = s0; end
					 
					 
				s1: if(in) begin
				    out = 1'b0;
					 nst = s1; end
					 else  begin
					 out = 1'b0;
					 nst = s2; end
					 
					 
				s2: if(in) begin
				    out = 1'b1;
					 nst = s1; end
					 else  begin
					 out = 1'b0;
					 nst = s0; end
				endcase
			end
		end
	endmodule	