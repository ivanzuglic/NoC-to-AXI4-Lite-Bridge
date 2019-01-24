`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2019 07:37:38 PM
// Design Name: 
// Module Name: sim_Mna_Flit_Builder
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

module sim_Mna_Flit_Builder();


wire [36:0] header;
wire [36:0] body1;
wire [36:0] tail;
reg [31:0] addr1;
reg [0:0] awrite1;
reg [31:0] wdata1;
reg [7:0] is_allocatable1;
 
MNA_flit_builder sub_flit_builder(addr1, awrite1 ,wdata1,is_allocatable1, header, body1, tail);

initial
    begin
        #10 is_allocatable1[7:0] = 8'b10000000;
        #10 awrite1 = 0;
        #10 addr1[31:0]=0;
        #10 wdata1[31:0]=31'b00000000000000000000000000000001;
        #10 $finish;
    end
endmodule

