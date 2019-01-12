`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2019 03:45:33 PM
// Design Name: 
// Module Name: Sna_Flit_Unboxer
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


module Sna_Flit_Unboxer(noc_data,addr,data, write, pov_addr);
    input [33:0] noc_data;
    output [31:0] addr;
    output [31:0] data;
    output write;
    output [3:0] pov_addr;
    reg [3:0] pov_addr;
    reg [31:0] addr; 
    reg [31:0] data;
    
    always @(noc_data)
    if(noc_data[33:32] == 2'b10) 
        pov_addr <= noc_data[24:21];
        
    always @(noc_data)
    if(noc_data[33:32] == 2'b00)
        addr <= noc_data[31:0];
    
    always @(noc_data)
    if(noc_data[33:32] == 2'b01)
    begin
        addr <= noc_data[31:0];
        data <= noc_data[31:0];   
    end
    
endmodule
