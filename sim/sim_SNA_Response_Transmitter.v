`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2019 06:31:52 PM
// Design Name: 
// Module Name: sim_SNA_Response_Transmitter
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


module sim_SNA_Response_Transmitter();
    reg clock=0;
    reg [36:0] header;
    reg [36:0] tail;
    reg [0:0] rvalid;
    reg [0:0] bvalid;
    reg [7:0] is_allocatable;
    reg [7:0] is_on_off;
    wire [36:0] noc_data;
    wire [0:0] is_valid;
    wire [0:0] rready;
    wire [0:0] bready;
    
    SNA_response sub_SNA_Response_Transmitter(clock, header, tail, rvalid, bvalid, is_allocatable, is_on_off, noc_data, is_valid, rready, bready);
    
    initial 
        begin
        #20  header[36:0] = 37'b1000100110001000000000000000000000000;
             tail[36:0]   = 37'b0100100000000000000000000000000000000;
       
        #20  rvalid = 1; 
                           
        #20  is_allocatable[7:0] = 8'b00000001;
             is_on_off[7:0]      = 8'b00000001; 
        end
        always #20 clock = !clock;
endmodule
