`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2019 10:00:31 AM
// Design Name: 
// Module Name: sim_Mna_response_Transmitter
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


module sim_Mna_response_Transmitter();
    reg clock = 0;
    reg rready;
    reg bready;
    reg is_valid;
    reg read;
    reg [31:0] ubdata;
    wire [7:0] is_allocatable;
    wire [7:0] is_on_off;
    wire [31:0]rdata;
    wire rvalid;
    wire [31:0] bresp;
    wire bvalid;
    
    Mna_Response_Transmitter sub_Mna_Response_Transmitter(clock, rready, bready,is_valid, read, ubdata, is_allocatable , is_on_off,
                                 rdata, rvalid, bresp, bvalid);
                                 
    initial 
        begin
        #10 is_valid = 1;
            read = 1;
        #20 ubdata[31:0] = 32'b10000000001111111111000000000010;
            rready = 1;
        end
        
        always #20 clock = !clock;
        
endmodule
