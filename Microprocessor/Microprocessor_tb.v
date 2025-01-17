`timescale 1ns / 1ps

module Microprocessor_tb(

    );
    
    reg [7:0] address_input;
    reg Read_En;
    reg [23:0]Code_Data; 
    reg [7:0] Code_address;
    reg Write_Code;
    reg start;
    reg clk, preset, clear;
    wire [31:0] register_A1, register_B1, register_C1, register_D1;
    wire [7:0] address_output;
    wire [7:0] Mne_control_I;
    wire [7:0] Mne_control_II;
    wire [23:0] Data;
    wire ready_flag;
    wire [31:0] data_I, data_II;
    wire [3:0] sel;
    wire Trig;
    wire smaller_flag, equal_flag, greater_flag;
    wire [31:0] value;
    wire Write_Enable;
    wire [23:0] Ram_data_in;
    wire Read_Enable;
    wire [7:0] address;
    wire ready_flag_II;
    wire sel_STA;

    wire jump_sel;
    wire clk_PC;
    wire Mne_0, Mne_1;
    
    
    microprocessor dut (address_input, Read_En, Code_Data, Code_address, Write_Code, start, clk, preset, clear, register_A1, register_B1,
                        register_C1, register_D1, address_output, Mne_control_I, Mne_control_II, Data, ready_flag, data_I, data_II, sel, Trig,
                        smaller_flag, equal_flag, greater_flag, value, Write_Enable, Ram_data_in, Read_Enable, address, ready_flag_II, sel_STA,
                          jump_sel, clk_PC, Mne_0, Mne_1);
    
    initial
    begin
      clk = 1'b0;
      forever #20 clk = ~clk;
    end
    
    initial 
    begin
      #0 preset = 1'b0; clear = 1'b0; start = 1'b0; Write_Code = 1'b1; Read_En = 1'b0; address_input = 8'h00;
      #0 Code_address = 8'h00; Code_Data = 24'h07ccc9;
      #10 Code_address = 8'h01; Code_Data = 24'h080007;
      #10 Code_address = 8'h02; Code_Data = 24'h010001;
      #1 Code_address = 8'h03; Code_Data = 24'h030000;
      #10 Code_address = 8'h04; Code_Data = 24'h300006;
      #10 Code_address = 8'h05; Code_Data = 24'h800112;
      #10 Code_address = 8'h06; Code_Data = 24'h030002;
      #10 Code_address = 8'h07; Code_Data = 24'h6a0004;
      #10 Code_address = 8'h08; Code_Data = 24'h050a18; 
      #10 Code_address = 8'h09; Code_Data = 24'h610060;
      #10 Code_address = 8'h10; Code_Data = 24'hf00023;
      //#10 Code_address = 8'h08; Code_Data = 24'hf00032;
      #10 Code_address = 8'h11; Code_Data = 24'h020642;
      #10 Code_address = 8'h12; Code_Data = 24'h030662;
      #10 Code_address = 8'h60; Code_Data = 24'hf00820;
      #10 Code_address = 8'h0a; Code_Data = 24'h050022;
      #10 Code_address = 8'h0b; Code_Data = 24'h420023;
      #10 Code_address = 8'h24; Code_Data = 24'hf00101;
      #10 Code_address = 8'h0d; Code_Data = 24'h070667;
      
      #10 start = 1'b1; Write_Code = 1'b0;
      
      
      #50 address_input = 8'h00; Read_En = 1'b1; 
      #10 Read_En = 1'b0;

      #50 address_input = 8'h01;
      #50 address_input = 8'h02;
      #50 address_input = 8'h03;
      #50 address_input = 8'h32;
      #50 address_input = 8'h04;
      #50 address_input = 8'h05;
      #50 address_input = 8'h06;
      #150
      #50 address_input = 8'h07;
      #2  address_input = 8'h32;
      #30 address_input = 8'h08;
      #20 address_input = 8'h08;
      #50 address_input = 8'h62;
      #50 address_input = 8'h0a;
      #50 address_input = 8'h32;
      #50 address_input = 8'h33;
      #50 address_input = 8'h34;

          
      //#2000 $stop;
    end
    
endmodule