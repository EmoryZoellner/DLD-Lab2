/*
 Data Encryption Standard (S-DES)
 64-bit 16-round block cipher encryption and decryption algorithm 
 using 56-bit key (64-bit key with Parity).
 */

module GenerateKeys (Key, SubKey1, SubKey2, SubKey3, SubKey4,
		     SubKey5, SubKey6, SubKey7, SubKey8,
		     SubKey9, SubKey10, SubKey11, SubKey12,
		     SubKey13, SubKey14, SubKey15, SubKey16);
   
   // Generate SubKeys
   input logic [63:0]  Key;
   output logic [47:0] SubKey1;
   output logic [47:0] SubKey2;
   output logic [47:0] SubKey3;
   output logic [47:0] SubKey4;
   output logic [47:0] SubKey5;
   output logic [47:0] SubKey6;
   output logic [47:0] SubKey7;
   output logic [47:0] SubKey8;
   output logic [47:0] SubKey9;
   output logic [47:0] SubKey10;
   output logic [47:0] SubKey11;
   output logic [47:0] SubKey12;
   output logic [47:0] SubKey13;
   output logic [47:0] SubKey14;
   output logic [47:0] SubKey15;
   output logic [47:0] SubKey16;

   logic [27:0] left1,left_shifted1,left_shifted2,left_shifted3,left_shifted4,left_shifted5,left_shifted6,left_shifted7,
   	left_shifted8,left_shifted9,left_shifted10,left_shifted11,left_shifted12,left_shifted13,left_shifted14,left_shifted15,left_shifted16;
	logic [27:0] right1,right_shifted1,right_shifted2,right_shifted3,right_shifted4,right_shifted5,right_shifted6,right_shifted7,
   	right_shifted8,right_shifted9,right_shifted10,right_shifted11,right_shifted12,right_shifted13,right_shifted14,right_shifted15,right_shifted16;

//subkey1
   PC1 perm1(Key, left1, right1);
   assign left_shifted1 = {left1[26:0], left1[27]};
   assign right_shifted1 = {right1[26:0], right1[27]};
   PC2 perm21(left_shifted1, right_shifted1, SubKey1);
//subkey2
   assign left_shifted2 = {left_shifted1[26:0], left_shifted1[27]};
   assign right_shifted2 = {right_shifted1[26:0], right_shifted1[27]};
   PC2 perm22(left_shifted2, right_shifted2, SubKey2);
//subkey3   
   assign left_shifted3 = {left_shifted2[25:0], left_shifted2[27:26]};
   assign right_shifted3 = {right_shifted2[25:0], right_shifted2[27:26]};
   PC2 perm23(left_shifted3, right_shifted3, SubKey3);
//subkey4
   assign left_shifted4 = {left_shifted3[25:0], left_shifted3[27:26]};
   assign right_shifted4 = {right_shifted3[25:0], right_shifted3[27:26]};
   PC2 perm24(left_shifted4, right_shifted4, SubKey4);
//subkey5
   assign left_shifted5 = {left_shifted4[25:0], left_shifted4[27:26]};
   assign right_shifted5 = {right_shifted4[25:0], right_shifted4[27:26]};
   PC2 perm25(left_shifted5, right_shifted5, SubKey5);
//subkey6
   assign left_shifted6 = {left_shifted5[25:0], left_shifted5[27:26]};
   assign  right_shifted6 = {right_shifted5[25:0], right_shifted5[27:26]};
   PC2 perm26(left_shifted6, right_shifted6, SubKey6);
//subkey7
   assign left_shifted7 = {left_shifted6[25:0], left_shifted6[27:26]};
   assign right_shifted7 = {right_shifted6[25:0], right_shifted6[27:26]};
   PC2 perm27(left_shifted7, right_shifted7, SubKey7);
//subkey8
   assign left_shifted8 = {left_shifted7[25:0], left_shifted7[27:26]};
   assign right_shifted8 = {right_shifted7[25:0], right_shifted7[27:26]};
   PC2 perm28(left_shifted8, right_shifted8, SubKey8);
//subkey9
   assign left_shifted9 = {left_shifted8[26:0], left_shifted8[27]};
   assign right_shifted9 = {right_shifted8[26:0], right_shifted8[27]};
   PC2 perm29(left_shifted9, right_shifted9, SubKey9);
//subkey10
   assign left_shifted10 = {left_shifted9[25:0], left_shifted9[27:26]};
   assign right_shifted10 = {right_shifted9[25:0], right_shifted9[27:26]};
   PC2 perm210(left_shifted10, right_shifted10, SubKey10);
//SubKey11
   assign left_shifted11 = {left_shifted10[25:0], left_shifted10[27:26]};
   assign right_shifted11 = {right_shifted10[25:0], right_shifted10[27:26]};
   PC2 perm211(left_shifted11, right_shifted11, SubKey11);
//SubKey12
   assign left_shifted12 = {left_shifted11[25:0], left_shifted11[27:26]};
   assign right_shifted12 = {right_shifted11[25:0], right_shifted11[27:26]};
   PC2 perm212(left_shifted12, right_shifted12, SubKey12);
//SubKey13
   assign left_shifted13 = {left_shifted12[25:0], left_shifted12[27:26]};
   assign right_shifted13 = {right_shifted12[25:0], right_shifted12[27:26]};
   PC2 perm213(left_shifted13, right_shifted13, SubKey13);
//SubKey14
   assign left_shifted14 = {left_shifted13[25:0], left_shifted13[27:26]};
   assign right_shifted14 = {right_shifted13[25:0], right_shifted13[27:26]};
   PC2 perm214(left_shifted14, right_shifted14, SubKey14);
//SubKey15
   assign left_shifted15 = {left_shifted14[25:0], left_shifted14[27:26]};
   assign right_shifted15 = {right_shifted14[25:0], right_shifted14[27:26]};
   PC2 perm215(left_shifted15, right_shifted15, SubKey15);
//SubKey16
   assign left_shifted16 = {left_shifted15[26:0], left_shifted15[27]};
   assign right_shifted16 = {right_shifted15[26:0], right_shifted15[27]};
   PC2 perm216(left_shifted16, right_shifted16, SubKey16);
   

endmodule // GenerateKeys

