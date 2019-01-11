`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2019 03:30:22 PM
// Design Name: 
// Module Name: Mna_Flit_Unboxer
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


module Mna_Flit_Unboxer(noc_data, ubdata, write);
    input [33:0] noc_data;
    output reg [31:0] ubdata;
    output reg write;
    
    always @(noc_data)
    if(noc_data[33:32] == 2'b10) begin
        write = noc_data[0];
    end
    
    always @(noc_data)
    if(noc_data[33:32] == 2'b01) begin
        ubdata <= noc_data[31:0];
    end
     
endmodule
