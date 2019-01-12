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


module Sna_Flit_Unboxer(noc_data, addr, data, read, pov_addr);
    input [36:0] noc_data;
    output reg [31:0] addr;
    output reg [31:0] data;
    output reg read;
    output reg [3:0] pov_addr;
    
    always @(noc_data)
    if(noc_data[36:35] == 2'b10) begin
        read <= noc_data[0:0]; 
        pov_addr <= noc_data[27:24]; 
    end
        
    always @(noc_data)
    if(noc_data[36:35] == 2'b00)
        addr <= noc_data[31:0];
    
    always @(noc_data)
    if(noc_data[36:35] == 2'b01)
    begin
        addr <= noc_data[31:0];
        data <= noc_data[31:0];   
    end
    
endmodule