module PC1 (Key, left_block, right_block);

   input logic [63:0]  Key;
   output logic [27:0] left_block;
   output logic [27:0] right_block;

   assign left_block[0] = Key[64-36];
   assign left_block[1] = Key[64-44];
   assign left_block[2] = Key[64-52];
   assign left_block[3] = Key[64-60];
   assign left_block[4] = Key[64-3];
   assign left_block[5] = Key[64-11];
   assign left_block[6] = Key[64-19];
   assign left_block[7] = Key[64-29];
   assign left_block[8] = Key[64-37];
   assign left_block[9] = Key[64-43];
   assign left_block[10] = Key[64-51];
   assign left_block[11] = Key[64-59];
   assign left_block[12] = Key[64-2];
   assign left_block[13] = Key[64-10];
   assign left_block[14] = Key[64-18];
   assign left_block[15] = Key[64-26];
   assign left_block[16] = Key[64-34];
   assign left_block[17] = Key[64-42];
   assign left_block[18] = Key[64-50];
   assign left_block[19] = Key[64-58];
   assign left_block[20] = Key[64-1];
   assign left_block[21] = Key[64-9];
   assign left_block[22] = Key[64-17];
   assign left_block[23] = Key[64-25];
   assign left_block[24] = Key[64-33];
   assign left_block[25] = Key[64-41];
   assign left_block[26] = Key[64-49];
   assign left_block[27] = Key[64-57];

   assign right_block[0] = Key[64-4];
   assign right_block[1] = Key[64-12];
   assign right_block[2] = Key[64-20];
   assign right_block[3] = Key[64-28];
   assign right_block[4] = Key[64-5];
   assign right_block[5] = Key[64-13];
   assign right_block[6] = Key[64-21];
   assign right_block[7] = Key[64-29];
   assign right_block[8] = Key[64-37];
   assign right_block[9] = Key[64-45];
   assign right_block[10] = Key[64-53];
   assign right_block[11] = Key[64-61];
   assign right_block[12] = Key[64-6];
   assign right_block[13] = Key[64-14];
   assign right_block[14] = Key[64-22];
   assign right_block[15] = Key[64-30];
   assign right_block[16] = Key[64-38];
   assign right_block[17] = Key[64-46];
   assign right_block[18] = Key[64-54];
   assign right_block[19] = Key[64-62];
   assign right_block[20] = Key[64-7];
   assign right_block[21] = Key[64-15];
   assign right_block[22] = Key[64-23];
   assign right_block[23] = Key[64-31];
   assign right_block[24] = Key[64-39];
   assign right_block[25] = Key[64-47];
   assign right_block[26] = Key[64-55];
   assign right_block[27] = Key[64-63];

endmodule // PC1

module PC2 (left_block, right_block, subkey);

   input logic [27:0] left_block;
   input logic [27:0] right_block;
   output logic [47:0] subkey;

   logic [55:0] temp_block;
   assign temp_block[27:0] = left_block;
   assign temp_block[55:28] = right_block;

   assign subkey[0]=temp_block[56-32];
   assign subkey[1]=temp_block[56-29];
   assign subkey[2]=temp_block[56-36];
   assign subkey[3]=temp_block[56-50];
   assign subkey[4]=temp_block[56-42];
   assign subkey[5]=temp_block[56-46];
   assign subkey[6]=temp_block[56-53];
   assign subkey[7]=temp_block[56-34];
   assign subkey[8]=temp_block[56-55];
   assign subkey[9]=temp_block[56-39];
   assign subkey[10]=temp_block[56-49];
   assign subkey[11]=temp_block[56-44];
   assign subkey[12]=temp_block[56-48];
   assign subkey[13]=temp_block[56-33];
   assign subkey[14]=temp_block[56-45];
   assign subkey[15]=temp_block[56-51];
   assign subkey[16]=temp_block[56-40];
   assign subkey[17]=temp_block[56-33];
   assign subkey[18]=temp_block[56-55];
   assign subkey[19]=temp_block[56-47];
   assign subkey[20]=temp_block[56-37];
   assign subkey[21]=temp_block[56-31];
   assign subkey[22]=temp_block[56-52];
   assign subkey[23]=temp_block[56-41];
   assign subkey[24]=temp_block[56-2];
   assign subkey[25]=temp_block[56-13];
   assign subkey[26]=temp_block[56-20];
   assign subkey[27]=temp_block[56-27];
   assign subkey[28]=temp_block[56-7];
   assign subkey[29]=temp_block[56-16];
   assign subkey[30]=temp_block[56-8];
   assign subkey[31]=temp_block[56-26];
   assign subkey[32]=temp_block[56-4];
   assign subkey[33]=temp_block[56-12];
   assign subkey[34]=temp_block[56-19];
   assign subkey[35]=temp_block[56-23];
   assign subkey[36]=temp_block[56-10];
   assign subkey[37]=temp_block[56-21];
   assign subkey[38]=temp_block[56-6];
   assign subkey[39]=temp_block[56-15];
   assign subkey[40]=temp_block[56-28];
   assign subkey[41]=temp_block[56-3];
   assign subkey[42]=temp_block[56-5];
   assign subkey[43]=temp_block[56-1];
   assign subkey[44]=temp_block[56-24];
   assign subkey[45]=temp_block[56-11];
   assign subkey[46]=temp_block[56-17];
   assign subkey[47]=temp_block[56-14];
   


endmodule // PC2

// Straight Function
module SF (inp_block, out_block);

   input logic [31:0] inp_block;
   output logic [31:0] out_block;

   assign out_block [0] = inp_block [32-25];
   assign out_block [1] = inp_block [32-24];
   assign out_block [2] = inp_block [32-11];
   assign out_block [3] = inp_block [32-22];
   assign out_block [4] = inp_block [32-6];
   assign out_block [5] = inp_block [32-30];
   assign out_block [6] = inp_block [32-13];
   assign out_block [7] = inp_block [32-19];
   assign out_block [8] = inp_block [32-9];
   assign out_block [9] = inp_block [32-3];
   assign out_block [10] = inp_block [32-27];
   assign out_block [11] = inp_block [32-32];
   assign out_block [12] = inp_block [32-14];
   assign out_block [13] = inp_block [32-24];
   assign out_block [14] = inp_block [32-8];
   assign out_block [15] = inp_block [32-2];
   assign out_block [16] = inp_block [32-10];
   assign out_block [17] = inp_block [32-31];
   assign out_block [18] = inp_block [32-18];
   assign out_block [19] = inp_block [32-5];
   assign out_block [20] = inp_block [32-26];
   assign out_block [21] = inp_block [32-23];
   assign out_block [22] = inp_block [32-15];
   assign out_block [23] = inp_block [32-1];
   assign out_block [24] = inp_block [32-17];
   assign out_block [25] = inp_block [32-28];
   assign out_block [26] = inp_block [32-12];
   assign out_block [27] = inp_block [32-29];
   assign out_block [28] = inp_block [32-21];
   assign out_block [29] = inp_block [32-20];
   assign out_block [30] = inp_block [32-7];
   assign out_block [31] = inp_block [32-16];
   
   


endmodule // SF

