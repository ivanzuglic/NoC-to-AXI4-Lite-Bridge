`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2019 05:06:45 PM
// Design Name: 
// Module Name: sim_Sna_Flit_Builder
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


module sim_Sna_Flit_Builder();
    reg [31:0] rdata;
    reg [0:0] rvalid;
    reg [31:0] bresp;
    reg [0:0] bvalid;
    reg [7:0] is_allocatable;
    reg [3:0] pov_addr;
    wire [36:0] header;
    wire [36:0] tail;
    
SNA_flit_builder sub_Sna_Flit_Builder(rdata,rvalid,bresp, bvalid, is_allocatable, pov_addr, header, tail);

initial 
    begin
    #20 pov_addr = 4'b0001;
        bresp[31:0] = 32'b00000000000000001111111111111111;
    #20 bvalid = 1;
        is_allocatable = 8'b00001000;
    end
endmodule
