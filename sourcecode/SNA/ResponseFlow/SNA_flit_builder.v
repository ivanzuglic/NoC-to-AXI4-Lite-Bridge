`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.01.2019 20:47:29
// Design Name: 
// Module Name: SNA_flit_builder
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


module SNA_flit_builder(
    input [31:0] rdata,
    input [0:0] rvalid,
    input [31:0] bresp,
    input [0:0] bvalid,
    input [7:0] is_allocatable,
    input [3:0] pov_addr,
    output reg [33:0] header,
    output reg [33:0] tail
    );
    
initial begin
    header[33:32] = 2'b10;
    tail[33:32] = 2'b01;
    header[20:1] = 0;
    header[28:25] = pov_addr;
end

always@(rvalid, bvalid, is_allocatable)
begin
    if(rvalid == 1) begin
        header[0:0] <= 1;
        tail[31:0] <= rdata;
    end
    
    if(bvalid == 1) begin
        header[0:0] <= 0;
        tail[31:0] <= bresp;
    end
end

always@(rvalid, bvalid, is_allocatable)
begin
case(is_allocatable)
    8'b00000001: header[31:29] = 3'b000;
    8'b00000010: header[31:29] = 3'b001;
    8'b00000100: header[31:29] = 3'b010;
    8'b00001000: header[31:29] = 3'b011;
    8'b00010000: header[31:29] = 3'b100;
    8'b00100000: header[31:29] = 3'b101;
    8'b01000000: header[31:29] = 3'b110;
    8'b10000000: header[31:29] = 3'b111;
endcase
end
    
endmodule
