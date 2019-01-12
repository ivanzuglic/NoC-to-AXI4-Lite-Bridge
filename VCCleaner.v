`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/12/2019 02:23:11 PM
// Design Name: 
// Module Name: VCCleaner
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


module VCCleaner(zastavice_in, zastavice_out);
    input [7:0] zastavice_in;
    output reg [7:0] zastavice_out;
    
    always @(zastavice_in)
    if(zastavice_in[0] == 1'b1 ) begin
    zastavice_out <= 8'b00000001;
    end
    
    always @(zastavice_in)
    if(zastavice_in[1:0] == 2'b10) begin
    zastavice_out <= 8'b00000010;
    end
    
    always @(zastavice_in)
    if(zastavice_in[2:0] == 3'b100) begin
    zastavice_out <= 8'b00000100;
    end
    
    always @(zastavice_in)
    if(zastavice_in[3:0] == 4'b1000) begin
    zastavice_out <= 8'b00001000;
    end
    
    always @(zastavice_in)
    if(zastavice_in[4:0] == 5'b10000) begin
    zastavice_out <= 8'b00010000;
    end
    
    always @(zastavice_in)
    if(zastavice_in[5:0] == 6'b100000) begin
    zastavice_out <= 8'b00100000;
    end
    
    always @(zastavice_in)
    if(zastavice_in[6:0] == 7'b1000000) begin
    zastavice_out <= 8'b01000000;
    end
    
    always @(zastavice_in)
    if(zastavice_in[7:0] == 8'b10000000) begin
    zastavice_out <= 8'b10000000;
    end
    
    always @(zastavice_in)
    if(zastavice_in[7:0] == 8'b00000000) begin
    zastavice_out <= 8'b00000000;
    end
    
    
endmodule
