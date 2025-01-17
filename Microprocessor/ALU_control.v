`timescale 1ns / 1ps

module mux_3x6(
    input [31:0] reg_a, reg_b, reg_c, reg_d,
    input [7:0] Mnemonics,
    input s2, s1, s0,
    output reg [31:0] out_1, out_2
    );
      /*
    reg set = 1'b1;
    reg [31:0] data_set = 32'h0000_0000;
    wire [31:0] out_1_0, out_1_1, out_1_2, out_1_3, out_1_4, out_1_5;
    wire [31:0] out_2_0, out_2_1, out_2_2, out_2_3, out_2_4, out_2_5;
    
    mux_data_sel inst0 (reg_a, set, ~s2, ~s1, ~s0, out_1_0);
    mux_data_sel inst1 (reg_a, set, ~s2, ~s1, s0, out_1_1);
    mux_data_sel inst2 (reg_a, set, ~s2, s1, ~s0, out_1_2);
    
    mux_data_sel inst3 (reg_b, set, ~s2, s1, s0, out_1_3);
    mux_data_sel inst4 (reg_b, set, s2, ~s1, ~s0, out_1_4);
    mux_data_sel inst5 (reg_c, set, s2, ~s1, s0, out_1_5);
    
    mux_or_data_sel inst20 (out_1_0, out_1_1, out_1_2, out_1_3, out_1_4, out_1_5, data_set, data_set, data_set, out_1);
    
    
    mux_data_sel inst6 (reg_b, set, ~s2, ~s1, ~s0, out_2_0);
    mux_data_sel inst7 (reg_c, set, ~s2, ~s1, s0, out_2_1);
    mux_data_sel inst8 (reg_d, set, ~s2, s1, ~s0, out_2_2);
    
    mux_data_sel inst9 (reg_c, set, ~s2, s1, s0, out_2_3);
    mux_data_sel inst10 (reg_d, set, s2, ~s1, ~s0, out_2_4);
    mux_data_sel inst11 (reg_d, set, s2, ~s1, s0, out_2_5);
    
    mux_or_data_sel inst30 (out_2_0, out_2_1, out_2_2, out_2_3, out_2_4, out_2_5, data_set, data_set, data_set, out_2);
        */ 
   
     always @(s2 or s1 or s0 or Mnemonics)
     begin
     case ({s2, s1, s0})
     
     3'b000: out_1 = reg_a;
    
     
     3'b001: out_1 = reg_a;
    
     
     3'b010: out_1 = reg_a;
    
     
     3'b011: out_1 = reg_b;
    
     
     3'b100: out_1 = reg_b;
    
     
     3'b101: out_1 = reg_c;
     
     default: out_1 = 32'h0000_0000;
    
     endcase
     end
     
     always @(s2 or s1 or s0 or Mnemonics)
     begin
     case ({s2, s1, s0})
    
     3'b000: out_2 = reg_b;
     
     
     3'b001: out_2 = reg_c;
     
    
     3'b010: out_2 = reg_d;
     
    
     3'b011: out_2 = reg_c;
     
    
     3'b100: out_2 = reg_d;
     
    
     3'b101: out_2 = reg_d;
     
     default: out_2 = 32'h0000_0000;
     endcase
     end   
     
endmodule
    
module mux_2x3(
    input [31:0] reg_a, reg_b, reg_c, reg_d,
    input [7:0] Mnemonics,
    input s1, s0,
    output reg [31:0] out_1, out_2
    );
    /*
    reg set = 1'b1;
    reg [31:0] data_set = 32'h0000_0000;
    wire [31:0] out_1_3, out_1_4, out_1_5;
    
    mux_data_sel inst0 (reg_a, set, set, set, set, out_1);
    
    
    mux_data_sel inst1 (reg_b, set, set, ~s1, ~s0, out_1_3);
    mux_data_sel inst2 (reg_c, set, set, ~s1, s0, out_1_4);
    mux_data_sel inst3 (reg_d, set, set, s1, ~s0, out_1_5);
    
    mux_or_data_sel inst20 (out_1_3, out_1_4, out_1_5, data_set, data_set, data_set, data_set, data_set, data_set, out_2);
    
    */
    
    
     always @ (Mnemonics)
     begin
     out_1 = reg_a;
     end 
     
     always @(s1 or s0 or Mnemonics)
     begin
     case ({s1, s0})
    
     2'b00: out_2 = reg_b;
     
    
     2'b01: out_2 = reg_c;
     
    
     2'b10: out_2 = reg_d;
     
     default: out_2 = 32'h0000_0000;
     
     endcase
     end  
     
endmodule

module mux_1x4(
    input [31:0] reg_a, reg_b, reg_c, reg_d,
    input [7:0] Mnemonics,
    input s1, s0,
    output reg [31:0] out_1
    );
    /*
    reg set = 1'b1;
    reg [31:0] data_set = 32'h0000_0000;
    wire [31:0] out_1_3, out_1_4, out_1_5, out_1_6;
    
    
    mux_data_sel inst1 (reg_a, set, set, ~s1, ~s0, out_1_3);
    mux_data_sel inst2 (reg_b, set, set, ~s1, s0, out_1_4);
    mux_data_sel inst3 (reg_c, set, set, s1, ~s0, out_1_5);
    mux_data_sel inst4 (reg_d, set, set, s1, s0, out_1_6);
    
    mux_or_data_sel inst20 (out_1_3, out_1_4, out_1_5, out_1_6, data_set, data_set, data_set, data_set, data_set, out_1);
    */
    
     always @(s1 or s0 or Mnemonics)
     begin
     case ({s1, s0})
     2'b00: out_1 = reg_a;
     
     2'b01: out_1 = reg_b;
     
     2'b10: out_1 = reg_c;
     
     2'b11: out_1 = reg_d;
     
     default: out_1 = 32'h0000_0000;
     
     endcase
     end     
 
endmodule

module mux_data_sel(
    input [31:0] int_1,
    input s3, s2, s1, s0,
    output [31:0] out
    );
    
	and (out[0], s3, s2, s1, s0, int_1[0]);
	and (out[1], s3, s2, s1, s0, int_1[1]);
	and (out[2], s3, s2, s1, s0, int_1[2]);
	and (out[3], s3, s2, s1, s0, int_1[3]);
	and (out[4], s3, s2, s1, s0, int_1[4]);
	and (out[5], s3, s2, s1, s0, int_1[5]);
	and (out[6], s3, s2, s1, s0, int_1[6]);
	and (out[7], s3, s2, s1, s0, int_1[7]);
	and (out[8], s3, s2, s1, s0, int_1[8]);
	and (out[9], s3, s2, s1, s0, int_1[9]);
	and (out[10], s3, s2, s1, s0, int_1[10]);
	and (out[11], s3, s2, s1, s0, int_1[11]);
	and (out[12], s3, s2, s1, s0, int_1[12]);
	and (out[13], s3, s2, s1, s0, int_1[13]);
	and (out[14], s3, s2, s1, s0, int_1[14]);
	and (out[15], s3, s2, s1, s0, int_1[15]);
	and (out[16], s3, s2, s1, s0, int_1[16]);
	and (out[17], s3, s2, s1, s0, int_1[17]);
	and (out[18], s3, s2, s1, s0, int_1[18]);
	and (out[19], s3, s2, s1, s0, int_1[19]);
	and (out[20], s3, s2, s1, s0, int_1[20]);
	and (out[21], s3, s2, s1, s0, int_1[21]);
	and (out[22], s3, s2, s1, s0, int_1[22]);
	and (out[23], s3, s2, s1, s0, int_1[23]);
	and (out[24], s3, s2, s1, s0, int_1[24]);
	and (out[25], s3, s2, s1, s0, int_1[25]);
	and (out[26], s3, s2, s1, s0, int_1[26]);
	and (out[27], s3, s2, s1, s0, int_1[27]);
	and (out[28], s3, s2, s1, s0, int_1[28]);
	and (out[29], s3, s2, s1, s0, int_1[29]);
	and (out[30], s3, s2, s1, s0, int_1[30]);
	and (out[31], s3, s2, s1, s0, int_1[31]);

endmodule

module mux_or_data_sel(
    input [31:0] data_I_0, data_I_1, data_I_2, data_I_3, data_I_4, data_I_5, data_I_6, data_I_7, data_I_8,
    output [31:0] data_I
    );
   
	or (data_I[0], data_I_0[0], data_I_1[0], data_I_2[0], data_I_3[0], data_I_4[0], data_I_5[0], data_I_6[0], data_I_7[0], data_I_8[0]);
	or (data_I[1], data_I_0[1], data_I_1[1], data_I_2[1], data_I_3[1], data_I_4[1], data_I_5[1], data_I_6[1], data_I_7[1], data_I_8[1]);
	or (data_I[2], data_I_0[2], data_I_1[2], data_I_2[2], data_I_3[2], data_I_4[2], data_I_5[2], data_I_6[2], data_I_7[2], data_I_8[2]);
	or (data_I[3], data_I_0[3], data_I_1[3], data_I_2[3], data_I_3[3], data_I_4[3], data_I_5[3], data_I_6[3], data_I_7[3], data_I_8[3]);
	or (data_I[4], data_I_0[4], data_I_1[4], data_I_2[4], data_I_3[4], data_I_4[4], data_I_5[4], data_I_6[4], data_I_7[4], data_I_8[4]);
	or (data_I[5], data_I_0[5], data_I_1[5], data_I_2[5], data_I_3[5], data_I_4[5], data_I_5[5], data_I_6[5], data_I_7[5], data_I_8[5]);
	or (data_I[6], data_I_0[6], data_I_1[6], data_I_2[6], data_I_3[6], data_I_4[6], data_I_5[6], data_I_6[6], data_I_7[6], data_I_8[6]);
	or (data_I[7], data_I_0[7], data_I_1[7], data_I_2[7], data_I_3[7], data_I_4[7], data_I_5[7], data_I_6[7], data_I_7[7], data_I_8[7]);
	or (data_I[8], data_I_0[8], data_I_1[8], data_I_2[8], data_I_3[8], data_I_4[8], data_I_5[8], data_I_6[8], data_I_7[8], data_I_8[8]);
	or (data_I[9], data_I_0[9], data_I_1[9], data_I_2[9], data_I_3[9], data_I_4[9], data_I_5[9], data_I_6[9], data_I_7[9], data_I_8[9]);
	or (data_I[10], data_I_0[10], data_I_1[10], data_I_2[10], data_I_3[10], data_I_4[10], data_I_5[10], data_I_6[10], data_I_7[10], data_I_8[10]);
	or (data_I[11], data_I_0[11], data_I_1[11], data_I_2[11], data_I_3[11], data_I_4[11], data_I_5[11], data_I_6[11], data_I_7[11], data_I_8[11]);
	or (data_I[12], data_I_0[12], data_I_1[12], data_I_2[12], data_I_3[12], data_I_4[12], data_I_5[12], data_I_6[12], data_I_7[12], data_I_8[12]);
	or (data_I[13], data_I_0[13], data_I_1[13], data_I_2[13], data_I_3[13], data_I_4[13], data_I_5[13], data_I_6[13], data_I_7[13], data_I_8[13]);
	or (data_I[14], data_I_0[14], data_I_1[14], data_I_2[14], data_I_3[14], data_I_4[14], data_I_5[14], data_I_6[14], data_I_7[14], data_I_8[14]);
	or (data_I[15], data_I_0[15], data_I_1[15], data_I_2[15], data_I_3[15], data_I_4[15], data_I_5[15], data_I_6[15], data_I_7[15], data_I_8[15]);
	or (data_I[16], data_I_0[16], data_I_1[16], data_I_2[16], data_I_3[16], data_I_4[16], data_I_5[16], data_I_6[16], data_I_7[16], data_I_8[16]);
	or (data_I[17], data_I_0[17], data_I_1[17], data_I_2[17], data_I_3[17], data_I_4[17], data_I_5[17], data_I_6[17], data_I_7[17], data_I_8[17]);
	or (data_I[18], data_I_0[18], data_I_1[18], data_I_2[18], data_I_3[18], data_I_4[18], data_I_5[18], data_I_6[18], data_I_7[18], data_I_8[18]);
	or (data_I[19], data_I_0[19], data_I_1[19], data_I_2[19], data_I_3[19], data_I_4[19], data_I_5[19], data_I_6[19], data_I_7[19], data_I_8[19]);
	or (data_I[20], data_I_0[20], data_I_1[20], data_I_2[20], data_I_3[20], data_I_4[20], data_I_5[20], data_I_6[20], data_I_7[20], data_I_8[20]);
	or (data_I[21], data_I_0[21], data_I_1[21], data_I_2[21], data_I_3[21], data_I_4[21], data_I_5[21], data_I_6[21], data_I_7[21], data_I_8[21]);
	or (data_I[22], data_I_0[22], data_I_1[22], data_I_2[22], data_I_3[22], data_I_4[22], data_I_5[22], data_I_6[22], data_I_7[22], data_I_8[22]);
	or (data_I[23], data_I_0[23], data_I_1[23], data_I_2[23], data_I_3[23], data_I_4[23], data_I_5[23], data_I_6[23], data_I_7[23], data_I_8[23]);
	or (data_I[24], data_I_0[24], data_I_1[24], data_I_2[24], data_I_3[24], data_I_4[24], data_I_5[24], data_I_6[24], data_I_7[24], data_I_8[24]);
	or (data_I[25], data_I_0[25], data_I_1[25], data_I_2[25], data_I_3[25], data_I_4[25], data_I_5[25], data_I_6[25], data_I_7[25], data_I_8[25]);
	or (data_I[26], data_I_0[26], data_I_1[26], data_I_2[26], data_I_3[26], data_I_4[26], data_I_5[26], data_I_6[26], data_I_7[26], data_I_8[26]);
	or (data_I[27], data_I_0[27], data_I_1[27], data_I_2[27], data_I_3[27], data_I_4[27], data_I_5[27], data_I_6[27], data_I_7[27], data_I_8[27]);
	or (data_I[28], data_I_0[28], data_I_1[28], data_I_2[28], data_I_3[28], data_I_4[28], data_I_5[28], data_I_6[28], data_I_7[28], data_I_8[28]);
	or (data_I[29], data_I_0[29], data_I_1[29], data_I_2[29], data_I_3[29], data_I_4[29], data_I_5[29], data_I_6[29], data_I_7[29], data_I_8[29]);
	or (data_I[30], data_I_0[30], data_I_1[30], data_I_2[30], data_I_3[30], data_I_4[30], data_I_5[30], data_I_6[30], data_I_7[30], data_I_8[30]);
	or (data_I[31], data_I_0[31], data_I_1[31], data_I_2[31], data_I_3[31], data_I_4[31], data_I_5[31], data_I_6[31], data_I_7[31], data_I_8[31]);
       
endmodule

module ALU_Control (
    input [7:0] Mnemonics,
    input [31:0] reg_a, reg_b, reg_c, reg_d,
    output [31:0] data_I, data_II,
    output reg [3:0] sel 
     );
 
     wire sel_2, sel_1, sel_0;
     wire [31:0] out_2, out_3, out_4, out_5;
     wire [31:0] out_1;
     
     wire [31:0] data_I_0, data_I_1, data_I_2, data_I_3, data_I_4, data_I_5, data_I_6, data_I_7, data_I_8;
     wire [31:0] data_II_1, data_II_2, data_II_3, data_II_4, data_II_5, data_II_6, data_II_7;
     reg [31:0] zer = 32'h0000_0000;
     
     mux_3x6 inst0 (reg_a, reg_b, reg_c, reg_d, Mnemonics, Mnemonics[2], Mnemonics[1], Mnemonics[0], out_1, out_2);
     
     mux_2x3 inst1 (reg_a, reg_b, reg_c, reg_d, Mnemonics, Mnemonics[1], Mnemonics[0], out_3, out_4);
     
     mux_1x4 inst2 (reg_a, reg_b, reg_c, reg_d, Mnemonics, Mnemonics[1], Mnemonics[0], out_5);
     
     //for data_I selection
     mux_data_sel inst10 (out_1, Mnemonics[7], ~Mnemonics[6], ~Mnemonics[5], ~Mnemonics[4], data_I_0);
     mux_data_sel inst11 (out_1, Mnemonics[7], ~Mnemonics[6], ~Mnemonics[5], Mnemonics[4], data_I_1);
     
     mux_data_sel inst12 (out_3, Mnemonics[7], ~Mnemonics[6], Mnemonics[5], ~Mnemonics[4], data_I_2);
     mux_data_sel inst13 (out_3, Mnemonics[7], ~Mnemonics[6], Mnemonics[5], Mnemonics[4], data_I_3);
     
     mux_data_sel inst14 (out_5, Mnemonics[7], Mnemonics[6], ~Mnemonics[5], ~Mnemonics[4], data_I_4);
     mux_data_sel inst15 (out_5, Mnemonics[7], Mnemonics[6], ~Mnemonics[5], Mnemonics[4], data_I_5);
     
     mux_data_sel inst16 (out_1, ~Mnemonics[7], Mnemonics[6], ~Mnemonics[5], ~Mnemonics[4], data_I_6);
     mux_data_sel inst17 (out_1, ~Mnemonics[7], Mnemonics[6], ~Mnemonics[5], Mnemonics[4], data_I_7);
     mux_data_sel inst18 (out_1, ~Mnemonics[7], Mnemonics[6], Mnemonics[5], ~Mnemonics[4], data_I_8);
     
     mux_or_data_sel inst20 (data_I_0, data_I_1, data_I_2, data_I_3, data_I_4, data_I_5, data_I_6, data_I_7, data_I_8, data_I);
     
     //for data_II selection
     mux_data_sel inst22 (out_2, Mnemonics[7], ~Mnemonics[6], ~Mnemonics[5], ~Mnemonics[4], data_II_1);
     mux_data_sel inst23 (out_2, Mnemonics[7], ~Mnemonics[6], ~Mnemonics[5], Mnemonics[4], data_II_2);
     
     mux_data_sel inst24 (out_4, Mnemonics[7], ~Mnemonics[6], Mnemonics[5], ~Mnemonics[4], data_II_3);
     mux_data_sel inst25 (out_4, Mnemonics[7], ~Mnemonics[6], Mnemonics[5], Mnemonics[4], data_II_4);
     
     mux_data_sel inst26 (out_2, ~Mnemonics[7], Mnemonics[6], ~Mnemonics[5], ~Mnemonics[4], data_II_5);
     mux_data_sel inst27 (out_2, ~Mnemonics[7], Mnemonics[6], ~Mnemonics[5], Mnemonics[4], data_II_6);
     mux_data_sel inst28 (out_2, ~Mnemonics[7], Mnemonics[6], Mnemonics[5], ~Mnemonics[4], data_II_7);
     
     mux_or_data_sel inst30 (zer, data_II_1, data_II_2, data_II_3, data_II_4, data_II_5, data_II_6, data_II_7, zer, data_II);
     
     /*always @ (Mnemonics)
     begin
     case ({Mnemonics[7], Mnemonics[6], Mnemonics[5], Mnemonics[4]})
     
     4'b1000: data_I = out_1;
     4'b1001: data_I = out_1;
    
     4'b1010: data_I = out_3;
     4'b1011: data_I = out_3;
     
    
     4'b1100: data_I = out_5;
     4'b1101: data_I = out_5;
     
     
     4'b0100: data_I = out_1;
     4'b0101: data_I = out_1;
     4'b0110: data_I = out_1;
     
     default: data_I = 32'h0000_0000;
     
     endcase
     end
     
     always @ (Mnemonics)
     begin
     case ({Mnemonics[7], Mnemonics[6], Mnemonics[5], Mnemonics[4]})
     
     4'b1000: data_II = out_2;
     4'b1001: data_II = out_2;
    
     4'b1010: data_II = out_4;
     4'b1011: data_II = out_4;
     
     4'b0100: data_II = out_2;
     4'b0101: data_II = out_2;
     4'b0110: data_II = out_2;
     
     default: data_II = 32'h0000_0000;
     
     endcase
     end */
     
     
     always @ (Mnemonics)
     begin
     case ({Mnemonics[7], Mnemonics[6], Mnemonics[5], Mnemonics[4], Mnemonics[3], Mnemonics[2]})
     
     6'b1000_00: sel = 4'b0001; //ADD address selection
     6'b1000_01: sel = 4'b0001;
     
     6'b1000_10: sel = 4'b0000; //Subtraction address selection
     6'b1000_11: sel = 4'b0000;
     
     6'b1001_00: sel = 4'b0010; //Multiplication address selection
     6'b1001_01: sel = 4'b0010;
     
     6'b1001_10: sel = 4'b0011; //Division address selection
     6'b1001_11: sel = 4'b0011; 
    
     6'b1010_00: sel = 4'b0101; //AND Bitwise address selection
     6'b1010_01: sel = 4'b0110; //OR Bitwise address selection
     
     6'b1010_10: sel = 4'b0111; //NAND Bitwise address selection
     6'b1010_11: sel = 4'b1000; //NOR Bitwise address selection
     
     6'b1011_00: sel = 4'b1001; //XOR Bitwise address selection
     6'b1011_01: sel = 4'b1010; //XNOR Bitwise address selection
     
     6'b1011_10: sel = 4'b1100; //Logical AND operation address selection
     6'b1011_11: sel = 4'b1101; //Logical OR operation address selection
     
     6'b1100_00: sel = 4'b1011; //Negation operation address selection
     6'b1100_01: sel = 4'b1110; //Shift left operation address selection
     6'b1100_10: sel = 4'b1111; //Shift right operation address selection
     
     endcase
     end
 
 
endmodule
