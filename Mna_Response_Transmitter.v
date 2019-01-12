`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2019 03:09:53 PM
// Design Name: 
// Module Name: Mna_Response_Transmitter
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


module Mna_Response_Transmitter(rready, bready,is_valid, read, ubdata, is_allocatable , is_on_off,
                                 rdata, rvalid, bresp, bvalid
    );
    input rready;
    input bready;
    input is_valid;
    input read;
    input [31:0] ubdata;
    output reg [7:0] is_allocatable;
    output reg [7:0] is_on_off;
    output reg [31:0]rdata;
    output reg rvalid;
    output reg [31:0] bresp;
    output reg bvalid;
    
    reg [31:0] data;
    reg [2:0] state = 3'b000;
    
    parameter IDLE = 3'b000;
    parameter WRESP1 = 3'b001;
    parameter WRESP2 = 3'b010;
    parameter RRESP1 = 3'b100;
    parameter RRESP2 = 3'b101;
    
    always @(state) 
    if(state == IDLE) begin
        bvalid <= 0;  
        rvalid <= 0;
        is_allocatable <= 8'b00000001;
        is_on_off <= 8'b00000001;
        
        if(is_valid == 1 && read == 0) begin
            is_allocatable <= 8'b00000000;
            is_on_off <= 8'b00000000;
            state <= WRESP1;
        end
        
        if( is_valid == 1 && read == 1) begin
            is_allocatable <= 8'b00000000;
            is_on_off <= 8'b00000000;
            state= RRESP1;
        end
    end
    
    always @(state)
    if(state == WRESP1) begin
        is_on_off <= 8'b00000001;
        if(is_valid == 1) begin
            data <= ubdata;
            is_on_off <= 8'b00000000;
            state <= WRESP2;
        end
    end
    
    always @(state)
    if(state == WRESP2) begin
        if(bready == 1) begin
            bresp <= data;
            bvalid <= 1;
            state <= IDLE;
        end
    end
    
    always @(state)
    if(state == RRESP1) begin
        is_on_off <= 8'b00000001;
        if(is_valid == 1) begin
            data <= ubdata;
            is_on_off <= 8'b00000000;
            state <= RRESP2;
        end
    end
    
    always @(state)
    if(state == RRESP2)begin
        if(rready== 1) begin
            rdata <= data;
            rvalid <= 1;
            state <= IDLE;
        end
    end
    
endmodule
