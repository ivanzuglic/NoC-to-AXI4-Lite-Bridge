`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2019 10:29:21 AM
// Design Name: 
// Module Name: sim_Mna_Flit_Unboxer
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


module sim_Mna_Flit_Unboxer();
    reg [36:0] noc_data;
    wire [31:0] ubdata;
    wire read;
    
    Mna_Flit_Unboxer sub_Mna_Flit_Unboxer(noc_data, ubdata, read);
    
    initial 
        begin
        #20 noc_data[36:0] = 37'b1000000000000000111111111111111111010;
        #20 noc_data[36:0] = 37'b0100000000000000111111111111111111011;
        #20 noc_data[36:0] = 37'b1000000000000000111111111111111111011;
        #20 noc_data[36:0] = 37'b0101100010100010111101111011111111011;
        end
endmodule
