`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2019 08:36:49 PM
// Design Name: 
// Module Name: sim2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sim2();

reg [7:0] in1;
wire [7:0] out1;  

VCCleaner sub_mod2(in1,out1);


initial
begin
    in1[7:0]=0;
    #10 in1[7:0]=8'b00000000;
    #10 in1[7:0]=8'b00000001;
    #10 in1[7:0]=8'b00000010;
    #10 in1[7:0]=8'b10000100;
    #10 in1[7:0]=8'b00000010;
    #10 in1[7:0]=8'b00000001;
    #10 in1[7:0]=8'b10000000;
    #10 $finish;
    
end



endmodule