// Expansion Function
module EF (inp_block, out_block);

   input logic [31:0] inp_block;
   output logic [47:0] out_block;

   assign out_block [0] = inp_block[32-1];
   assign out_block [1] = inp_block[32-32];
   assign out_block [2] = inp_block[32-31];
   assign out_block [3] = inp_block[32-30];
   assign out_block [4] = inp_block[32-29];
   assign out_block [5] = inp_block[32-28];
   assign out_block [6] = inp_block[32-29];
   assign out_block [7] = inp_block[32-28];
   assign out_block [8] = inp_block[32-27];
   assign out_block [9] = inp_block[32-26];
   assign out_block [10] = inp_block[32-25];
   assign out_block [11] = inp_block[32-24];
   assign out_block [12] = inp_block[32-25];
   assign out_block [13] = inp_block[32-24];
   assign out_block [14] = inp_block[32-23];
   assign out_block [15] = inp_block[32-22];
   assign out_block [16] = inp_block[32-21];
   assign out_block [17] = inp_block[32-20];
   assign out_block [18] = inp_block[32-21];
   assign out_block [19] = inp_block[32-20];
   assign out_block [20] = inp_block[32-19];
   assign out_block [21] = inp_block[32-18];
   assign out_block [22] = inp_block[32-17];
   assign out_block [23] = inp_block[32-16];
   assign out_block [24] = inp_block[32-17];
   assign out_block [25] = inp_block[32-16];
   assign out_block [26] = inp_block[32-15];
   assign out_block [27] = inp_block[32-14];
   assign out_block [28] = inp_block[32-13];
   assign out_block [29] = inp_block[32-12];
   assign out_block [30] = inp_block[32-13];
   assign out_block [31] = inp_block[32-12];
   assign out_block [32] = inp_block[32-11];
   assign out_block [33] = inp_block[32-10];
   assign out_block [34] = inp_block[32-9];
   assign out_block [35] = inp_block[32-8];
   assign out_block [36] = inp_block[32-9];
   assign out_block [37] = inp_block[32-8];
   assign out_block [38] = inp_block[32-7];
   assign out_block [39] = inp_block[32-6];
   assign out_block [40] = inp_block[32-5];
   assign out_block [41] = inp_block[32-4];
   assign out_block [42] = inp_block[32-5];
   assign out_block [43] = inp_block[32-4];
   assign out_block [44] = inp_block[32-3];
   assign out_block [45] = inp_block[32-2];
   assign out_block [46] = inp_block[32-1];
   assign out_block [47] = inp_block[32-32];
   


endmodule // EF

module feistel (inp_block, subkey, out_block);

   input logic [31:0]  inp_block;
   input logic [47:0]  subkey;
   output logic [31:0] out_block;

   logic [47:0] EF_out;
   logic [47:0] s_inp;
   logic [32:0] SF_inp;
   logic [5:0] s1i,s2i,s3i,s4i,s5i,s6i,s7i,s8i;
   logic [3:0] s1o,s2o,s3o,s4o,s5o,s6o,s7o,s8o;

   EF ef(inp_block,EF_out);

   assign s_inp = EF_out^subkey;

   assign s1i = s_inp[5:0];
   assign s2i = s_inp[11:6];
   assign s3i = s_inp[17:12];
   assign s4i = s_inp[23:18];
   assign s5i = s_inp[29:24];
   assign s6i = s_inp[35:30];
   assign s7i = s_inp[41:36];
   assign s8i = s_inp[47:42];

   S1_Box s1b(s1i,s1o);
   S2_Box s2b(s2i,s2o);
   S3_Box s3b(s3i,s3o);
   S4_Box s4b(s4i,s4o);
   S5_Box s5b(s5i,s5o);
   S6_Box s6b(s6i,s6o);
   S7_Box s7b(s7i,s7o);
   S8_Box s8b(s8i,s8o);
   
   assign SF_inp={s1o,s2o,s3o,s4o,s5o,s6o,s7o,s8o};
   SF sf(inp_block, out_block);
   
endmodule // Feistel

// DES block round
module round (inp_block, subkey, out_block);

   input logic [63:0]  inp_block;
   input logic [47:0]  subkey;
   output logic [63:0] out_block;

   logic [31:0] left_inp;
   logic [31:0] right_inp;
   assign left_inp [31:0] = inp_block [31:0];
   assign right_inp [31:0] = inp_block [63:32];

   logic [31:0] left_out;
   logic [31:0] right_out;
   logic [31:0] feist_out;
   assign left_out = right_inp;

   feistel f(right_inp, subkey, feist_out);

   assign right_out = left_inp^feist_out;

   assign out_block [31:0] = left_out;
   assign out_block [63:32] = right_out;

endmodule // round1

// Initial Permutation
module IP (inp_block, out_block);

   input logic [63:0]  inp_block;
   output logic [63:0] out_block;

   assign out_block[63] = inp_block[64-58];
   assign out_block[62] = inp_block[64-50];
   assign out_block[61] = inp_block[64-42];
   assign out_block[60] = inp_block[64-34];
   assign out_block[59] = inp_block[64-26];
   assign out_block[58] = inp_block[64-18];
   assign out_block[57] = inp_block[64-10];
   assign out_block[56] = inp_block[64-2];
   assign out_block[55] = inp_block[64-60];
   assign out_block[54] = inp_block[64-52];   
   assign out_block[53] = inp_block[64-44];   
   assign out_block[52] = inp_block[64-36];
   assign out_block[51] = inp_block[64-28];
   assign out_block[50] = inp_block[64-20];
   assign out_block[49] = inp_block[64-12];
   assign out_block[48] = inp_block[64-4];
   assign out_block[47] = inp_block[64-62];
   assign out_block[46] = inp_block[64-54];
   assign out_block[45] = inp_block[64-46];
   assign out_block[44] = inp_block[64-38];   
   assign out_block[43] = inp_block[64-30];
   assign out_block[42] = inp_block[64-22];   
   assign out_block[41] = inp_block[64-14];
   assign out_block[40] = inp_block[64-6];
   assign out_block[39] = inp_block[64-64];
   assign out_block[38] = inp_block[64-56];
   assign out_block[37] = inp_block[64-48];
   assign out_block[36] = inp_block[64-40];
   assign out_block[35] = inp_block[64-32];
   assign out_block[34] = inp_block[64-24];   
   assign out_block[33] = inp_block[64-16];
   assign out_block[32] = inp_block[64-8];   
   assign out_block[31] = inp_block[64-57];
   assign out_block[30] = inp_block[64-49];
   assign out_block[29] = inp_block[64-41];
   assign out_block[28] = inp_block[64-33];
   assign out_block[27] = inp_block[64-25];
   assign out_block[26] = inp_block[64-17];
   assign out_block[25] = inp_block[64-9];   
   assign out_block[24] = inp_block[64-1];   
   assign out_block[23] = inp_block[64-59];
   assign out_block[22] = inp_block[64-51];   
   assign out_block[21] = inp_block[64-43];
   assign out_block[20] = inp_block[64-35];
   assign out_block[19] = inp_block[64-27];
   assign out_block[18] = inp_block[64-19];
   assign out_block[17] = inp_block[64-11];
   assign out_block[16] = inp_block[64-3];
   assign out_block[15] = inp_block[64-61];
   assign out_block[14] = inp_block[64-53];   
   assign out_block[13] = inp_block[64-45];
   assign out_block[12] = inp_block[64-37];   
   assign out_block[11] = inp_block[64-29];
   assign out_block[10] = inp_block[64-21];
   assign out_block[9] = inp_block[64-13];
   assign out_block[8] = inp_block[64-5];
   assign out_block[7] = inp_block[64-63];
   assign out_block[6] = inp_block[64-55];
   assign out_block[5] = inp_block[64-47];
   assign out_block[4] = inp_block[64-39];   
   assign out_block[3] = inp_block[64-31];
   assign out_block[2] = inp_block[64-23];    
   assign out_block[1] = inp_block[64-15];
   assign out_block[0] = inp_block[64-7];   

