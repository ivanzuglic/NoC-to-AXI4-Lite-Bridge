`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/23/2019 05:53:56 PM
// Design Name: 
// Module Name: sim_Mna_request
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


module sim_Mna_request();
  reg clock = 0;
  reg  [36:0] header;
  reg  [36:0] body;
  reg  [36:0] tail;
  reg  [0:0] avalid;
  reg  [0:0] awrite;
  wire [0:0] aready;
  reg  [0:0] wvalid;
  wire [0:0] wready;
  wire [36:0] noc_data;
  wire [0:0] is_valid;
  reg  [7:0] is_on_off;
  reg  [7:0] is_allocatable;
  
  MNA_request sub_Mna_request(clock,header,body,tail,avalid,awrite,aready,wvalid,wready, noc_data,is_valid,is_on_off,is_allocatable);
  
  initial
        begin
      #10  header[36:0] = 37'b1000100110001000000000000000000000000;
           body[36:0]   = 37'b0000100000000000000000000000000000001;
           tail[36:0]   = 37'b0100100000000000000000000000000000000;
      #10  avalid = 1; 
           awrite = 1;
           wvalid = 1;
      #10  is_allocatable[7:0] = 8'b00000001;
           is_on_off[7:0]      = 8'b00000001;
     end
     always #20 clock = !clock;
endmodule
