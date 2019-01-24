`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.01.2019 16:12:41
// Design Name: 
// Module Name: MNA_request
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


module MNA_request(
    input clock,
    input [36:0] header,
    input [36:0] body,
    input [36:0] tail,
    input [0:0] avalid,
    input [0:0] awrite,
    output reg [0:0] aready,
    input [0:0] wvalid,
    output reg [0:0] wready,
    output reg [36:0] noc_data,
    output reg [0:0] is_valid,
    input [7:0] is_on_off,
    input [7:0] is_allocatable
    );
reg[7:0] reg_is_on_off;
reg[36:0] reg_header;
reg[36:0] reg_body;
reg[36:0] reg_tail;
reg[7:0] reg_alloc;

reg[1:0] state = 2'b00;
reg[0:0] write;


always@(clock)
begin
    if(state == 2'b00) begin
    is_valid <= 0;
    repeat (1) begin  
            @(clock);
            end
        if(awrite == 0 && avalid == 1 && is_allocatable != 8'b00000000) begin
            aready <= 1;
            repeat (1) begin  
            @(clock);
            end
            reg_header <= header;
            reg_tail <= tail;
            reg_alloc <= is_allocatable;
            reg_is_on_off <= is_on_off;
            write = 0;
            state = 2'b01;
        end
        
        if(awrite == 1 && avalid == 1 && wvalid == 1 && is_allocatable != 8'b00000000) begin
            aready <= 1;
            wready <= 1;
            
            repeat (1) begin  
            @(clock);
            end
            
            reg_header <= header;
            reg_body <= body;
            reg_tail <= tail;
            reg_alloc <= is_allocatable;
            reg_is_on_off <= is_on_off;
            
            write = 1;
            state = 2'b01;
        end
    end



    if(state == 2'b01) begin
        aready <= 0;
        wready <= 0;
        
        if((reg_is_on_off & reg_alloc) != 8'b00000000) begin
            noc_data <= reg_header;
            is_valid <= 1;
            repeat (1) begin  
            @(clock);
            end
           
         if(write == 0) begin
                state = 2'b11;
            end
            
            else if(write == 1) begin
                state = 2'b10;
            end
            
        end
    end


 
  
     if(state == 2'b10) begin
        is_valid <= 0;
        repeat (1) begin  
            @(clock);
            end
        
        if((reg_is_on_off & reg_alloc) != 8'b00000000) begin
            noc_data <= reg_body;
            is_valid <= 1;
            repeat (1) begin  
            @(clock);
            end
            state = 2'b11;
         
        end
    end



    if(state == 2'b11) begin
        is_valid <= 0;
        repeat (1) begin  
            @(clock);
            end
        
        if((reg_is_on_off & reg_alloc) != 8'b00000000) begin
            noc_data <= reg_tail;
            is_valid <= 1;
            state = 2'b00;
        end
    end
end

endmodule