endmodule // IP

// Final Permutation
module FP (inp_block, out_block);

   input logic [63:0]  inp_block;
   output logic [63:0] out_block;

   assign out_block[63] = inp_block[64-40];
   assign out_block[62] = inp_block[64-8];
   assign out_block[61] = inp_block[64-48];
   assign out_block[60] = inp_block[64-16];
   assign out_block[59] = inp_block[64-56];
   assign out_block[58] = inp_block[64-24];
   assign out_block[57] = inp_block[64-64];
   assign out_block[56] = inp_block[64-32];   
   assign out_block[55] = inp_block[64-39];
   assign out_block[54] = inp_block[64-7];   
   assign out_block[53] = inp_block[64-47];   
   assign out_block[52] = inp_block[64-15];
   assign out_block[51] = inp_block[64-55];
   assign out_block[50] = inp_block[64-23];
   assign out_block[49] = inp_block[64-63];
   assign out_block[48] = inp_block[64-31];   
   assign out_block[47] = inp_block[64-38];
   assign out_block[46] = inp_block[64-6];
   assign out_block[45] = inp_block[64-46];
   assign out_block[44] = inp_block[64-14];   
   assign out_block[43] = inp_block[64-54];
   assign out_block[42] = inp_block[64-22];   
   assign out_block[41] = inp_block[64-62];
   assign out_block[40] = inp_block[64-30];   
   assign out_block[39] = inp_block[64-37];
   assign out_block[38] = inp_block[64-5];
   assign out_block[37] = inp_block[64-45];
   assign out_block[36] = inp_block[64-13];
   assign out_block[35] = inp_block[64-53];
   assign out_block[34] = inp_block[64-21];   
   assign out_block[33] = inp_block[64-61];
   assign out_block[32] = inp_block[64-29];   
   assign out_block[31] = inp_block[64-36];
   assign out_block[30] = inp_block[64-4];
   assign out_block[29] = inp_block[64-44];
   assign out_block[28] = inp_block[64-12];
   assign out_block[27] = inp_block[64-52];
   assign out_block[26] = inp_block[64-20];
   assign out_block[25] = inp_block[64-60];   
   assign out_block[24] = inp_block[64-28];   
   assign out_block[23] = inp_block[64-35];
   assign out_block[22] = inp_block[64-3];   
   assign out_block[21] = inp_block[64-43];
   assign out_block[20] = inp_block[64-11];
   assign out_block[19] = inp_block[64-51];
   assign out_block[18] = inp_block[64-19];
   assign out_block[17] = inp_block[64-59];
   assign out_block[16] = inp_block[64-27];   
   assign out_block[15] = inp_block[64-34];
   assign out_block[14] = inp_block[64-2];   
   assign out_block[13] = inp_block[64-42];
   assign out_block[12] = inp_block[64-10];   
   assign out_block[11] = inp_block[64-50];
   assign out_block[10] = inp_block[64-18];
   assign out_block[9] = inp_block[64-58];
   assign out_block[8] = inp_block[64-26];   
   assign out_block[7] = inp_block[64-33];
   assign out_block[6] = inp_block[64-1];
   assign out_block[5] = inp_block[64-41];   
   assign out_block[4] = inp_block[64-9];
   assign out_block[3] = inp_block[64-49];    
   assign out_block[2] = inp_block[64-17];
   assign out_block[1] = inp_block[64-57];
   assign out_block[0] = inp_block[64-25];  

endmodule // FP

module S1_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})
	  6'd0  : out_bits = 4'd14;             
	  6'd1  : out_bits = 4'd4;             
	  6'd2  : out_bits = 4'd13;            
	  6'd3  : out_bits = 4'd1;             
	  6'd4  : out_bits = 4'd2;             
	  6'd5  : out_bits = 4'd15;             
	  6'd6  : out_bits = 4'd11;             
	  6'd7  : out_bits = 4'd8;             
	  6'd8  : out_bits = 4'd3;             
	  6'd9  : out_bits = 4'd10;             
	  6'd10 : out_bits = 4'd6;             
	  6'd11 : out_bits = 4'd12;             
	  6'd12 : out_bits = 4'd5;             
	  6'd13 : out_bits = 4'd9;             
	  6'd14 : out_bits = 4'd0;             
	  6'd15 : out_bits = 4'd7;             
	  6'd16 : out_bits = 4'd0;             
	  6'd17 : out_bits = 4'd15;             
	  6'd18 : out_bits = 4'd7;             
	  6'd19 : out_bits = 4'd4;             
	  6'd20 : out_bits = 4'd14;             
	  6'd21 : out_bits = 4'd2;             
	  6'd22 : out_bits = 4'd13;             
	  6'd23 : out_bits = 4'd1;             
	  6'd24 : out_bits = 4'd10;             
	  6'd25 : out_bits = 4'd6;             
	  6'd26 : out_bits = 4'd12;             
	  6'd27 : out_bits = 4'd11;             
	  6'd28 : out_bits = 4'd9;             
	  6'd29 : out_bits = 4'd5;             
	  6'd30 : out_bits = 4'd3;             
	  6'd31 : out_bits = 4'd8;             
	  6'd32 : out_bits = 4'd4;             
	  6'd33 : out_bits = 4'd1;             
	  6'd34 : out_bits = 4'd14;             
	  6'd35 : out_bits = 4'd8;             
	  6'd36 : out_bits = 4'd13;             
	  6'd37 : out_bits = 4'd6;             
	  6'd38 : out_bits = 4'd2;             
	  6'd39 : out_bits = 4'd11;             
	  6'd40 : out_bits = 4'd15;             
	  6'd41 : out_bits = 4'd12;             
	  6'd42 : out_bits = 4'd9;             
	  6'd43 : out_bits = 4'd7;             
	  6'd44 : out_bits = 4'd3;             
	  6'd45 : out_bits = 4'd10;             
	  6'd46 : out_bits = 4'd5;             
	  6'd47 : out_bits = 4'd0;             
	  6'd48 : out_bits = 4'd15;             
	  6'd49 : out_bits = 4'd12;             
	  6'd50 : out_bits = 4'd8;             
	  6'd51 : out_bits = 4'd2;             
	  6'd52 : out_bits = 4'd4;             
	  6'd53 : out_bits = 4'd9;            
	  6'd54 : out_bits = 4'd1;             
	  6'd55 : out_bits = 4'd7;            
	  6'd56 : out_bits = 4'd5;        
	  6'd57 : out_bits = 4'd11;        
	  6'd58 : out_bits = 4'd3;       
	  6'd59 : out_bits = 4'd14;       
	  6'd60 : out_bits = 4'd10;       
	  6'd61 : out_bits = 4'd0;       
	  6'd62 : out_bits = 4'd6;      
	  6'd63 : out_bits = 4'd13;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S1_Box

