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
    input [7:0] is_allocatable,
    output reg [36:0] header,
    output reg [36:0] body1,
    output reg [36:0] tail
    );
    
initial begin
    header[36:35] = 2'b10;
    header[23:1] = 0;
    header[27:24] = adresa_izvora;
    header[31:28] = addr[31:28];
    body1[36:35] = 2'b00;
    tail[36:35] = 2'b01;
end

always@(awrite)
begin
    if(awrite == 1) begin
        header[0:0] = 0;
        body1[31:0] = addr;
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
    8'b00000001: begin
        header[34:32] = 3'b000;
        body1[34:32] = 3'b000;
        tail[34:32] = 3'b000;
    end
    
    8'b00000010: begin
        header[34:32] = 3'b001;
        body1[34:32] = 3'b001;
        tail[34:32] = 3'b001;
    end
    
    8'b00000100: begin
        header[34:32] = 3'b010;
        body1[34:32] = 3'b010;
        tail[34:32] = 3'b010;
    end
    
    8'b00001000: begin
        header[34:32] = 3'b011;
        body1[34:32] = 3'b011;
        tail[34:32] = 3'b011;
    end
    
    8'b00010000: begin
        header[34:32] = 3'b100;
        body1[34:32] = 3'b100;
        tail[34:32] = 3'b100;
    end
    
    8'b00100000: begin
        header[34:32] = 3'b101;
        body1[34:32] = 3'b101;
        tail[34:32] = 3'b101;
    end
    
    8'b01000000: begin
        header[34:32] = 3'b110;
        body1[34:32] = 3'b110;
        tail[34:32] = 3'b110;
    end
    
    8'b10000000: begin
        header[34:32] = 3'b111;
        body1[34:32] = 3'b111;
        tail[34:32] = 3'b111;
    end
    
endcase
end
    
endmodule
