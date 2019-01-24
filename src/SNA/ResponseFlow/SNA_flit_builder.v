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
    output reg [36:0] header,
    output reg [36:0] tail,
    output reg [36:0] body
    );
    
initial begin
    header[36:35] = 2'b10;
    tail[36:35] = 2'b01;
    header[27:1] = 0;
    
end

always@(rvalid, bvalid, is_allocatable)
begin
    if(rvalid == 1) begin
        header[0:0] <= 1;
        tail[31:0] <= rdata;
        header[31:28] <= pov_addr;
    end
    
    if(bvalid == 1) begin
        header[0:0] <= 0;
        tail[31:0] <= bresp;
        header[31:28] <= pov_addr;
    end
end

always@(rvalid, bvalid, is_allocatable)
begin
case(is_allocatable)
    8'b00000001: begin
        header[34:32] = 3'b000;
        body[34:32] = 3'b000;
        tail[34:32] = 3'b000;
    end
    
    8'b00000010: begin
        header[34:32] = 3'b001;
        tail[34:32] = 3'b001;
    end
    
    8'b00000100: begin
        header[34:32] = 3'b010;
        tail[34:32] = 3'b010;
    end
    
    8'b00001000: begin
        header[34:32] = 3'b011;
        tail[34:32] = 3'b011;
    end
    
    8'b00010000: begin
        header[34:32] = 3'b100;
        tail[34:32] = 3'b100;
    end
    
    8'b00100000: begin
        header[34:32] = 3'b101;
        tail[34:32] = 3'b101;
    end
    
    8'b01000000: begin
        header[34:32] = 3'b110;
        tail[34:32] = 3'b110;
    end
    
    8'b10000000: begin
        header[34:32] = 3'b111;
        tail[34:32] = 3'b111;
    end
    
endcase
end
    
endmodule