module S2_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})             
	  6'd0  : out_bits = 4'd15;             
	  6'd1  : out_bits = 4'd1;             
	  6'd2  : out_bits = 4'd8;            
	  6'd3  : out_bits = 4'd14;             
	  6'd4  : out_bits = 4'd6;             
	  6'd5  : out_bits = 4'd11;             
	  6'd6  : out_bits = 4'd3;             
	  6'd7  : out_bits = 4'd4;             
	  6'd8  : out_bits = 4'd9;             
	  6'd9  : out_bits = 4'd7;             
	  6'd10 : out_bits = 4'd2;             
	  6'd11 : out_bits = 4'd13;             
	  6'd12 : out_bits = 4'd12;             
	  6'd13 : out_bits = 4'd0;             
	  6'd14 : out_bits = 4'd5;             
	  6'd15 : out_bits = 4'd10;             
	  6'd16 : out_bits = 4'd3;             
	  6'd17 : out_bits = 4'd13;             
	  6'd18 : out_bits = 4'd4;             
	  6'd19 : out_bits = 4'd7;             
	  6'd20 : out_bits = 4'd15;             
	  6'd21 : out_bits = 4'd2;             
	  6'd22 : out_bits = 4'd8;             
	  6'd23 : out_bits = 4'd14;             
	  6'd24 : out_bits = 4'd12;             
	  6'd25 : out_bits = 4'd0;             
	  6'd26 : out_bits = 4'd1;             
	  6'd27 : out_bits = 4'd10;             
	  6'd28 : out_bits = 4'd6;             
	  6'd29 : out_bits = 4'd9;             
	  6'd30 : out_bits = 4'd11;             
	  6'd31 : out_bits = 4'd5;             
	  6'd32 : out_bits = 4'd0;             
	  6'd33 : out_bits = 4'd14;             
	  6'd34 : out_bits = 4'd7;             
	  6'd35 : out_bits = 4'd11;             
	  6'd36 : out_bits = 4'd10;             
	  6'd37 : out_bits = 4'd4;             
	  6'd38 : out_bits = 4'd13;             
	  6'd39 : out_bits = 4'd1;             
	  6'd40 : out_bits = 4'd5;             
	  6'd41 : out_bits = 4'd8;             
	  6'd42 : out_bits = 4'd12;             
	  6'd43 : out_bits = 4'd6;             
	  6'd44 : out_bits = 4'd9;             
	  6'd45 : out_bits = 4'd3;             
	  6'd46 : out_bits = 4'd2;             
	  6'd47 : out_bits = 4'd15;             
	  6'd48 : out_bits = 4'd13;             
	  6'd49 : out_bits = 4'd8;             
	  6'd50 : out_bits = 4'd10;             
	  6'd51 : out_bits = 4'd1;             
	  6'd52 : out_bits = 4'd3;             
	  6'd53 : out_bits = 4'd15;            
	  6'd54 : out_bits = 4'd4;             
	  6'd55 : out_bits = 4'd2;            
	  6'd56 : out_bits = 4'd11;        
	  6'd57 : out_bits = 4'd6;        
	  6'd58 : out_bits = 4'd7;       
	  6'd59 : out_bits = 4'd12;       
	  6'd60 : out_bits = 4'd0;       
	  6'd61 : out_bits = 4'd5;       
	  6'd62 : out_bits = 4'd14;      
	  6'd63 : out_bits = 4'd9;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S2_Box

module S3_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})
	  6'd0  : out_bits = 4'd10;             
	  6'd1  : out_bits = 4'd0;             
	  6'd2  : out_bits = 4'd9;            
	  6'd3  : out_bits = 4'd14;             
	  6'd4  : out_bits = 4'd6;             
	  6'd5  : out_bits = 4'd3;             
	  6'd6  : out_bits = 4'd15;             
	  6'd7  : out_bits = 4'd5;             
	  6'd8  : out_bits = 4'd1;             
	  6'd9  : out_bits = 4'd13;             
	  6'd10 : out_bits = 4'd12;             
	  6'd11 : out_bits = 4'd7;             
	  6'd12 : out_bits = 4'd11;             
	  6'd13 : out_bits = 4'd4;             
	  6'd14 : out_bits = 4'd2;             
	  6'd15 : out_bits = 4'd8;             
	  6'd16 : out_bits = 4'd13;             
	  6'd17 : out_bits = 4'd7;             
	  6'd18 : out_bits = 4'd0;             
	  6'd19 : out_bits = 4'd9;             
	  6'd20 : out_bits = 4'd3;             
	  6'd21 : out_bits = 4'd4;             
	  6'd22 : out_bits = 4'd6;             
	  6'd23 : out_bits = 4'd10;             
	  6'd24 : out_bits = 4'd2;             
	  6'd25 : out_bits = 4'd8;             
	  6'd26 : out_bits = 4'd5;             
	  6'd27 : out_bits = 4'd14;             
	  6'd28 : out_bits = 4'd12;             
	  6'd29 : out_bits = 4'd11;             
	  6'd30 : out_bits = 4'd15;             
	  6'd31 : out_bits = 4'd1;             
	  6'd32 : out_bits = 4'd13;             
	  6'd33 : out_bits = 4'd6;             
	  6'd34 : out_bits = 4'd4;             
	  6'd35 : out_bits = 4'd9;             
	  6'd36 : out_bits = 4'd8;             
	  6'd37 : out_bits = 4'd15;             
	  6'd38 : out_bits = 4'd3;             
	  6'd39 : out_bits = 4'd0;             
	  6'd40 : out_bits = 4'd11;             
	  6'd41 : out_bits = 4'd1;             
	  6'd42 : out_bits = 4'd2;             
	  6'd43 : out_bits = 4'd12;             
	  6'd44 : out_bits = 4'd5;             
	  6'd45 : out_bits = 4'd10;             
	  6'd46 : out_bits = 4'd14;             
	  6'd47 : out_bits = 4'd7;             
	  6'd48 : out_bits = 4'd1;             
	  6'd49 : out_bits = 4'd10;             
	  6'd50 : out_bits = 4'd13;             
	  6'd51 : out_bits = 4'd0;             
	  6'd52 : out_bits = 4'd6;             
	  6'd53 : out_bits = 4'd9;            
	  6'd54 : out_bits = 4'd8;             
	  6'd55 : out_bits = 4'd7;            
	  6'd56 : out_bits = 4'd4;        
	  6'd57 : out_bits = 4'd15;        
	  6'd58 : out_bits = 4'd14;       
	  6'd59 : out_bits = 4'd3;       
	  6'd60 : out_bits = 4'd11;       
	  6'd61 : out_bits = 4'd5;       
	  6'd62 : out_bits = 4'd2;      
	  6'd63 : out_bits = 4'd12;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S3_Box

