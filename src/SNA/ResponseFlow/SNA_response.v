`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.01.2019 20:47:29
// Design Name: 
// Module Name: SNA_response
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


module SNA_response(
    input clock,
    input [36:0] header,
    input [36:0] tail,
    input [0:0] rvalid,
    input [0:0] bvalid,
    input [7:0] is_allocatable,
    input [7:0] is_on_off,
    output reg [36:0] noc_data,
    output reg [0:0] is_valid,
    output reg [0:0] rready,
    output reg [0:0] bready
    );
    
reg [1:0] state=2'b00;
reg [36:0] reg_header;
reg [36:0] reg_tail;
reg [7:0] reg_alloc;

always@(clock)
begin
    if(state == 2'b00) begin
        is_valid = 0;
        repeat (1) begin  
            @(clock);
            end
        if(rvalid == 1 && is_allocatable !== 8'b00000000) begin
            rready <= 1;
            repeat (1) begin  
            @(clock);
            end
            
            reg_header <= header;
            reg_tail <= tail;
            
            reg_alloc = is_allocatable;
            
            state <= 2'b01;
        end
        
        if(bvalid == 1 && is_allocatable != 8'b00000000) begin
            bready <= 1;
            repeat (1) begin  
            @(clock);
            end
            
            reg_header <= header;
            reg_tail <= tail;
            
            reg_alloc = is_allocatable;
            
            state <= 2'b01;
        end
    end
    
    if(state == 2'b01) begin
        rready <= 0;
        bready <= 0;
        
        if((is_on_off & reg_alloc) != 8'b00000000) begin
            noc_data <= reg_header;
            is_valid <= 1;
            repeat (1) begin  
            @(clock);
            end
            
            state = 2'b10;
        end
    end
    
     if(state == 2'b10) begin
        is_valid = 0;
        repeat (1) begin  
            @(clock);
            end
        
        if((is_on_off & reg_alloc) != 8'b00000000) begin
            noc_data <= reg_tail;
            is_valid <= 1;
            repeat (1) begin  
            @(clock);
            end
            
            state = 2'b00;
        end
    end

end        
endmodule
