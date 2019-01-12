`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2019 03:55:45 PM
// Design Name: 
// Module Name: Sna_Request_Transimtter
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


module Sna_Request_Transimtter(addr,data,write,pov_addr,is_valid,is_on_off,
                                is_allocatable,araddr,arvalid,arready,awaddr,
                                awvalid,awready,wdata,wvalid,wready,pov_addr_buffer);
    input [31:0] addr;
    input [31:0] data;
    input write;
    input [3:0] pov_addr;
    input is_valid;
    output reg [7:0] is_on_off;
    output reg [7:0] is_allocatable;
    output reg [31:0] araddr;
    output reg arvalid;
    input arready;
    output reg [31:0] awaddr;
    output reg awvalid;
    input awready;
    output reg [31:0] wdata;
    output reg wvalid;
    input wready;
    output reg [3:0] pov_addr_buffer;
    
    reg [2:0] state = 3'b000;
    reg [3:0] reg_pov_addr;
    reg [31:0] reg_addr;
    reg [31:0] reg_data;
  
    
    parameter IDLE = 3'b000;
    parameter WREQ1 = 3'b001;
    parameter WREQ2 = 3'b010;
    parameter WREQ3 = 3'b011;
    parameter RREQ1 = 3'b100;
    parameter RREQ2 = 3'b101;
    
    always @(state)
    if(state == IDLE) begin 
        arvalid <= 0;
        awvalid <= 0;
        wvalid <= 0;
        is_allocatable <= 8'b00000001;
        is_on_off <= 8'b00000001;
    
        if(is_valid ==1 && write ==0) begin // mislim da tu write ide 1
          is_allocatable <= 8'b00000000;
          is_on_off <= 8'b00000000;
          reg_pov_addr <= pov_addr;
          state<=WREQ1;
        end
        
        if(is_valid==1 && write==1) begin // mislim da tu write ide 0
          is_allocatable <= 8'b00000000;
          is_on_off<= 8'b00000000;
          reg_pov_addr <= pov_addr;
          state<=RREQ1;
        end
   end
   
   always @(state)
   if(state == WREQ1) begin
        is_on_off <= 8'b00000001;
        if(is_valid == 1) begin
            reg_addr <= addr;
            is_on_off <= 8'b00000000;
            state <= WREQ2;
            end 
    end
    
    always @(state)
    if(state== WREQ2) begin
        is_on_off <= 8'b00000001;
        if(is_valid==1) begin
            reg_data <= data;
            is_on_off <= 8'b00000000;
            state <= WREQ3;
        end
    end
    
    always@(state)
    if(state==WREQ3) begin
        if(awready == 1 && wready == 1) begin
            pov_addr_buffer <= reg_pov_addr;
            awaddr <= reg_addr;
            awvalid <= 1;
            wdata <= reg_data;
            wvalid <=1;
            state <= IDLE;
        end
    end
    
    always @(state)
    if(state== RREQ1) begin
        is_on_off <=8'b00000001;
        if(is_valid == 1) begin
            reg_addr <= addr;
            is_on_off <= 8'b00000000;
            state <= RREQ2;
        end
    end
    
    always @(state)
    if(state== RREQ2) begin
        if(arready == 1) begin
            pov_addr_buffer <= reg_pov_addr;
            araddr <= reg_addr;
            arvalid <= 1;
            state <= IDLE;
        end
    end
    
endmodule