module S4_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd7;             
	  6'd1  : out_bits = 4'd13;             
	  6'd2  : out_bits = 4'd14;            
	  6'd3  : out_bits = 4'd3;             
	  6'd4  : out_bits = 4'd0;             
	  6'd5  : out_bits = 4'd6;             
	  6'd6  : out_bits = 4'd9;             
	  6'd7  : out_bits = 4'd10;             
	  6'd8  : out_bits = 4'd1;             
	  6'd9  : out_bits = 4'd2;             
	  6'd10 : out_bits = 4'd8;             
	  6'd11 : out_bits = 4'd5;             
	  6'd12 : out_bits = 4'd11;             
	  6'd13 : out_bits = 4'd12;             
	  6'd14 : out_bits = 4'd4;             
	  6'd15 : out_bits = 4'd15;             
	  6'd16 : out_bits = 4'd13;             
	  6'd17 : out_bits = 4'd8;             
	  6'd18 : out_bits = 4'd11;             
	  6'd19 : out_bits = 4'd5;             
	  6'd20 : out_bits = 4'd6;             
	  6'd21 : out_bits = 4'd15;             
	  6'd22 : out_bits = 4'd0;             
	  6'd23 : out_bits = 4'd3;             
	  6'd24 : out_bits = 4'd4;             
	  6'd25 : out_bits = 4'd7;             
	  6'd26 : out_bits = 4'd2;             
	  6'd27 : out_bits = 4'd12;             
	  6'd28 : out_bits = 4'd1;             
	  6'd29 : out_bits = 4'd10;             
	  6'd30 : out_bits = 4'd14;             
	  6'd31 : out_bits = 4'd9;             
	  6'd32 : out_bits = 4'd10;             
	  6'd33 : out_bits = 4'd6;             
	  6'd34 : out_bits = 4'd9;             
	  6'd35 : out_bits = 4'd0;             
	  6'd36 : out_bits = 4'd12;             
	  6'd37 : out_bits = 4'd11;             
	  6'd38 : out_bits = 4'd7;             
	  6'd39 : out_bits = 4'd13;             
	  6'd40 : out_bits = 4'd15;             
	  6'd41 : out_bits = 4'd1;             
	  6'd42 : out_bits = 4'd3;             
	  6'd43 : out_bits = 4'd14;             
	  6'd44 : out_bits = 4'd5;             
	  6'd45 : out_bits = 4'd2;             
	  6'd46 : out_bits = 4'd8;             
	  6'd47 : out_bits = 4'd4;             
	  6'd48 : out_bits = 4'd3;             
	  6'd49 : out_bits = 4'd15;             
	  6'd50 : out_bits = 4'd0;             
	  6'd51 : out_bits = 4'd6;             
	  6'd52 : out_bits = 4'd10;             
	  6'd53 : out_bits = 4'd1;            
	  6'd54 : out_bits = 4'd13;             
	  6'd55 : out_bits = 4'd8;            
	  6'd56 : out_bits = 4'd9;        
	  6'd57 : out_bits = 4'd4;        
	  6'd58 : out_bits = 4'd5;       
	  6'd59 : out_bits = 4'd11;       
	  6'd60 : out_bits = 4'd12;       
	  6'd61 : out_bits = 4'd7;       
	  6'd62 : out_bits = 4'd2;      
	  6'd63 : out_bits = 4'd14;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S4_Box

module S5_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd2;             
	  6'd1  : out_bits = 4'd12;             
	  6'd2  : out_bits = 4'd4;            
	  6'd3  : out_bits = 4'd1;             
	  6'd4  : out_bits = 4'd7;             
	  6'd5  : out_bits = 4'd10;             
	  6'd6  : out_bits = 4'd11;             
	  6'd7  : out_bits = 4'd6;             
	  6'd8  : out_bits = 4'd8;             
	  6'd9  : out_bits = 4'd5;             
	  6'd10 : out_bits = 4'd3;             
	  6'd11 : out_bits = 4'd15;             
	  6'd12 : out_bits = 4'd13;             
	  6'd13 : out_bits = 4'd0;             
	  6'd14 : out_bits = 4'd14;             
	  6'd15 : out_bits = 4'd9;             
	  6'd16 : out_bits = 4'd14;             
	  6'd17 : out_bits = 4'd11;             
	  6'd18 : out_bits = 4'd2;             
	  6'd19 : out_bits = 4'd12;             
	  6'd20 : out_bits = 4'd4;             
	  6'd21 : out_bits = 4'd7;             
	  6'd22 : out_bits = 4'd13;             
	  6'd23 : out_bits = 4'd1;             
	  6'd24 : out_bits = 4'd5;             
	  6'd25 : out_bits = 4'd0;             
	  6'd26 : out_bits = 4'd15;             
	  6'd27 : out_bits = 4'd10;             
	  6'd28 : out_bits = 4'd3;             
	  6'd29 : out_bits = 4'd9;             
	  6'd30 : out_bits = 4'd8;             
	  6'd31 : out_bits = 4'd6;             
	  6'd32 : out_bits = 4'd4;             
	  6'd33 : out_bits = 4'd2;             
	  6'd34 : out_bits = 4'd1;             
	  6'd35 : out_bits = 4'd11;             
	  6'd36 : out_bits = 4'd10;             
	  6'd37 : out_bits = 4'd13;             
	  6'd38 : out_bits = 4'd7;             
	  6'd39 : out_bits = 4'd8;             
	  6'd40 : out_bits = 4'd15;             
	  6'd41 : out_bits = 4'd9;             
	  6'd42 : out_bits = 4'd12;             
	  6'd43 : out_bits = 4'd5;             
	  6'd44 : out_bits = 4'd6;             
	  6'd45 : out_bits = 4'd3;             
	  6'd46 : out_bits = 4'd0;             
	  6'd47 : out_bits = 4'd14;             
	  6'd48 : out_bits = 4'd11;             
	  6'd49 : out_bits = 4'd8;             
	  6'd50 : out_bits = 4'd12;             
	  6'd51 : out_bits = 4'd7;             
	  6'd52 : out_bits = 4'd1;             
	  6'd53 : out_bits = 4'd14;            
	  6'd54 : out_bits = 4'd2;             
	  6'd55 : out_bits = 4'd13;            
	  6'd56 : out_bits = 4'd6;        
	  6'd57 : out_bits = 4'd15;        
	  6'd58 : out_bits = 4'd0;       
	  6'd59 : out_bits = 4'd9;       
	  6'd60 : out_bits = 4'd10;       
	  6'd61 : out_bits = 4'd4;       
	  6'd62 : out_bits = 4'd5;      
	  6'd63 : out_bits = 4'd3;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S5_Box

