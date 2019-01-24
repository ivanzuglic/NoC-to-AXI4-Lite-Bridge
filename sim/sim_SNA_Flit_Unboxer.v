`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2019 10:48:05 AM
// Design Name: 
// Module Name: sim_SNA_Flit_Unboxer
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


module sim_SNA_Flit_Unboxer();
    reg [36:0] noc_data;
    wire [31:0] addr;
    wire [31:0] data;
    wire read;
    wire [3:0] pov_addr;
    
    Sna_Flit_Unboxer sub_Sna_Flit_Unboxer(noc_data,addr,data, read, pov_addr);
    
    initial 
        begin
        #20 noc_data[36:0] = 37'b1000000000111111111100000000011111100;
        #20 noc_data[36:0] = 37'b0001010101110101101100000000011111100;
        #20 noc_data[36:0] = 37'b0100000000111111111111111100011111100;
        end
endmodule
