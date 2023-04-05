module sequence_detector_test;

//inputs 
reg in;
reg clk;
reg rst;

//outputs
wire out;

//instantiating the unit under test

sequence_detector uut(.in(in), .clk(clk), .rst(rst), .out(out));

initial
begin

//initiate inputs
in = 0;
clk = 0;
rst = 0;

//wait 10ns for global reset to finish

#10;

rst = 1;
#10;

rst = 0;
#10;

in =  1;
#10;

in = 0;
#10;

in = 1;
#10;

//add stimulate here
end

always #5 clk = ~clk;

endmodule