module S6_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd12;             
	  6'd1  : out_bits = 4'd1;             
	  6'd2  : out_bits = 4'd10;            
	  6'd3  : out_bits = 4'd15;             
	  6'd4  : out_bits = 4'd9;             
	  6'd5  : out_bits = 4'd2;             
	  6'd6  : out_bits = 4'd6;             
	  6'd7  : out_bits = 4'd8;             
	  6'd8  : out_bits = 4'd0;             
	  6'd9  : out_bits = 4'd13;             
	  6'd10 : out_bits = 4'd3;             
	  6'd11 : out_bits = 4'd4;             
	  6'd12 : out_bits = 4'd14;             
	  6'd13 : out_bits = 4'd7;             
	  6'd14 : out_bits = 4'd5;             
	  6'd15 : out_bits = 4'd11;             
	  6'd16 : out_bits = 4'd10;             
	  6'd17 : out_bits = 4'd15;             
	  6'd18 : out_bits = 4'd4;             
	  6'd19 : out_bits = 4'd2;             
	  6'd20 : out_bits = 4'd7;             
	  6'd21 : out_bits = 4'd12;             
	  6'd22 : out_bits = 4'd9;             
	  6'd23 : out_bits = 4'd5;             
	  6'd24 : out_bits = 4'd6;             
	  6'd25 : out_bits = 4'd1;             
	  6'd26 : out_bits = 4'd13;             
	  6'd27 : out_bits = 4'd14;             
	  6'd28 : out_bits = 4'd0;             
	  6'd29 : out_bits = 4'd11;             
	  6'd30 : out_bits = 4'd3;             
	  6'd31 : out_bits = 4'd8;             
	  6'd32 : out_bits = 4'd9;             
	  6'd33 : out_bits = 4'd14;             
	  6'd34 : out_bits = 4'd15;             
	  6'd35 : out_bits = 4'd5;             
	  6'd36 : out_bits = 4'd2;             
	  6'd37 : out_bits = 4'd8;             
	  6'd38 : out_bits = 4'd12;             
	  6'd39 : out_bits = 4'd3;             
	  6'd40 : out_bits = 4'd7;             
	  6'd41 : out_bits = 4'd0;             
	  6'd42 : out_bits = 4'd4;             
	  6'd43 : out_bits = 4'd10;             
	  6'd44 : out_bits = 4'd1;             
	  6'd45 : out_bits = 4'd13;             
	  6'd46 : out_bits = 4'd11;             
	  6'd47 : out_bits = 4'd6;             
	  6'd48 : out_bits = 4'd4;             
	  6'd49 : out_bits = 4'd3;             
	  6'd50 : out_bits = 4'd2;             
	  6'd51 : out_bits = 4'd12;             
	  6'd52 : out_bits = 4'd9;             
	  6'd53 : out_bits = 4'd5;            
	  6'd54 : out_bits = 4'd15;             
	  6'd55 : out_bits = 4'd10;            
	  6'd56 : out_bits = 4'd11;        
	  6'd57 : out_bits = 4'd14;        
	  6'd58 : out_bits = 4'd1;       
	  6'd59 : out_bits = 4'd7;       
	  6'd60 : out_bits = 4'd6;       
	  6'd61 : out_bits = 4'd0;       
	  6'd62 : out_bits = 4'd8;      
	  6'd63 : out_bits = 4'd13;	  
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S6_Box

module S7_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd4;             
	  6'd1  : out_bits = 4'd11;             
	  6'd2  : out_bits = 4'd2;            
	  6'd3  : out_bits = 4'd14;             
	  6'd4  : out_bits = 4'd15;             
	  6'd5  : out_bits = 4'd0;             
	  6'd6  : out_bits = 4'd8;             
	  6'd7  : out_bits = 4'd13;             
	  6'd8  : out_bits = 4'd3;             
	  6'd9  : out_bits = 4'd12;             
	  6'd10 : out_bits = 4'd9;             
	  6'd11 : out_bits = 4'd7;             
	  6'd12 : out_bits = 4'd5;             
	  6'd13 : out_bits = 4'd10;             
	  6'd14 : out_bits = 4'd6;             
	  6'd15 : out_bits = 4'd1;             
	  6'd16 : out_bits = 4'd13;             
	  6'd17 : out_bits = 4'd0;             
	  6'd18 : out_bits = 4'd11;             
	  6'd19 : out_bits = 4'd7;             
	  6'd20 : out_bits = 4'd4;             
	  6'd21 : out_bits = 4'd9;             
	  6'd22 : out_bits = 4'd1;             
	  6'd23 : out_bits = 4'd10;             
	  6'd24 : out_bits = 4'd14;             
	  6'd25 : out_bits = 4'd3;             
	  6'd26 : out_bits = 4'd5;             
	  6'd27 : out_bits = 4'd12;             
	  6'd28 : out_bits = 4'd2;             
	  6'd29 : out_bits = 4'd15;             
	  6'd30 : out_bits = 4'd8;             
	  6'd31 : out_bits = 4'd6;             
	  6'd32 : out_bits = 4'd1;             
	  6'd33 : out_bits = 4'd4;             
	  6'd34 : out_bits = 4'd11;             
	  6'd35 : out_bits = 4'd13;             
	  6'd36 : out_bits = 4'd12;             
	  6'd37 : out_bits = 4'd3;             
	  6'd38 : out_bits = 4'd7;             
	  6'd39 : out_bits = 4'd14;             
	  6'd40 : out_bits = 4'd10;             
	  6'd41 : out_bits = 4'd15;             
	  6'd42 : out_bits = 4'd6;             
	  6'd43 : out_bits = 4'd8;             
	  6'd44 : out_bits = 4'd0;             
	  6'd45 : out_bits = 4'd5;             
	  6'd46 : out_bits = 4'd9;             
	  6'd47 : out_bits = 4'd2;             
	  6'd48 : out_bits = 4'd6;             
	  6'd49 : out_bits = 4'd11;             
	  6'd50 : out_bits = 4'd13;             
	  6'd51 : out_bits = 4'd8;             
	  6'd52 : out_bits = 4'd1;             
	  6'd53 : out_bits = 4'd4;            
	  6'd54 : out_bits = 4'd10;             
	  6'd55 : out_bits = 4'd7;            
	  6'd56 : out_bits = 4'd9;        
	  6'd57 : out_bits = 4'd5;        
	  6'd58 : out_bits = 4'd0;       
	  6'd59 : out_bits = 4'd15;       
	  6'd60 : out_bits = 4'd14;       
	  6'd61 : out_bits = 4'd2;       
	  6'd62 : out_bits = 4'd3;      
	  6'd63 : out_bits = 4'd12;  
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S7_Box

