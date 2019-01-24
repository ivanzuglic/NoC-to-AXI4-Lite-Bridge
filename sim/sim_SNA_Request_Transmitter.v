`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2019 05:28:27 PM
// Design Name: 
// Module Name: sim_SNA_Request_Transmitter
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


module sim_SNA_Request_Transmitter();
    reg clock = 0;
    reg [31:0] addr;
    reg [31:0] data;
    reg read;
    reg [3:0]pov_addr;
    reg is_valid;
    wire [7:0] is_on_off;
    wire [7:0] is_allocatable;
    wire [31:0] araddr;
    wire arvalid;
    reg arready;
    wire [31:0] awaddr;
    wire awvalid;
    reg awready;
    wire [31:0] wdata;
    wire wvalid;
    reg wready;
    wire [3:0] pov_addr_buffer;
    
    
    Sna_Request_Transimtter sub_SNA_Request_Transmitter(clock,addr, data,read, pov_addr, is_valid, is_on_off,
                                is_allocatable, araddr, arvalid, arready,awaddr,
                                awvalid, awready, wdata, wvalid, wready, pov_addr_buffer);
                              
                              
    initial
        begin
          #20  read = 0;
               is_valid = 1;
               pov_addr = 4'b0101;
          #20  addr = 32'b01010101010101010101010101010101;
               awready = 1;
          #20  data = 32'b11111111111111111111111111111111;
               wready = 1;
        end 
        always #20 clock = !clock;  
endmodule
