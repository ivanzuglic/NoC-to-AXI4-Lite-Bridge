`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.01.2019 16:12:41
// Design Name: 
// Module Name: MNA_flit_builder
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


module MNA_flit_builder#(localparam adresa_izvora = 4'b0001)(
    input [31:0] addr,
    input [0:0] awrite,
    input [31:0] wdata,
    input [0:0] is_allocatable,
    output reg [33:0] header,
    output reg [33:0] body,
    output reg [33:0] tail
    );
    
initial begin
    header[33:32] = 2'b10;
    header[20:1] = 0;
    header[24:21] = adresa_izvora;
    header[28:25] = addr[31:28];
    body[33:32] = 2'b00;
    tail[33:32] = 2'b01;
end

always@(awrite)
begin
    if(awrite == 1) begin
        header[0:0] = 0;
        body[31:0] = addr;
        tail[31:0] = wdata;
    end
    
    else begin
        header[0:0] = 1;
        tail[31:0] = addr;
    end
end

always@(awrite)
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