module S8_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd13;             
	  6'd1  : out_bits = 4'd2;             
	  6'd2  : out_bits = 4'd8;            
	  6'd3  : out_bits = 4'd4;             
	  6'd4  : out_bits = 4'd6;             
	  6'd5  : out_bits = 4'd15;             
	  6'd6  : out_bits = 4'd11;             
	  6'd7  : out_bits = 4'd1;             
	  6'd8  : out_bits = 4'd10;             
	  6'd9  : out_bits = 4'd9;             
	  6'd10 : out_bits = 4'd3;             
	  6'd11 : out_bits = 4'd14;             
	  6'd12 : out_bits = 4'd5;             
	  6'd13 : out_bits = 4'd0;             
	  6'd14 : out_bits = 4'd12;             
	  6'd15 : out_bits = 4'd7;             
	  6'd16 : out_bits = 4'd1;             
	  6'd17 : out_bits = 4'd15;             
	  6'd18 : out_bits = 4'd13;             
	  6'd19 : out_bits = 4'd8;             
	  6'd20 : out_bits = 4'd10;             
	  6'd21 : out_bits = 4'd3;             
	  6'd22 : out_bits = 4'd7;             
	  6'd23 : out_bits = 4'd4;             
	  6'd24 : out_bits = 4'd12;             
	  6'd25 : out_bits = 4'd5;             
	  6'd26 : out_bits = 4'd6;             
	  6'd27 : out_bits = 4'd11;             
	  6'd28 : out_bits = 4'd0;             
	  6'd29 : out_bits = 4'd14;             
	  6'd30 : out_bits = 4'd9;             
	  6'd31 : out_bits = 4'd2;             
	  6'd32 : out_bits = 4'd7;             
	  6'd33 : out_bits = 4'd11;             
	  6'd34 : out_bits = 4'd4;             
	  6'd35 : out_bits = 4'd1;             
	  6'd36 : out_bits = 4'd9;             
	  6'd37 : out_bits = 4'd12;             
	  6'd38 : out_bits = 4'd14;             
	  6'd39 : out_bits = 4'd2;             
	  6'd40 : out_bits = 4'd0;             
	  6'd41 : out_bits = 4'd6;             
	  6'd42 : out_bits = 4'd10;             
	  6'd43 : out_bits = 4'd13;             
	  6'd44 : out_bits = 4'd15;             
	  6'd45 : out_bits = 4'd3;             
	  6'd46 : out_bits = 4'd5;             
	  6'd47 : out_bits = 4'd8;             
	  6'd48 : out_bits = 4'd2;             
	  6'd49 : out_bits = 4'd1;             
	  6'd50 : out_bits = 4'd14;             
	  6'd51 : out_bits = 4'd7;             
	  6'd52 : out_bits = 4'd4;             
	  6'd53 : out_bits = 4'd10;            
	  6'd54 : out_bits = 4'd8;             
	  6'd55 : out_bits = 4'd13;            
	  6'd56 : out_bits = 4'd15;        
	  6'd57 : out_bits = 4'd12;        
	  6'd58 : out_bits = 4'd9;       
	  6'd59 : out_bits = 4'd0;       
	  6'd60 : out_bits = 4'd3;       
	  6'd61 : out_bits = 4'd5;       
	  6'd62 : out_bits = 4'd6;      
	  6'd63 : out_bits = 4'd11;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S8_Box

module DES (key, plaintext, encrypt, ciphertext);

	input logic [63:0] key, plaintext;
	input logic encrypt;

   logic [47:0] 	SubKey1, SubKey2, SubKey3, SubKey4;   
    logic [47:0] 	SubKey5, SubKey6, SubKey7, SubKey8;   
    logic [47:0] 	SubKey9, SubKey10, SubKey11, SubKey12;
   logic [47:0] 	SubKey13, SubKey14, SubKey15, SubKey16;

   output logic [63:0] ciphertext;

   logic [63:0] 	ip_out;   
   logic [63:0] 	r1_out,r2_out,r3_out,r4_out,r5_out,r6_out,r7_out,r8_out,r9_out,r10_out,r11_out,r12_out,r13_out,r14_out,r15_out,r16_out;   
   
   // SubKey generation
   GenerateKeys k1 (key, SubKey1, SubKey2, SubKey3, SubKey4,
		    SubKey5, SubKey6, SubKey7, SubKey8,
		    SubKey9, SubKey10, SubKey11, SubKey12,
		    SubKey13, SubKey14, SubKey15, SubKey16);
   // encrypt (encrypt=1) or decrypt (encrypt=0) 
   logic [47:0] SubKeyChoice1, SubKeyChoice2, SubKeyChoice3, SubKeyChoice4, SubKeyChoice5, SubKeyChoice6, SubKeyChoice7, SubKeyChoice8, SubKeyChoice9, SubKeyChoice10, SubKeyChoice11, SubKeyChoice12, SubKeyChoice13, SubKeyChoice14, SubKeyChoice15, SubKeyChoice16;

	assign SubKeyChoice1 = encrypt == 1 ? SubKey1: SubKey16;
	assign SubKeyChoice2 = encrypt == 1 ? SubKey2: SubKey15;
	assign SubKeyChoice3 = encrypt == 1 ? SubKey3: SubKey14;
	assign SubKeyChoice4 = encrypt == 1 ? SubKey4: SubKey13;
	assign SubKeyChoice5 = encrypt == 1 ? SubKey5: SubKey12;
	assign SubKeyChoice6 = encrypt == 1 ? SubKey6: SubKey11;
	assign SubKeyChoice7 = encrypt == 1 ? SubKey7: SubKey10;
	assign SubKeyChoice8 = encrypt == 1 ? SubKey8: SubKey9;
	assign SubKeyChoice9 = encrypt == 1 ? SubKey9: SubKey8;
	assign SubKeyChoice10 = encrypt == 1 ? SubKey10: SubKey7;
	assign SubKeyChoice11 = encrypt == 1 ? SubKey11: SubKey6;
	assign SubKeyChoice12 = encrypt == 1 ? SubKey12: SubKey5;
	assign SubKeyChoice13 = encrypt == 1 ? SubKey13: SubKey4;
	assign SubKeyChoice14 = encrypt == 1 ? SubKey14: SubKey3;
	assign SubKeyChoice15 = encrypt == 1 ? SubKey15: SubKey2;
	assign SubKeyChoice16 = encrypt == 1 ? SubKey16: SubKey1;
	
   // Initial Permutation (IP)
   IP b1 (plaintext, ip_out);
   // round 1
   round r1 (ip_out, SubKeyChoice1,r1_out);
   // round 2
   round r2 (r1_out, SubKeyChoice2,r2_out);
   // round 3
   round r3 (r2_out, SubKeyChoice3,r3_out);
   // round 4
   round r4 (r3_out, SubKeyChoice4,r4_out);
   // round 5
   round r5 (r4_out, SubKeyChoice5,r5_out);
   // round 6
   round r6 (r5_out, SubKeyChoice6,r6_out);
   // round 7
   round r7 (r6_out, SubKeyChoice7,r7_out);
   // round 8
   round r8 (r7_out, SubKeyChoice8,r8_out);
   // round 9
   round r9 (r8_out, SubKeyChoice9,r9_out);
   // round 10
   round r10 (r9_out, SubKeyChoice10,r10_out);
   // round 11
   round r11 (r10_out, SubKeyChoice11,r11_out);
   // round 12
   round r12(r11_out, SubKeyChoice12,r12_out);
   // round 13
   round r13(r12_out, SubKeyChoice13,r13_out);
   // round 14
   round r14(r13_out, SubKeyChoice14,r14_out);
   // round 15
   round r15(r14_out, SubKeyChoice15,r15_out);
   // round 16
   round r16(r15_out, SubKeyChoice16,r16_out);
   // Final Permutation (IP^{-1}) (swap output of round16)
   FP FP({r16_out[31:0], r16_out[63:32]}, ciphertext);
   
endmodule // DES


