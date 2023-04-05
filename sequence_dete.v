//Verilog code for Sequence Detector using Mealy FSM
// The sequence being detected is "1011"

`timescale 1ns / 1ps //time signal

module sequence_dete(
input x,clk,reset, //inputs clock, binary sequence, reset
output reg z       // output of the sequence generator
);

parameter S0 = 0 , S1 = 1 , S2 = 2 , S3 = 3 ;  // input states
reg [1:0] PS,NS ;     // current_state and next_state

// sequential memory of the Mealy FSM

    always@(posedge clk or posedge reset)
        begin
            if(reset)
                PS <= S0; // when reset=1, reset the state of the FSM to "Zero" State 
            else    
                PS <= NS ;  // otherwise, next state
        end     

// combinational logic of the Mealy FSM
// to determine next state        

    always@(PS or x)
        begin 
            
            case(PS)
                S0 : begin 
                            z = 0 ;
                            NS = x ? S1 : S0 ;
                            $display(PS);
                        end
                S1 : begin 
                            z = 0 ;
                            NS = x ? S1 : S2 ;
                            $display(PS);
                        end
                S2 : begin 
                            z = 0 ;
                            NS = x ? S3 : S0 ;
                            $display(PS);
                        end 
                S3 : begin 
                            z = x ? 1 : 0 ; 
                            NS = x ? S1 : S2 ;
                            $display(PS);
                        end

            endcase
        end
endmodule