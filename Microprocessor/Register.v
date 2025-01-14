`timescale 1ns / 1ps

module d_latch (
    input d,       // 1-bit input pin for data
    input en,      // 1-bit input pin for enabling the latch
    output reg q   // 1-bit output pin for data output
);
    
    initial
    begin
      q = 0;
    end
    
    always @ (en or d)
        if (en)
          q  <= d;
          
endmodule

module accumulator(
    input [31:0] d,
    input en_H, en_L,
    output [31:0] out
    );
    
    d_latch inst0 (d[0], en_L, out[0]);
    d_latch inst1 (d[1], en_L, out[1]);
    d_latch inst2 (d[2], en_L, out[2]);
    d_latch inst3 (d[3], en_L, out[3]);

    d_latch inst4 (d[4], en_L, out[4]);
    d_latch inst5 (d[5], en_L, out[5]);
    d_latch inst6 (d[6], en_L, out[6]);
    d_latch inst7 (d[7], en_L, out[7]);

    d_latch inst8 (d[8], en_L, out[8]);
    d_latch inst9 (d[9], en_L, out[9]);
    d_latch inst10 (d[10], en_L, out[10]);
    d_latch inst11 (d[11], en_L, out[11]);
    
    d_latch inst12 (d[12], en_L, out[12]);
    d_latch inst13 (d[13], en_L, out[13]);
    d_latch inst14 (d[14], en_L, out[14]);
    d_latch inst15 (d[15], en_L, out[15]);
    
    
    
	d_latch inst16 (d[16], en_H, out[16]);
	d_latch inst17 (d[17], en_H, out[17]);
	d_latch inst18 (d[18], en_H, out[18]);
	d_latch inst19 (d[19], en_H, out[19]);
	
	d_latch inst20 (d[20], en_H, out[20]);
	d_latch inst21 (d[21], en_H, out[21]);
	d_latch inst22 (d[22], en_H, out[22]);
	d_latch inst23 (d[23], en_H, out[23]);
	
	d_latch inst24 (d[24], en_H, out[24]);
	d_latch inst25 (d[25], en_H, out[25]);
	d_latch inst26 (d[26], en_H, out[26]);
	d_latch inst27 (d[27], en_H, out[27]);
	
	d_latch inst28 (d[28], en_H, out[28]);
	d_latch inst29 (d[29], en_H, out[29]);
	d_latch inst30 (d[30], en_H, out[30]);
	d_latch inst31 (d[31], en_H, out[31]);
    
endmodule

module reg_32bit(
    input [15:0] d,
    input en_H, en_L,
    output [31:0] out
    );
    
    d_latch inst0 (d[0], en_L, out[0]);
    d_latch inst1 (d[1], en_L, out[1]);
    d_latch inst2 (d[2], en_L, out[2]);
    d_latch inst3 (d[3], en_L, out[3]);

    d_latch inst4 (d[4], en_L, out[4]);
    d_latch inst5 (d[5], en_L, out[5]);
    d_latch inst6 (d[6], en_L, out[6]);
    d_latch inst7 (d[7], en_L, out[7]);

    d_latch inst8 (d[8], en_L, out[8]);
    d_latch inst9 (d[9], en_L, out[9]);
    d_latch inst10 (d[10], en_L, out[10]);
    d_latch inst11 (d[11], en_L, out[11]);
    
    d_latch inst12 (d[12], en_L, out[12]);
    d_latch inst13 (d[13], en_L, out[13]);
    d_latch inst14 (d[14], en_L, out[14]);
    d_latch inst15 (d[15], en_L, out[15]);
    
    
    
	d_latch inst16 (d[0], en_H, out[16]);
	d_latch inst17 (d[1], en_H, out[17]);
	d_latch inst18 (d[2], en_H, out[18]);
	d_latch inst19 (d[3], en_H, out[19]);
	
	d_latch inst20 (d[4], en_H, out[20]);
	d_latch inst21 (d[5], en_H, out[21]);
	d_latch inst22 (d[6], en_H, out[22]);
	d_latch inst23 (d[7], en_H, out[23]);
	
	d_latch inst24 (d[8], en_H, out[24]);
	d_latch inst25 (d[9], en_H, out[25]);
	d_latch inst26 (d[10], en_H, out[26]);
	d_latch inst27 (d[11], en_H, out[27]);
	
	d_latch inst28 (d[12], en_H, out[28]);
	d_latch inst29 (d[13], en_H, out[29]);
	d_latch inst30 (d[14], en_H, out[30]);
	d_latch inst31 (d[15], en_H, out[31]);
    
endmodule

module demux4x8(
    input D,
    input [3:0] sel,
    output [7:0] out
    );
    
    and (out[0] , ~sel[3], ~sel[2], ~sel[1], sel[0], D);
    and (out[1] , ~sel[3], ~sel[2], sel[1], ~sel[0], D);
    and (out[2] , ~sel[3], ~sel[2], sel[1], sel[0], D);
    and (out[3] , ~sel[3], sel[2], ~sel[1], ~sel[0], D);
    
    and (out[4] , ~sel[3], sel[2], ~sel[1], sel[0], D);
    and (out[5] , ~sel[3], sel[2], sel[1], ~sel[0], D);
    and (out[6] , ~sel[3], sel[2], sel[1], sel[0], D);
    and (out[7] , sel[3], ~sel[2], ~sel[1], ~sel[0], D);

    
endmodule

module mux_32bit(
    input [15:0] reg_data_16bit,
    input [31:0] alu_32bit_input,
    input ready_flag,
    output [31:0] acc_in
    );
    
	and (net1, reg_data_16bit[0], ~ready_flag);
	and (net2, alu_32bit_input[0], ready_flag);
	or (acc_in[0], net2, net1);
	
	and (net3, reg_data_16bit[1], ~ready_flag);
	and (net4, alu_32bit_input[1], ready_flag);
	or (acc_in[1], net4, net3);
	
	and (net5, reg_data_16bit[2], ~ready_flag);
	and (net6, alu_32bit_input[2], ready_flag);
	or (acc_in[2], net6, net5);
	
	and (net7, reg_data_16bit[3], ~ready_flag);
	and (net8, alu_32bit_input[3], ready_flag);
	or (acc_in[3], net8, net7);
	
	and (net9, reg_data_16bit[4], ~ready_flag);
	and (net10, alu_32bit_input[4], ready_flag);
	or (acc_in[4], net10, net9);
	
	and (net11, reg_data_16bit[5], ~ready_flag);
	and (net12, alu_32bit_input[5], ready_flag);
	or (acc_in[5], net12, net11);
	
	and (net13, reg_data_16bit[6], ~ready_flag);
	and (net14, alu_32bit_input[6], ready_flag);
	or (acc_in[6], net14, net13);
	
	and (net15, reg_data_16bit[7], ~ready_flag);
	and (net16, alu_32bit_input[7], ready_flag);
	or (acc_in[7], net16, net15);
	
	and (net17, reg_data_16bit[8], ~ready_flag);
	and (net18, alu_32bit_input[8], ready_flag);
	or (acc_in[8], net18, net17);
	
	and (net19, reg_data_16bit[9], ~ready_flag);
	and (net20, alu_32bit_input[9], ready_flag);
	or (acc_in[9], net20, net19);
	
	and (net21, reg_data_16bit[10], ~ready_flag);
	and (net22, alu_32bit_input[10], ready_flag);
	or (acc_in[10], net22, net21);
	
	and (net23, reg_data_16bit[11], ~ready_flag);
	and (net24, alu_32bit_input[11], ready_flag);
	or (acc_in[11], net24, net23);
	
	and (net25, reg_data_16bit[12], ~ready_flag);
	and (net26, alu_32bit_input[12], ready_flag);
	or (acc_in[12], net26, net25);
	
	and (net27, reg_data_16bit[13], ~ready_flag);
	and (net28, alu_32bit_input[13], ready_flag);
	or (acc_in[13], net27, net28);
	
	and (net29, reg_data_16bit[14], ~ready_flag);
	and (net30, alu_32bit_input[14], ready_flag);
	or (acc_in[14], net30, net29);
	
	and (net31, reg_data_16bit[15], ~ready_flag);
	and (net32, alu_32bit_input[15], ready_flag);
	or (acc_in[15], net32, net31);

    
    
	
	and (net33, reg_data_16bit[0], ~ready_flag);
	and (net34, alu_32bit_input[16], ready_flag);
	or (acc_in[16], net34, net33);
	
	and (net35, reg_data_16bit[1], ~ready_flag);
	and (net36, alu_32bit_input[17], ready_flag);
	or (acc_in[17], net36, net35);
	
	and (net37, reg_data_16bit[2], ~ready_flag);
	and (net38, alu_32bit_input[18], ready_flag);
	or (acc_in[18], net38, net37);
	
	and (net39, reg_data_16bit[3], ~ready_flag);
	and (net40, alu_32bit_input[19], ready_flag);
	or (acc_in[19], net40, net39);
	
	and (net41, reg_data_16bit[4], ~ready_flag);
	and (net42, alu_32bit_input[20], ready_flag);
	or (acc_in[20], net42, net41);
	
	and (net43, reg_data_16bit[5], ~ready_flag);
	and (net44, alu_32bit_input[21], ready_flag);
	or (acc_in[21], net44, net43);
	
	and (net45, reg_data_16bit[6], ~ready_flag);
	and (net46, alu_32bit_input[22], ready_flag);
	or (acc_in[22], net46, net45);
	
	and (net47, reg_data_16bit[7], ~ready_flag);
	and (net48, alu_32bit_input[23], ready_flag);
	or (acc_in[23], net48, net47);
	
	and (net49, reg_data_16bit[8], ~ready_flag);
	and (net50, alu_32bit_input[24], ready_flag);
	or (acc_in[24], net50, net49);
	
	and (net51, reg_data_16bit[9], ~ready_flag);
	and (net52, alu_32bit_input[25], ready_flag);
	or (acc_in[25], net52, net51);
	
	and (net53, reg_data_16bit[10], ~ready_flag);
	and (net54, alu_32bit_input[26], ready_flag);
	or (acc_in[26], net54, net53);
	
	and (net55, reg_data_16bit[11], ~ready_flag);
	and (net56, alu_32bit_input[27], ready_flag);
	or (acc_in[27], net56, net55);
	
	and (net57, reg_data_16bit[12], ~ready_flag);
	and (net58, alu_32bit_input[28], ready_flag);
	or (acc_in[28], net58, net57);
	
	and (net59, reg_data_16bit[13], ~ready_flag);
	and (net60, alu_32bit_input[29], ready_flag);
	or (acc_in[29], net60, net59);
	
	and (net61, reg_data_16bit[14], ~ready_flag);
	and (net62, alu_32bit_input[30], ready_flag);
	or (acc_in[30], net62, net61);
	
	and (net63, reg_data_16bit[15], ~ready_flag);
	and (net64, alu_32bit_input[31], ready_flag);
	or (acc_in[31], net64, net63);

endmodule

module mux_4X32bit(
    input [31:0] register_A1, register_B1, register_C1, register_D1,
    input [1:0] reg_data_sel_in,
    output [31:0] reg_data_in
    );
    

	and (net1, register_A1[0], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net2, register_B1[0], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net3, register_C1[0], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net4, register_D1[0], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[0], net4, net3, net2, net1);

	and (net5, register_A1[1], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net6, register_B1[1], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net7, register_C1[1], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net8, register_D1[1], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[1], net8, net7, net6, net5);

	and (net9, register_A1[2], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net10, register_B1[2], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net11, register_C1[2], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net12, register_D1[2], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[2], net12, net11, net10, net9);

	and (net13, register_A1[3], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net14, register_B1[3], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net15, register_C1[3], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net16, register_D1[3], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[3], net16, net15, net14, net13);

	and (net17, register_A1[4], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net18, register_B1[4], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net19, register_C1[4], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net20, register_D1[4], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[4], net20, net19, net18, net17);

	and (net21, register_A1[5], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net22, register_B1[5], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net23, register_C1[5], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net24, register_D1[5], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[5], net24, net23, net22, net21);

	and (net25, register_A1[6], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net26, register_B1[6], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net27, register_C1[6], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net28, register_D1[6], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[6], net28, net27, net26, net25);

	and (net29, register_A1[7], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net30, register_B1[7], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net31, register_C1[7], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net32, register_D1[7], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[7], net32, net31, net30, net29);

	and (net33, register_A1[8], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net34, register_B1[8], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net35, register_C1[8], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net36, register_D1[8], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[8], net36, net35, net34, net33);

	and (net37, register_A1[9], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net38, register_B1[9], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net39, register_C1[9], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net40, register_D1[9], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[9], net40, net39, net38, net37);

	and (net41, register_A1[10], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net42, register_B1[10], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net43, register_C1[10], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net44, register_D1[10], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[10], net44, net43, net42, net41);

	and (net45, register_A1[11], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net46, register_B1[11], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net47, register_C1[11], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net48, register_D1[11], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[11], net48, net47, net46, net45);

	and (net49, register_A1[12], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net50, register_B1[12], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net51, register_C1[12], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net52, register_D1[12], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[12], net52, net51, net50, net49);

	and (net53, register_A1[13], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net54, register_B1[13], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net55, register_C1[13], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net56, register_D1[13], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[13], net56, net55, net54, net53);

	and (net57, register_A1[14], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net58, register_B1[14], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net59, register_C1[14], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net60, register_D1[14], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[14], net60, net59, net58, net57);

	and (net61, register_A1[15], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net62, register_B1[15], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net63, register_C1[15], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net64, register_D1[15], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[15], net64, net63, net62, net61);

	and (net65, register_A1[16], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net66, register_B1[16], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net67, register_C1[16], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net68, register_D1[16], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[16], net68, net67, net66, net65);

	and (net69, register_A1[17], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net70, register_B1[17], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net71, register_C1[17], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net72, register_D1[17], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[17], net72, net71, net70, net69);

	and (net73, register_A1[18], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net74, register_B1[18], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net75, register_C1[18], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net76, register_D1[18], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[18], net76, net75, net74, net73);

	and (net77, register_A1[19], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net78, register_B1[19], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net79, register_C1[19], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net80, register_D1[19], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[19], net80, net79, net78, net77);

	and (net81, register_A1[20], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net82, register_B1[20], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net83, register_C1[20], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net84, register_D1[20], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[20], net84, net83, net82, net81);

	and (net85, register_A1[21], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net86, register_B1[21], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net87, register_C1[21], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net88, register_D1[21], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[21], net88, net87, net86, net85);

	and (net89, register_A1[22], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net90, register_B1[22], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net91, register_C1[22], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net92, register_D1[22], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[22], net92, net91, net90, net89);

	and (net93, register_A1[23], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net94, register_B1[23], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net95, register_C1[23], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net96, register_D1[23], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[23], net96, net95, net94, net93);

	and (net97, register_A1[24], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net98, register_B1[24], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net99, register_C1[24], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net100, register_D1[24], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[24], net100, net99, net98, net97);

	and (net101, register_A1[25], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net102, register_B1[25], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net103, register_C1[25], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net104, register_D1[25], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[25], net104, net103, net102, net101);

	and (net105, register_A1[26], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net106, register_B1[26], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net107, register_C1[26], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net108, register_D1[26], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[26], net108, net107, net106, net105);

	and (net109, register_A1[27], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net110, register_B1[27], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net111, register_C1[27], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net112, register_D1[27], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[27], net112, net111, net110, net109);

	and (net113, register_A1[28], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net114, register_B1[28], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net115, register_C1[28], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net116, register_D1[28], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[28], net116, net115, net114, net113);

	and (net117, register_A1[29], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net118, register_B1[29], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net119, register_C1[29], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net120, register_D1[29], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[29], net120, net119, net118, net117);

	and (net121, register_A1[30], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net122, register_B1[30], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net123, register_C1[30], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net124, register_D1[30], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[30], net124, net123, net122, net121);

	and (net125, register_A1[31], ~reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net126, register_B1[31], ~reg_data_sel_in[1], reg_data_sel_in[0]);
	and (net127, register_C1[31], reg_data_sel_in[1], ~reg_data_sel_in[0]);
	and (net128, register_D1[31], reg_data_sel_in[1], reg_data_sel_in[0]);
	or (reg_data_in[31], net128, net127, net126, net125);
	
endmodule

module register(
    input [15:0] Ram_data,
    input [31:0] alu_32bit_input,
    input ready_flag,
    input [3:0] reg_data_sel,
    input reg_D,
    input [1:0] reg_data_sel_in,
    output [31:0] register_A1, register_B1, register_C1, register_D1,
    output [31:0] reg_data_in
    );
    
    wire [7:0] en_sel;
    wire [31:0] acc_in;
    wire en_H, en_L;
    wire ready_flag_I;
    
    demux4x8 enable_select (reg_D, reg_data_sel, en_sel);
    
    or (en_L, ~ready_flag, en_sel[0]);
    or (en_H, ~ready_flag, en_sel[1]);
    not (ready_flag_I,ready_flag);
    
    mux_32bit inst077 (Ram_data, alu_32bit_input, ready_flag_I, acc_in);
    
    mux_4X32bit inst012 (register_A1, register_B1, register_C1, register_D1, reg_data_sel_in, reg_data_in);
    
    accumulator register_A (acc_in, en_H, en_L, register_A1);
    reg_32bit register_B (Ram_data, en_sel[3], en_sel[2], register_B1);
    reg_32bit register_C (Ram_data, en_sel[5], en_sel[4], register_C1);
    reg_32bit register_D (Ram_data, en_sel[7], en_sel[6], register_D1);
    
endmodule