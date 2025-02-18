/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Fri Aug 16 10:27:15 2024
/////////////////////////////////////////////////////////////


module SYS_CTRL ( REF_CLK, SYNC_RST, SYNC_VALID, SYNC_P_DATA, FIFO_FULL, 
        OUT_VALID, ALU_OUT, Rd_D_Vld, Rd_D, WrEN, RdEN, WR_INC, EN, Gate_EN, 
        Wr_D, WR_DATA, FUNC, Addr );
  input [7:0] SYNC_P_DATA;
  input [15:0] ALU_OUT;
  input [7:0] Rd_D;
  output [7:0] Wr_D;
  output [7:0] WR_DATA;
  output [3:0] FUNC;
  output [3:0] Addr;
  input REF_CLK, SYNC_RST, SYNC_VALID, FIFO_FULL, OUT_VALID, Rd_D_Vld;
  output WrEN, RdEN, WR_INC, EN, Gate_EN;
  wire   current_count, next_count, N122, N123, N124, N125, N141, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77;
  wire   [3:0] current_state;
  wire   [3:0] Addr1;
  wire   [3:0] next_state;

  DFFRQX2M current_count_reg ( .D(next_count), .CK(REF_CLK), .RN(SYNC_RST), 
        .Q(current_count) );
  DFFRQX2M \Addr1_reg[3]  ( .D(Addr[3]), .CK(REF_CLK), .RN(SYNC_RST), .Q(
        Addr1[3]) );
  DFFRQX2M \Addr1_reg[2]  ( .D(Addr[2]), .CK(REF_CLK), .RN(SYNC_RST), .Q(
        Addr1[2]) );
  DFFRQX2M \Addr1_reg[1]  ( .D(Addr[1]), .CK(REF_CLK), .RN(SYNC_RST), .Q(
        Addr1[1]) );
  DFFRQX2M \Addr1_reg[0]  ( .D(Addr[0]), .CK(REF_CLK), .RN(SYNC_RST), .Q(
        Addr1[0]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(REF_CLK), .RN(
        SYNC_RST), .Q(current_state[0]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(REF_CLK), .RN(
        SYNC_RST), .Q(current_state[2]) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(REF_CLK), .RN(
        SYNC_RST), .Q(current_state[1]) );
  DFFRQX2M \current_state_reg[3]  ( .D(next_state[3]), .CK(REF_CLK), .RN(
        SYNC_RST), .Q(current_state[3]) );
  NOR2X2M U3 ( .A(n70), .B(n19), .Y(FUNC[2]) );
  NOR2X2M U4 ( .A(n72), .B(n19), .Y(FUNC[0]) );
  MX3X1M U5 ( .A(n12), .B(n11), .C(Addr1[3]), .S0(n4), .S1(current_state[3]), 
        .Y(Addr[3]) );
  MX3X1M U6 ( .A(n10), .B(n9), .C(Addr1[2]), .S0(n4), .S1(current_state[3]), 
        .Y(Addr[2]) );
  NOR2BX2M U7 ( .AN(n2), .B(current_state[3]), .Y(n49) );
  NOR4BX1M U8 ( .AN(current_state[3]), .B(n4), .C(n2), .D(n3), .Y(n23) );
  INVX2M U9 ( .A(EN), .Y(n19) );
  INVX2M U10 ( .A(WrEN), .Y(n14) );
  NAND2BX2M U11 ( .AN(n51), .B(n52), .Y(WR_INC) );
  INVX2M U12 ( .A(FIFO_FULL), .Y(n13) );
  NAND2X2M U13 ( .A(n41), .B(n34), .Y(n24) );
  NOR2X2M U14 ( .A(n20), .B(n44), .Y(EN) );
  NOR2X2M U15 ( .A(n71), .B(n19), .Y(FUNC[1]) );
  OAI21X2M U16 ( .A0(n20), .A1(n72), .B0(n65), .Y(N122) );
  NAND3X2M U17 ( .A(n4), .B(n49), .C(n3), .Y(n44) );
  NOR2X2M U18 ( .A(n69), .B(n19), .Y(FUNC[3]) );
  AND2X2M U19 ( .A(n2), .B(n3), .Y(n1) );
  INVX2M U20 ( .A(n65), .Y(n18) );
  AOI2B1X1M U21 ( .A1N(n24), .A0(n31), .B0(n20), .Y(WrEN) );
  OAI21X2M U22 ( .A0(n20), .A1(n30), .B0(n29), .Y(RdEN) );
  NOR2X2M U23 ( .A(n72), .B(n14), .Y(Wr_D[0]) );
  NOR2X2M U24 ( .A(n71), .B(n14), .Y(Wr_D[1]) );
  NOR2X2M U25 ( .A(n70), .B(n14), .Y(Wr_D[2]) );
  NOR2X2M U26 ( .A(n69), .B(n14), .Y(Wr_D[3]) );
  NOR2X2M U27 ( .A(n68), .B(n14), .Y(Wr_D[5]) );
  NOR2X2M U28 ( .A(n67), .B(n14), .Y(Wr_D[7]) );
  NOR2X2M U29 ( .A(n27), .B(n29), .Y(n51) );
  NOR2X2M U30 ( .A(n52), .B(n77), .Y(n54) );
  NAND2X2M U31 ( .A(n50), .B(n74), .Y(n29) );
  NAND3X2M U32 ( .A(n49), .B(n74), .C(n3), .Y(n34) );
  NAND3X2M U33 ( .A(n49), .B(n76), .C(n4), .Y(n30) );
  NAND2BX2M U34 ( .AN(n22), .B(n23), .Y(n52) );
  OAI21X2M U35 ( .A0(n20), .A1(n71), .B0(n64), .Y(N123) );
  OAI21X2M U36 ( .A0(n20), .A1(n70), .B0(n63), .Y(N124) );
  OAI21X2M U37 ( .A0(n20), .A1(n69), .B0(n62), .Y(N125) );
  NAND2X2M U38 ( .A(n50), .B(n4), .Y(n41) );
  NAND2X2M U39 ( .A(n49), .B(n74), .Y(n31) );
  INVX2M U40 ( .A(n4), .Y(n74) );
  INVX2M U41 ( .A(n3), .Y(n76) );
  OAI21X2M U42 ( .A0(n20), .A1(n34), .B0(n19), .Y(Gate_EN) );
  OAI2BB1X2M U43 ( .A0N(n4), .A1N(n40), .B0(n41), .Y(n33) );
  NAND2X2M U44 ( .A(n19), .B(n21), .Y(next_state[3]) );
  OAI21X2M U45 ( .A0(n22), .A1(n77), .B0(n23), .Y(n21) );
  INVX2M U46 ( .A(SYNC_VALID), .Y(n20) );
  MX3X1M U47 ( .A(n6), .B(n5), .C(Addr1[0]), .S0(n4), .S1(current_state[3]), 
        .Y(Addr[0]) );
  MX2X2M U48 ( .A(Addr1[0]), .B(N141), .S0(n1), .Y(n6) );
  MX4X1M U49 ( .A(N122), .B(n18), .C(N122), .D(Addr1[0]), .S0(n3), .S1(n2), 
        .Y(n5) );
  NAND2BX2M U50 ( .AN(Addr1[0]), .B(n20), .Y(N141) );
  BUFX2M U51 ( .A(current_state[2]), .Y(n3) );
  NAND2X2M U52 ( .A(Addr1[0]), .B(n20), .Y(n65) );
  BUFX2M U53 ( .A(current_state[0]), .Y(n4) );
  BUFX2M U54 ( .A(current_state[1]), .Y(n2) );
  MX2X2M U55 ( .A(Addr1[3]), .B(n15), .S0(n1), .Y(n12) );
  MX4X1M U56 ( .A(N125), .B(n15), .C(N125), .D(Addr1[3]), .S0(n3), .S1(n2), 
        .Y(n11) );
  INVX2M U57 ( .A(n62), .Y(n15) );
  MX2X2M U58 ( .A(Addr1[2]), .B(n16), .S0(n1), .Y(n10) );
  MX4X1M U59 ( .A(N124), .B(n16), .C(N124), .D(Addr1[2]), .S0(n3), .S1(n2), 
        .Y(n9) );
  INVX2M U60 ( .A(n63), .Y(n16) );
  NOR3X2M U61 ( .A(n2), .B(current_state[3]), .C(n76), .Y(n50) );
  NAND3BX2M U62 ( .AN(n24), .B(n25), .C(n26), .Y(next_state[2]) );
  AOI221XLM U63 ( .A0(n75), .A1(SYNC_VALID), .B0(n73), .B1(n27), .C0(n28), .Y(
        n26) );
  INVX2M U64 ( .A(n30), .Y(n75) );
  INVX2M U65 ( .A(n29), .Y(n73) );
  OAI2BB1X2M U66 ( .A0N(ALU_OUT[0]), .A1N(next_count), .B0(n61), .Y(WR_DATA[0]) );
  AOI22X1M U67 ( .A0(Rd_D[0]), .A1(n51), .B0(ALU_OUT[8]), .B1(n54), .Y(n61) );
  OAI2BB1X2M U68 ( .A0N(ALU_OUT[1]), .A1N(next_count), .B0(n60), .Y(WR_DATA[1]) );
  AOI22X1M U69 ( .A0(Rd_D[1]), .A1(n51), .B0(ALU_OUT[9]), .B1(n54), .Y(n60) );
  OAI2BB1X2M U70 ( .A0N(ALU_OUT[2]), .A1N(next_count), .B0(n59), .Y(WR_DATA[2]) );
  AOI22X1M U71 ( .A0(Rd_D[2]), .A1(n51), .B0(ALU_OUT[10]), .B1(n54), .Y(n59)
         );
  OAI2BB1X2M U72 ( .A0N(ALU_OUT[3]), .A1N(next_count), .B0(n58), .Y(WR_DATA[3]) );
  AOI22X1M U73 ( .A0(Rd_D[3]), .A1(n51), .B0(ALU_OUT[11]), .B1(n54), .Y(n58)
         );
  OAI2BB1X2M U74 ( .A0N(ALU_OUT[4]), .A1N(next_count), .B0(n57), .Y(WR_DATA[4]) );
  AOI22X1M U75 ( .A0(Rd_D[4]), .A1(n51), .B0(ALU_OUT[12]), .B1(n54), .Y(n57)
         );
  OAI2BB1X2M U76 ( .A0N(ALU_OUT[5]), .A1N(next_count), .B0(n56), .Y(WR_DATA[5]) );
  AOI22X1M U77 ( .A0(Rd_D[5]), .A1(n51), .B0(ALU_OUT[13]), .B1(n54), .Y(n56)
         );
  OAI2BB1X2M U78 ( .A0N(ALU_OUT[6]), .A1N(next_count), .B0(n55), .Y(WR_DATA[6]) );
  AOI22X1M U79 ( .A0(Rd_D[6]), .A1(n51), .B0(ALU_OUT[14]), .B1(n54), .Y(n55)
         );
  OAI2BB1X2M U80 ( .A0N(ALU_OUT[7]), .A1N(next_count), .B0(n53), .Y(WR_DATA[7]) );
  AOI22X1M U81 ( .A0(Rd_D[7]), .A1(n51), .B0(ALU_OUT[15]), .B1(n54), .Y(n53)
         );
  NOR2X2M U82 ( .A(n52), .B(current_count), .Y(next_count) );
  INVX2M U83 ( .A(SYNC_P_DATA[0]), .Y(n72) );
  AND2X2M U84 ( .A(SYNC_P_DATA[4]), .B(WrEN), .Y(Wr_D[4]) );
  AND2X2M U85 ( .A(SYNC_P_DATA[6]), .B(WrEN), .Y(Wr_D[6]) );
  INVX2M U86 ( .A(SYNC_P_DATA[1]), .Y(n71) );
  NAND2X2M U87 ( .A(Addr1[1]), .B(n20), .Y(n64) );
  NAND2X2M U88 ( .A(Addr1[2]), .B(n20), .Y(n63) );
  NAND2X2M U89 ( .A(Addr1[3]), .B(n20), .Y(n62) );
  INVX2M U90 ( .A(SYNC_P_DATA[2]), .Y(n70) );
  INVX2M U91 ( .A(SYNC_P_DATA[3]), .Y(n69) );
  MX3X1M U92 ( .A(n8), .B(n7), .C(Addr1[1]), .S0(n4), .S1(current_state[3]), 
        .Y(Addr[1]) );
  MX2X2M U93 ( .A(Addr1[1]), .B(n17), .S0(n1), .Y(n8) );
  MX4X1M U94 ( .A(N123), .B(n17), .C(N123), .D(Addr1[1]), .S0(n3), .S1(n2), 
        .Y(n7) );
  INVX2M U95 ( .A(n64), .Y(n17) );
  NAND2X2M U96 ( .A(Rd_D_Vld), .B(n13), .Y(n27) );
  NAND2X2M U97 ( .A(OUT_VALID), .B(n13), .Y(n22) );
  NOR3X2M U98 ( .A(n3), .B(current_state[3]), .C(n2), .Y(n40) );
  OAI211X2M U99 ( .A0(n20), .A1(n34), .B0(n66), .C0(n35), .Y(next_state[0]) );
  AOI221XLM U100 ( .A0(n33), .A1(n20), .B0(n36), .B1(n37), .C0(n28), .Y(n35)
         );
  NOR2X2M U101 ( .A(SYNC_P_DATA[4]), .B(SYNC_P_DATA[0]), .Y(n36) );
  OAI211X2M U102 ( .A0(SYNC_VALID), .A1(n31), .B0(n66), .C0(n32), .Y(
        next_state[1]) );
  AOI21BX2M U103 ( .A0(SYNC_VALID), .A1(n33), .B0N(n34), .Y(n32) );
  AND4X2M U104 ( .A(SYNC_VALID), .B(n74), .C(n40), .D(n48), .Y(n38) );
  NOR2X2M U105 ( .A(n69), .B(n67), .Y(n48) );
  OA22X2M U106 ( .A0(SYNC_VALID), .A1(n44), .B0(n45), .B1(n46), .Y(n25) );
  NAND3X2M U107 ( .A(SYNC_P_DATA[0]), .B(SYNC_P_DATA[6]), .C(SYNC_P_DATA[4]), 
        .Y(n46) );
  NAND4X2M U108 ( .A(SYNC_P_DATA[2]), .B(n38), .C(n71), .D(n68), .Y(n45) );
  AND4X2M U109 ( .A(SYNC_P_DATA[5]), .B(SYNC_P_DATA[1]), .C(n47), .D(n38), .Y(
        n37) );
  NOR2X2M U110 ( .A(SYNC_P_DATA[6]), .B(SYNC_P_DATA[2]), .Y(n47) );
  INVX2M U111 ( .A(SYNC_P_DATA[5]), .Y(n68) );
  INVX2M U112 ( .A(n42), .Y(n66) );
  OAI211X2M U113 ( .A0(SYNC_VALID), .A1(n30), .B0(n43), .C0(n25), .Y(n42) );
  NAND3X2M U114 ( .A(SYNC_P_DATA[4]), .B(SYNC_P_DATA[0]), .C(n37), .Y(n43) );
  AND4X2M U115 ( .A(SYNC_P_DATA[2]), .B(n38), .C(SYNC_P_DATA[6]), .D(n39), .Y(
        n28) );
  NOR4X1M U116 ( .A(SYNC_P_DATA[5]), .B(SYNC_P_DATA[4]), .C(SYNC_P_DATA[1]), 
        .D(SYNC_P_DATA[0]), .Y(n39) );
  INVX2M U117 ( .A(current_count), .Y(n77) );
  INVX2M U118 ( .A(SYNC_P_DATA[7]), .Y(n67) );
endmodule


module RegFile ( clk, reset_n, Wr_En, Rd_En, Address, WrData, RdData, Rd_D_Vld, 
        REG0, REG1, REG2, REG3 );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input clk, reset_n, Wr_En, Rd_En;
  output Rd_D_Vld;
  wire   N11, N12, N13, N14, \RegFile[15][7] , \RegFile[15][6] ,
         \RegFile[15][5] , \RegFile[15][4] , \RegFile[15][3] ,
         \RegFile[15][2] , \RegFile[15][1] , \RegFile[15][0] ,
         \RegFile[14][7] , \RegFile[14][6] , \RegFile[14][5] ,
         \RegFile[14][4] , \RegFile[14][3] , \RegFile[14][2] ,
         \RegFile[14][1] , \RegFile[14][0] , \RegFile[13][7] ,
         \RegFile[13][6] , \RegFile[13][5] , \RegFile[13][4] ,
         \RegFile[13][3] , \RegFile[13][2] , \RegFile[13][1] ,
         \RegFile[13][0] , \RegFile[12][7] , \RegFile[12][6] ,
         \RegFile[12][5] , \RegFile[12][4] , \RegFile[12][3] ,
         \RegFile[12][2] , \RegFile[12][1] , \RegFile[12][0] ,
         \RegFile[11][7] , \RegFile[11][6] , \RegFile[11][5] ,
         \RegFile[11][4] , \RegFile[11][3] , \RegFile[11][2] ,
         \RegFile[11][1] , \RegFile[11][0] , \RegFile[10][7] ,
         \RegFile[10][6] , \RegFile[10][5] , \RegFile[10][4] ,
         \RegFile[10][3] , \RegFile[10][2] , \RegFile[10][1] ,
         \RegFile[10][0] , \RegFile[9][7] , \RegFile[9][6] , \RegFile[9][5] ,
         \RegFile[9][4] , \RegFile[9][3] , \RegFile[9][2] , \RegFile[9][1] ,
         \RegFile[9][0] , \RegFile[8][7] , \RegFile[8][6] , \RegFile[8][5] ,
         \RegFile[8][4] , \RegFile[8][3] , \RegFile[8][2] , \RegFile[8][1] ,
         \RegFile[8][0] , \RegFile[7][7] , \RegFile[7][6] , \RegFile[7][5] ,
         \RegFile[7][4] , \RegFile[7][3] , \RegFile[7][2] , \RegFile[7][1] ,
         \RegFile[7][0] , \RegFile[6][7] , \RegFile[6][6] , \RegFile[6][5] ,
         \RegFile[6][4] , \RegFile[6][3] , \RegFile[6][2] , \RegFile[6][1] ,
         \RegFile[6][0] , \RegFile[5][7] , \RegFile[5][6] , \RegFile[5][5] ,
         \RegFile[5][4] , \RegFile[5][3] , \RegFile[5][2] , \RegFile[5][1] ,
         \RegFile[5][0] , \RegFile[4][7] , \RegFile[4][6] , \RegFile[4][5] ,
         \RegFile[4][4] , \RegFile[4][3] , \RegFile[4][2] , \RegFile[4][1] ,
         \RegFile[4][0] , N36, N37, N38, N39, N40, N41, N42, N43, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];

  EDFFHQX2M \RdData_reg[7]  ( .D(N36), .E(n15), .CK(clk), .Q(RdData[7]) );
  EDFFHQX2M \RdData_reg[6]  ( .D(N37), .E(n15), .CK(clk), .Q(RdData[6]) );
  EDFFHQX2M \RdData_reg[5]  ( .D(N38), .E(n15), .CK(clk), .Q(RdData[5]) );
  EDFFHQX2M \RdData_reg[4]  ( .D(N39), .E(n15), .CK(clk), .Q(RdData[4]) );
  EDFFHQX2M \RdData_reg[3]  ( .D(N40), .E(n15), .CK(clk), .Q(RdData[3]) );
  EDFFHQX2M \RdData_reg[2]  ( .D(N41), .E(n15), .CK(clk), .Q(RdData[2]) );
  EDFFHQX2M \RdData_reg[1]  ( .D(N42), .E(n15), .CK(clk), .Q(RdData[1]) );
  EDFFHQX2M \RdData_reg[0]  ( .D(N43), .E(n15), .CK(clk), .Q(RdData[0]) );
  DFFRQX2M \RegFile_reg[13][7]  ( .D(n154), .CK(clk), .RN(n204), .Q(
        \RegFile[13][7] ) );
  DFFRQX2M \RegFile_reg[13][6]  ( .D(n153), .CK(clk), .RN(n204), .Q(
        \RegFile[13][6] ) );
  DFFRQX2M \RegFile_reg[13][5]  ( .D(n152), .CK(clk), .RN(n204), .Q(
        \RegFile[13][5] ) );
  DFFRQX2M \RegFile_reg[13][4]  ( .D(n151), .CK(clk), .RN(n204), .Q(
        \RegFile[13][4] ) );
  DFFRQX2M \RegFile_reg[13][3]  ( .D(n150), .CK(clk), .RN(n204), .Q(
        \RegFile[13][3] ) );
  DFFRQX2M \RegFile_reg[13][2]  ( .D(n149), .CK(clk), .RN(n204), .Q(
        \RegFile[13][2] ) );
  DFFRQX2M \RegFile_reg[13][1]  ( .D(n148), .CK(clk), .RN(n204), .Q(
        \RegFile[13][1] ) );
  DFFRQX2M \RegFile_reg[13][0]  ( .D(n147), .CK(clk), .RN(n204), .Q(
        \RegFile[13][0] ) );
  DFFRQX2M \RegFile_reg[9][7]  ( .D(n122), .CK(clk), .RN(n202), .Q(
        \RegFile[9][7] ) );
  DFFRQX2M \RegFile_reg[9][6]  ( .D(n121), .CK(clk), .RN(n202), .Q(
        \RegFile[9][6] ) );
  DFFRQX2M \RegFile_reg[9][5]  ( .D(n120), .CK(clk), .RN(n202), .Q(
        \RegFile[9][5] ) );
  DFFRQX2M \RegFile_reg[9][4]  ( .D(n119), .CK(clk), .RN(n202), .Q(
        \RegFile[9][4] ) );
  DFFRQX2M \RegFile_reg[9][3]  ( .D(n118), .CK(clk), .RN(n202), .Q(
        \RegFile[9][3] ) );
  DFFRQX2M \RegFile_reg[9][2]  ( .D(n117), .CK(clk), .RN(n202), .Q(
        \RegFile[9][2] ) );
  DFFRQX2M \RegFile_reg[9][1]  ( .D(n116), .CK(clk), .RN(n202), .Q(
        \RegFile[9][1] ) );
  DFFRQX2M \RegFile_reg[9][0]  ( .D(n115), .CK(clk), .RN(n204), .Q(
        \RegFile[9][0] ) );
  DFFRQX2M \RegFile_reg[5][7]  ( .D(n90), .CK(clk), .RN(n201), .Q(
        \RegFile[5][7] ) );
  DFFRQX2M \RegFile_reg[5][6]  ( .D(n89), .CK(clk), .RN(n201), .Q(
        \RegFile[5][6] ) );
  DFFRQX2M \RegFile_reg[5][5]  ( .D(n88), .CK(clk), .RN(n201), .Q(
        \RegFile[5][5] ) );
  DFFRQX2M \RegFile_reg[5][4]  ( .D(n87), .CK(clk), .RN(n201), .Q(
        \RegFile[5][4] ) );
  DFFRQX2M \RegFile_reg[5][3]  ( .D(n86), .CK(clk), .RN(n200), .Q(
        \RegFile[5][3] ) );
  DFFRQX2M \RegFile_reg[5][2]  ( .D(n85), .CK(clk), .RN(n200), .Q(
        \RegFile[5][2] ) );
  DFFRQX2M \RegFile_reg[5][1]  ( .D(n84), .CK(clk), .RN(n200), .Q(
        \RegFile[5][1] ) );
  DFFRQX2M \RegFile_reg[5][0]  ( .D(n83), .CK(clk), .RN(n200), .Q(
        \RegFile[5][0] ) );
  DFFRQX2M \RegFile_reg[15][7]  ( .D(n170), .CK(clk), .RN(n204), .Q(
        \RegFile[15][7] ) );
  DFFRQX2M \RegFile_reg[15][6]  ( .D(n169), .CK(clk), .RN(reset_n), .Q(
        \RegFile[15][6] ) );
  DFFRQX2M \RegFile_reg[15][5]  ( .D(n168), .CK(clk), .RN(reset_n), .Q(
        \RegFile[15][5] ) );
  DFFRQX2M \RegFile_reg[15][4]  ( .D(n167), .CK(clk), .RN(reset_n), .Q(
        \RegFile[15][4] ) );
  DFFRQX2M \RegFile_reg[15][3]  ( .D(n166), .CK(clk), .RN(reset_n), .Q(
        \RegFile[15][3] ) );
  DFFRQX2M \RegFile_reg[15][2]  ( .D(n165), .CK(clk), .RN(reset_n), .Q(
        \RegFile[15][2] ) );
  DFFRQX2M \RegFile_reg[15][1]  ( .D(n164), .CK(clk), .RN(reset_n), .Q(
        \RegFile[15][1] ) );
  DFFRQX2M \RegFile_reg[15][0]  ( .D(n163), .CK(clk), .RN(reset_n), .Q(
        \RegFile[15][0] ) );
  DFFRQX2M \RegFile_reg[11][7]  ( .D(n138), .CK(clk), .RN(n203), .Q(
        \RegFile[11][7] ) );
  DFFRQX2M \RegFile_reg[11][6]  ( .D(n137), .CK(clk), .RN(n203), .Q(
        \RegFile[11][6] ) );
  DFFRQX2M \RegFile_reg[11][5]  ( .D(n136), .CK(clk), .RN(n203), .Q(
        \RegFile[11][5] ) );
  DFFRQX2M \RegFile_reg[11][4]  ( .D(n135), .CK(clk), .RN(n203), .Q(
        \RegFile[11][4] ) );
  DFFRQX2M \RegFile_reg[11][3]  ( .D(n134), .CK(clk), .RN(n203), .Q(
        \RegFile[11][3] ) );
  DFFRQX2M \RegFile_reg[11][2]  ( .D(n133), .CK(clk), .RN(n203), .Q(
        \RegFile[11][2] ) );
  DFFRQX2M \RegFile_reg[11][1]  ( .D(n132), .CK(clk), .RN(n203), .Q(
        \RegFile[11][1] ) );
  DFFRQX2M \RegFile_reg[11][0]  ( .D(n131), .CK(clk), .RN(n203), .Q(
        \RegFile[11][0] ) );
  DFFRQX2M \RegFile_reg[7][7]  ( .D(n106), .CK(clk), .RN(n203), .Q(
        \RegFile[7][7] ) );
  DFFRQX2M \RegFile_reg[7][6]  ( .D(n105), .CK(clk), .RN(n204), .Q(
        \RegFile[7][6] ) );
  DFFRQX2M \RegFile_reg[7][5]  ( .D(n104), .CK(clk), .RN(n202), .Q(
        \RegFile[7][5] ) );
  DFFRQX2M \RegFile_reg[7][4]  ( .D(n103), .CK(clk), .RN(n203), .Q(
        \RegFile[7][4] ) );
  DFFRQX2M \RegFile_reg[7][3]  ( .D(n102), .CK(clk), .RN(n204), .Q(
        \RegFile[7][3] ) );
  DFFRQX2M \RegFile_reg[7][2]  ( .D(n101), .CK(clk), .RN(n201), .Q(
        \RegFile[7][2] ) );
  DFFRQX2M \RegFile_reg[7][1]  ( .D(n100), .CK(clk), .RN(n201), .Q(
        \RegFile[7][1] ) );
  DFFRQX2M \RegFile_reg[7][0]  ( .D(n99), .CK(clk), .RN(n201), .Q(
        \RegFile[7][0] ) );
  DFFRQX2M \RegFile_reg[14][7]  ( .D(n162), .CK(clk), .RN(reset_n), .Q(
        \RegFile[14][7] ) );
  DFFRQX2M \RegFile_reg[14][6]  ( .D(n161), .CK(clk), .RN(n204), .Q(
        \RegFile[14][6] ) );
  DFFRQX2M \RegFile_reg[14][5]  ( .D(n160), .CK(clk), .RN(n204), .Q(
        \RegFile[14][5] ) );
  DFFRQX2M \RegFile_reg[14][4]  ( .D(n159), .CK(clk), .RN(n204), .Q(
        \RegFile[14][4] ) );
  DFFRQX2M \RegFile_reg[14][3]  ( .D(n158), .CK(clk), .RN(n204), .Q(
        \RegFile[14][3] ) );
  DFFRQX2M \RegFile_reg[14][2]  ( .D(n157), .CK(clk), .RN(n204), .Q(
        \RegFile[14][2] ) );
  DFFRQX2M \RegFile_reg[14][1]  ( .D(n156), .CK(clk), .RN(n204), .Q(
        \RegFile[14][1] ) );
  DFFRQX2M \RegFile_reg[14][0]  ( .D(n155), .CK(clk), .RN(n204), .Q(
        \RegFile[14][0] ) );
  DFFRQX2M \RegFile_reg[10][7]  ( .D(n130), .CK(clk), .RN(n202), .Q(
        \RegFile[10][7] ) );
  DFFRQX2M \RegFile_reg[10][6]  ( .D(n129), .CK(clk), .RN(n202), .Q(
        \RegFile[10][6] ) );
  DFFRQX2M \RegFile_reg[10][5]  ( .D(n128), .CK(clk), .RN(n202), .Q(
        \RegFile[10][5] ) );
  DFFRQX2M \RegFile_reg[10][4]  ( .D(n127), .CK(clk), .RN(n202), .Q(
        \RegFile[10][4] ) );
  DFFRQX2M \RegFile_reg[10][3]  ( .D(n126), .CK(clk), .RN(n202), .Q(
        \RegFile[10][3] ) );
  DFFRQX2M \RegFile_reg[10][2]  ( .D(n125), .CK(clk), .RN(n202), .Q(
        \RegFile[10][2] ) );
  DFFRQX2M \RegFile_reg[10][1]  ( .D(n124), .CK(clk), .RN(n202), .Q(
        \RegFile[10][1] ) );
  DFFRQX2M \RegFile_reg[10][0]  ( .D(n123), .CK(clk), .RN(n202), .Q(
        \RegFile[10][0] ) );
  DFFRQX2M \RegFile_reg[6][7]  ( .D(n98), .CK(clk), .RN(n201), .Q(
        \RegFile[6][7] ) );
  DFFRQX2M \RegFile_reg[6][6]  ( .D(n97), .CK(clk), .RN(n201), .Q(
        \RegFile[6][6] ) );
  DFFRQX2M \RegFile_reg[6][5]  ( .D(n96), .CK(clk), .RN(n201), .Q(
        \RegFile[6][5] ) );
  DFFRQX2M \RegFile_reg[6][4]  ( .D(n95), .CK(clk), .RN(n201), .Q(
        \RegFile[6][4] ) );
  DFFRQX2M \RegFile_reg[6][3]  ( .D(n94), .CK(clk), .RN(n201), .Q(
        \RegFile[6][3] ) );
  DFFRQX2M \RegFile_reg[6][2]  ( .D(n93), .CK(clk), .RN(n201), .Q(
        \RegFile[6][2] ) );
  DFFRQX2M \RegFile_reg[6][1]  ( .D(n92), .CK(clk), .RN(n201), .Q(
        \RegFile[6][1] ) );
  DFFRQX2M \RegFile_reg[6][0]  ( .D(n91), .CK(clk), .RN(n201), .Q(
        \RegFile[6][0] ) );
  DFFRQX2M \RegFile_reg[12][7]  ( .D(n146), .CK(clk), .RN(n204), .Q(
        \RegFile[12][7] ) );
  DFFRQX2M \RegFile_reg[12][6]  ( .D(n145), .CK(clk), .RN(n203), .Q(
        \RegFile[12][6] ) );
  DFFRQX2M \RegFile_reg[12][5]  ( .D(n144), .CK(clk), .RN(n203), .Q(
        \RegFile[12][5] ) );
  DFFRQX2M \RegFile_reg[12][4]  ( .D(n143), .CK(clk), .RN(n203), .Q(
        \RegFile[12][4] ) );
  DFFRQX2M \RegFile_reg[12][3]  ( .D(n142), .CK(clk), .RN(n203), .Q(
        \RegFile[12][3] ) );
  DFFRQX2M \RegFile_reg[12][2]  ( .D(n141), .CK(clk), .RN(n203), .Q(
        \RegFile[12][2] ) );
  DFFRQX2M \RegFile_reg[12][1]  ( .D(n140), .CK(clk), .RN(n203), .Q(
        \RegFile[12][1] ) );
  DFFRQX2M \RegFile_reg[12][0]  ( .D(n139), .CK(clk), .RN(n203), .Q(
        \RegFile[12][0] ) );
  DFFRQX2M \RegFile_reg[8][7]  ( .D(n114), .CK(clk), .RN(n203), .Q(
        \RegFile[8][7] ) );
  DFFRQX2M \RegFile_reg[8][6]  ( .D(n113), .CK(clk), .RN(n202), .Q(
        \RegFile[8][6] ) );
  DFFRQX2M \RegFile_reg[8][5]  ( .D(n112), .CK(clk), .RN(n201), .Q(
        \RegFile[8][5] ) );
  DFFRQX2M \RegFile_reg[8][4]  ( .D(n111), .CK(clk), .RN(reset_n), .Q(
        \RegFile[8][4] ) );
  DFFRQX2M \RegFile_reg[8][3]  ( .D(n110), .CK(clk), .RN(reset_n), .Q(
        \RegFile[8][3] ) );
  DFFRQX2M \RegFile_reg[8][2]  ( .D(n109), .CK(clk), .RN(reset_n), .Q(
        \RegFile[8][2] ) );
  DFFRQX2M \RegFile_reg[8][1]  ( .D(n108), .CK(clk), .RN(reset_n), .Q(
        \RegFile[8][1] ) );
  DFFRQX2M \RegFile_reg[8][0]  ( .D(n107), .CK(clk), .RN(reset_n), .Q(
        \RegFile[8][0] ) );
  DFFRQX2M \RegFile_reg[4][7]  ( .D(n82), .CK(clk), .RN(n200), .Q(
        \RegFile[4][7] ) );
  DFFRQX2M \RegFile_reg[4][6]  ( .D(n81), .CK(clk), .RN(n200), .Q(
        \RegFile[4][6] ) );
  DFFRQX2M \RegFile_reg[4][5]  ( .D(n80), .CK(clk), .RN(n200), .Q(
        \RegFile[4][5] ) );
  DFFRQX2M \RegFile_reg[4][4]  ( .D(n79), .CK(clk), .RN(n200), .Q(
        \RegFile[4][4] ) );
  DFFRQX2M \RegFile_reg[4][3]  ( .D(n78), .CK(clk), .RN(n200), .Q(
        \RegFile[4][3] ) );
  DFFRQX2M \RegFile_reg[4][2]  ( .D(n77), .CK(clk), .RN(n200), .Q(
        \RegFile[4][2] ) );
  DFFRQX2M \RegFile_reg[4][1]  ( .D(n76), .CK(clk), .RN(n200), .Q(
        \RegFile[4][1] ) );
  DFFRQX2M \RegFile_reg[4][0]  ( .D(n75), .CK(clk), .RN(n200), .Q(
        \RegFile[4][0] ) );
  DFFRQX2M \RegFile_reg[3][0]  ( .D(n67), .CK(clk), .RN(n199), .Q(REG3[0]) );
  DFFSQX2M \RegFile_reg[3][5]  ( .D(n72), .CK(clk), .SN(n201), .Q(REG3[5]) );
  DFFRQX2M \RegFile_reg[3][1]  ( .D(n68), .CK(clk), .RN(n199), .Q(REG3[1]) );
  DFFRQX2M \RegFile_reg[3][6]  ( .D(n73), .CK(clk), .RN(n200), .Q(REG3[6]) );
  DFFRQX2M \RegFile_reg[3][4]  ( .D(n71), .CK(clk), .RN(n200), .Q(REG3[4]) );
  DFFRQX2M \RegFile_reg[3][3]  ( .D(n70), .CK(clk), .RN(n199), .Q(REG3[3]) );
  DFFRQX2M \RegFile_reg[3][2]  ( .D(n69), .CK(clk), .RN(n199), .Q(REG3[2]) );
  DFFRQX2M \RegFile_reg[3][7]  ( .D(n74), .CK(clk), .RN(n200), .Q(REG3[7]) );
  DFFRQX2M \RegFile_reg[2][4]  ( .D(n63), .CK(clk), .RN(n199), .Q(REG2[4]) );
  DFFRQX2M \RegFile_reg[2][2]  ( .D(n61), .CK(clk), .RN(n199), .Q(REG2[2]) );
  DFFRQX2M \RegFile_reg[2][3]  ( .D(n62), .CK(clk), .RN(n199), .Q(REG2[3]) );
  DFFRQX2M Rd_D_Vld_reg ( .D(n42), .CK(clk), .RN(n202), .Q(Rd_D_Vld) );
  DFFRQX2M \RegFile_reg[0][1]  ( .D(n44), .CK(clk), .RN(n203), .Q(REG0[1]) );
  DFFRQX2M \RegFile_reg[0][0]  ( .D(n43), .CK(clk), .RN(n202), .Q(REG0[0]) );
  DFFRQX2M \RegFile_reg[0][2]  ( .D(n45), .CK(clk), .RN(n204), .Q(REG0[2]) );
  DFFRQX2M \RegFile_reg[0][3]  ( .D(n46), .CK(clk), .RN(n203), .Q(REG0[3]) );
  DFFRQX2M \RegFile_reg[0][4]  ( .D(n47), .CK(clk), .RN(n202), .Q(REG0[4]) );
  DFFRQX2M \RegFile_reg[0][5]  ( .D(n48), .CK(clk), .RN(n204), .Q(REG0[5]) );
  DFFRQX2M \RegFile_reg[0][7]  ( .D(n50), .CK(clk), .RN(n203), .Q(REG0[7]) );
  DFFRQX2M \RegFile_reg[0][6]  ( .D(n49), .CK(clk), .RN(n202), .Q(REG0[6]) );
  DFFRQX2M \RegFile_reg[1][6]  ( .D(n57), .CK(clk), .RN(n199), .Q(REG1[6]) );
  DFFRQX2M \RegFile_reg[1][1]  ( .D(n52), .CK(clk), .RN(n204), .Q(REG1[1]) );
  DFFRQX2M \RegFile_reg[1][5]  ( .D(n56), .CK(clk), .RN(n199), .Q(REG1[5]) );
  DFFRQX2M \RegFile_reg[1][4]  ( .D(n55), .CK(clk), .RN(n199), .Q(REG1[4]) );
  DFFRQX2M \RegFile_reg[1][7]  ( .D(n58), .CK(clk), .RN(n199), .Q(REG1[7]) );
  DFFRQX2M \RegFile_reg[1][3]  ( .D(n54), .CK(clk), .RN(n203), .Q(REG1[3]) );
  DFFRQX2M \RegFile_reg[1][2]  ( .D(n53), .CK(clk), .RN(n199), .Q(REG1[2]) );
  DFFRQX2M \RegFile_reg[1][0]  ( .D(n51), .CK(clk), .RN(n202), .Q(REG1[0]) );
  DFFRQX2M \RegFile_reg[2][1]  ( .D(n60), .CK(clk), .RN(n199), .Q(REG2[1]) );
  DFFSQX2M \RegFile_reg[2][0]  ( .D(n59), .CK(clk), .SN(n200), .Q(REG2[0]) );
  DFFRQX2M \RegFile_reg[2][5]  ( .D(n64), .CK(clk), .RN(n199), .Q(REG2[5]) );
  DFFSQX2M \RegFile_reg[2][7]  ( .D(n66), .CK(clk), .SN(n199), .Q(REG2[7]) );
  DFFRQX2M \RegFile_reg[2][6]  ( .D(n65), .CK(clk), .RN(n199), .Q(REG2[6]) );
  NOR2X2M U3 ( .A(n196), .B(N13), .Y(n22) );
  NOR2X2M U4 ( .A(n192), .B(N13), .Y(n17) );
  NOR2BX2M U5 ( .AN(N13), .B(n192), .Y(n25) );
  NOR2BX2M U6 ( .AN(N13), .B(n196), .Y(n28) );
  INVX2M U7 ( .A(WrData[4]), .Y(n217) );
  INVX2M U8 ( .A(WrData[6]), .Y(n218) );
  INVX2M U9 ( .A(n195), .Y(n193) );
  INVX2M U10 ( .A(n191), .Y(n192) );
  BUFX2M U11 ( .A(n196), .Y(n191) );
  INVX2M U12 ( .A(n205), .Y(n204) );
  INVX2M U13 ( .A(n208), .Y(n199) );
  INVX2M U14 ( .A(n208), .Y(n200) );
  INVX2M U15 ( .A(n207), .Y(n201) );
  INVX2M U16 ( .A(n206), .Y(n202) );
  INVX2M U17 ( .A(n206), .Y(n203) );
  NOR2X2M U18 ( .A(n14), .B(n205), .Y(n15) );
  BUFX2M U19 ( .A(n209), .Y(n205) );
  BUFX2M U20 ( .A(n209), .Y(n206) );
  BUFX2M U21 ( .A(n206), .Y(n208) );
  BUFX2M U22 ( .A(n206), .Y(n207) );
  INVX2M U23 ( .A(n195), .Y(n194) );
  NOR2BX2M U24 ( .AN(n29), .B(n194), .Y(n18) );
  NOR2BX2M U25 ( .AN(n29), .B(n195), .Y(n20) );
  NOR2BX2M U26 ( .AN(n40), .B(n194), .Y(n32) );
  NOR2BX2M U27 ( .AN(n40), .B(n195), .Y(n34) );
  NAND2X2M U28 ( .A(n20), .B(n17), .Y(n19) );
  NAND2X2M U29 ( .A(n32), .B(n17), .Y(n31) );
  NAND2X2M U30 ( .A(n34), .B(n17), .Y(n33) );
  NAND2X2M U31 ( .A(n32), .B(n22), .Y(n35) );
  NAND2X2M U32 ( .A(n34), .B(n22), .Y(n36) );
  NAND2X2M U33 ( .A(n22), .B(n18), .Y(n21) );
  NAND2X2M U34 ( .A(n32), .B(n25), .Y(n37) );
  NAND2X2M U35 ( .A(n34), .B(n25), .Y(n38) );
  NAND2X2M U36 ( .A(n32), .B(n28), .Y(n39) );
  NAND2X2M U37 ( .A(n34), .B(n28), .Y(n41) );
  NAND2X2M U38 ( .A(n22), .B(n20), .Y(n23) );
  NAND2X2M U39 ( .A(n25), .B(n18), .Y(n24) );
  NAND2X2M U40 ( .A(n25), .B(n20), .Y(n26) );
  NAND2X2M U41 ( .A(n28), .B(n18), .Y(n27) );
  NAND2X2M U42 ( .A(n28), .B(n20), .Y(n30) );
  NAND2X2M U43 ( .A(n17), .B(n18), .Y(n16) );
  NOR2X2M U44 ( .A(n210), .B(Rd_En), .Y(n13) );
  NAND2X2M U45 ( .A(Rd_En), .B(n210), .Y(n14) );
  INVX2M U46 ( .A(Wr_En), .Y(n210) );
  INVX2M U47 ( .A(n197), .Y(n209) );
  INVX2M U48 ( .A(N11), .Y(n195) );
  INVX2M U49 ( .A(WrData[0]), .Y(n216) );
  INVX2M U50 ( .A(WrData[1]), .Y(n215) );
  INVX2M U51 ( .A(WrData[2]), .Y(n214) );
  INVX2M U52 ( .A(WrData[3]), .Y(n213) );
  INVX2M U53 ( .A(WrData[5]), .Y(n212) );
  INVX2M U54 ( .A(WrData[7]), .Y(n211) );
  NOR2BX2M U55 ( .AN(n13), .B(N14), .Y(n29) );
  AND2X2M U56 ( .A(N14), .B(n13), .Y(n40) );
  INVX2M U57 ( .A(N12), .Y(n196) );
  INVX2M U58 ( .A(n198), .Y(n197) );
  INVX2M U59 ( .A(reset_n), .Y(n198) );
  MX4X1M U60 ( .A(\RegFile[4][1] ), .B(\RegFile[5][1] ), .C(\RegFile[6][1] ), 
        .D(\RegFile[7][1] ), .S0(n193), .S1(N12), .Y(n7) );
  MX4X1M U61 ( .A(\RegFile[12][0] ), .B(\RegFile[13][0] ), .C(\RegFile[14][0] ), .D(\RegFile[15][0] ), .S0(n194), .S1(N12), .Y(n1) );
  MX4X1M U62 ( .A(\RegFile[12][2] ), .B(\RegFile[13][2] ), .C(\RegFile[14][2] ), .D(\RegFile[15][2] ), .S0(n193), .S1(n192), .Y(n9) );
  MX4X1M U63 ( .A(\RegFile[12][3] ), .B(\RegFile[13][3] ), .C(\RegFile[14][3] ), .D(\RegFile[15][3] ), .S0(n193), .S1(n192), .Y(n171) );
  MX4X1M U64 ( .A(\RegFile[12][4] ), .B(\RegFile[13][4] ), .C(\RegFile[14][4] ), .D(\RegFile[15][4] ), .S0(n193), .S1(n192), .Y(n175) );
  MX4X1M U65 ( .A(\RegFile[12][5] ), .B(\RegFile[13][5] ), .C(\RegFile[14][5] ), .D(\RegFile[15][5] ), .S0(N11), .S1(N12), .Y(n179) );
  MX4X1M U66 ( .A(\RegFile[12][6] ), .B(\RegFile[13][6] ), .C(\RegFile[14][6] ), .D(\RegFile[15][6] ), .S0(N11), .S1(N12), .Y(n183) );
  MX4X1M U67 ( .A(\RegFile[12][7] ), .B(\RegFile[13][7] ), .C(\RegFile[14][7] ), .D(\RegFile[15][7] ), .S0(N11), .S1(N12), .Y(n187) );
  MX4X1M U68 ( .A(n4), .B(n2), .C(n3), .D(n1), .S0(N14), .S1(N13), .Y(N43) );
  MX4X1M U69 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(N11), 
        .S1(N12), .Y(n4) );
  MX4X1M U70 ( .A(\RegFile[8][0] ), .B(\RegFile[9][0] ), .C(\RegFile[10][0] ), 
        .D(\RegFile[11][0] ), .S0(N11), .S1(N12), .Y(n2) );
  MX4X1M U71 ( .A(\RegFile[4][0] ), .B(\RegFile[5][0] ), .C(\RegFile[6][0] ), 
        .D(\RegFile[7][0] ), .S0(n194), .S1(N12), .Y(n3) );
  MX4X1M U72 ( .A(n8), .B(n6), .C(n7), .D(n5), .S0(N14), .S1(N13), .Y(N42) );
  MX4X1M U73 ( .A(\RegFile[8][1] ), .B(\RegFile[9][1] ), .C(\RegFile[10][1] ), 
        .D(\RegFile[11][1] ), .S0(N11), .S1(N12), .Y(n6) );
  MX4X1M U74 ( .A(\RegFile[12][1] ), .B(\RegFile[13][1] ), .C(\RegFile[14][1] ), .D(\RegFile[15][1] ), .S0(n193), .S1(N12), .Y(n5) );
  MX4X1M U75 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n193), 
        .S1(n192), .Y(n8) );
  MX4X1M U76 ( .A(n12), .B(n10), .C(n11), .D(n9), .S0(N14), .S1(N13), .Y(N41)
         );
  MX4X1M U77 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n193), 
        .S1(n192), .Y(n12) );
  MX4X1M U78 ( .A(\RegFile[8][2] ), .B(\RegFile[9][2] ), .C(\RegFile[10][2] ), 
        .D(\RegFile[11][2] ), .S0(n193), .S1(n192), .Y(n10) );
  MX4X1M U79 ( .A(\RegFile[4][2] ), .B(\RegFile[5][2] ), .C(\RegFile[6][2] ), 
        .D(\RegFile[7][2] ), .S0(n193), .S1(n192), .Y(n11) );
  MX4X1M U80 ( .A(n174), .B(n172), .C(n173), .D(n171), .S0(N14), .S1(N13), .Y(
        N40) );
  MX4X1M U81 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n193), 
        .S1(n192), .Y(n174) );
  MX4X1M U82 ( .A(\RegFile[8][3] ), .B(\RegFile[9][3] ), .C(\RegFile[10][3] ), 
        .D(\RegFile[11][3] ), .S0(n193), .S1(n192), .Y(n172) );
  MX4X1M U83 ( .A(\RegFile[4][3] ), .B(\RegFile[5][3] ), .C(\RegFile[6][3] ), 
        .D(\RegFile[7][3] ), .S0(n193), .S1(n192), .Y(n173) );
  MX4X1M U84 ( .A(n178), .B(n176), .C(n177), .D(n175), .S0(N14), .S1(N13), .Y(
        N39) );
  MX4X1M U85 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(N11), 
        .S1(n192), .Y(n178) );
  MX4X1M U86 ( .A(\RegFile[8][4] ), .B(\RegFile[9][4] ), .C(\RegFile[10][4] ), 
        .D(\RegFile[11][4] ), .S0(n193), .S1(n192), .Y(n176) );
  MX4X1M U87 ( .A(\RegFile[4][4] ), .B(\RegFile[5][4] ), .C(\RegFile[6][4] ), 
        .D(\RegFile[7][4] ), .S0(n193), .S1(n192), .Y(n177) );
  MX4X1M U88 ( .A(n182), .B(n180), .C(n181), .D(n179), .S0(N14), .S1(N13), .Y(
        N38) );
  MX4X1M U89 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(N11), 
        .S1(N12), .Y(n182) );
  MX4X1M U90 ( .A(\RegFile[8][5] ), .B(\RegFile[9][5] ), .C(\RegFile[10][5] ), 
        .D(\RegFile[11][5] ), .S0(N11), .S1(N12), .Y(n180) );
  MX4X1M U91 ( .A(\RegFile[4][5] ), .B(\RegFile[5][5] ), .C(\RegFile[6][5] ), 
        .D(\RegFile[7][5] ), .S0(N11), .S1(n192), .Y(n181) );
  MX4X1M U92 ( .A(n186), .B(n184), .C(n185), .D(n183), .S0(N14), .S1(N13), .Y(
        N37) );
  MX4X1M U93 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n194), 
        .S1(N12), .Y(n186) );
  MX4X1M U94 ( .A(\RegFile[8][6] ), .B(\RegFile[9][6] ), .C(\RegFile[10][6] ), 
        .D(\RegFile[11][6] ), .S0(N11), .S1(N12), .Y(n184) );
  MX4X1M U95 ( .A(\RegFile[4][6] ), .B(\RegFile[5][6] ), .C(\RegFile[6][6] ), 
        .D(\RegFile[7][6] ), .S0(N11), .S1(N12), .Y(n185) );
  MX4X1M U96 ( .A(n190), .B(n188), .C(n189), .D(n187), .S0(N14), .S1(N13), .Y(
        N36) );
  MX4X1M U97 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n194), 
        .S1(N12), .Y(n190) );
  MX4X1M U98 ( .A(\RegFile[8][7] ), .B(\RegFile[9][7] ), .C(\RegFile[10][7] ), 
        .D(\RegFile[11][7] ), .S0(N11), .S1(N12), .Y(n188) );
  MX4X1M U99 ( .A(\RegFile[4][7] ), .B(\RegFile[5][7] ), .C(\RegFile[6][7] ), 
        .D(\RegFile[7][7] ), .S0(N11), .S1(N12), .Y(n189) );
  OAI2BB2X1M U100 ( .B0(n16), .B1(n216), .A0N(REG0[0]), .A1N(n16), .Y(n43) );
  OAI2BB2X1M U101 ( .B0(n16), .B1(n215), .A0N(REG0[1]), .A1N(n16), .Y(n44) );
  OAI2BB2X1M U102 ( .B0(n16), .B1(n214), .A0N(REG0[2]), .A1N(n16), .Y(n45) );
  OAI2BB2X1M U103 ( .B0(n16), .B1(n213), .A0N(REG0[3]), .A1N(n16), .Y(n46) );
  OAI2BB2X1M U104 ( .B0(n16), .B1(n217), .A0N(REG0[4]), .A1N(n16), .Y(n47) );
  OAI2BB2X1M U105 ( .B0(n16), .B1(n212), .A0N(REG0[5]), .A1N(n16), .Y(n48) );
  OAI2BB2X1M U106 ( .B0(n16), .B1(n218), .A0N(REG0[6]), .A1N(n16), .Y(n49) );
  OAI2BB2X1M U107 ( .B0(n16), .B1(n211), .A0N(REG0[7]), .A1N(n16), .Y(n50) );
  OAI2BB2X1M U108 ( .B0(n216), .B1(n19), .A0N(REG1[0]), .A1N(n19), .Y(n51) );
  OAI2BB2X1M U109 ( .B0(n215), .B1(n19), .A0N(REG1[1]), .A1N(n19), .Y(n52) );
  OAI2BB2X1M U110 ( .B0(n214), .B1(n19), .A0N(REG1[2]), .A1N(n19), .Y(n53) );
  OAI2BB2X1M U111 ( .B0(n213), .B1(n19), .A0N(REG1[3]), .A1N(n19), .Y(n54) );
  OAI2BB2X1M U112 ( .B0(n217), .B1(n19), .A0N(REG1[4]), .A1N(n19), .Y(n55) );
  OAI2BB2X1M U113 ( .B0(n212), .B1(n19), .A0N(REG1[5]), .A1N(n19), .Y(n56) );
  OAI2BB2X1M U114 ( .B0(n218), .B1(n19), .A0N(REG1[6]), .A1N(n19), .Y(n57) );
  OAI2BB2X1M U115 ( .B0(n211), .B1(n19), .A0N(REG1[7]), .A1N(n19), .Y(n58) );
  OAI2BB2X1M U116 ( .B0(n216), .B1(n24), .A0N(\RegFile[4][0] ), .A1N(n24), .Y(
        n75) );
  OAI2BB2X1M U117 ( .B0(n215), .B1(n24), .A0N(\RegFile[4][1] ), .A1N(n24), .Y(
        n76) );
  OAI2BB2X1M U118 ( .B0(n214), .B1(n24), .A0N(\RegFile[4][2] ), .A1N(n24), .Y(
        n77) );
  OAI2BB2X1M U119 ( .B0(n213), .B1(n24), .A0N(\RegFile[4][3] ), .A1N(n24), .Y(
        n78) );
  OAI2BB2X1M U120 ( .B0(n217), .B1(n24), .A0N(\RegFile[4][4] ), .A1N(n24), .Y(
        n79) );
  OAI2BB2X1M U121 ( .B0(n212), .B1(n24), .A0N(\RegFile[4][5] ), .A1N(n24), .Y(
        n80) );
  OAI2BB2X1M U122 ( .B0(n218), .B1(n24), .A0N(\RegFile[4][6] ), .A1N(n24), .Y(
        n81) );
  OAI2BB2X1M U123 ( .B0(n211), .B1(n24), .A0N(\RegFile[4][7] ), .A1N(n24), .Y(
        n82) );
  OAI2BB2X1M U124 ( .B0(n216), .B1(n26), .A0N(\RegFile[5][0] ), .A1N(n26), .Y(
        n83) );
  OAI2BB2X1M U125 ( .B0(n215), .B1(n26), .A0N(\RegFile[5][1] ), .A1N(n26), .Y(
        n84) );
  OAI2BB2X1M U126 ( .B0(n214), .B1(n26), .A0N(\RegFile[5][2] ), .A1N(n26), .Y(
        n85) );
  OAI2BB2X1M U127 ( .B0(n213), .B1(n26), .A0N(\RegFile[5][3] ), .A1N(n26), .Y(
        n86) );
  OAI2BB2X1M U128 ( .B0(n217), .B1(n26), .A0N(\RegFile[5][4] ), .A1N(n26), .Y(
        n87) );
  OAI2BB2X1M U129 ( .B0(n212), .B1(n26), .A0N(\RegFile[5][5] ), .A1N(n26), .Y(
        n88) );
  OAI2BB2X1M U130 ( .B0(n218), .B1(n26), .A0N(\RegFile[5][6] ), .A1N(n26), .Y(
        n89) );
  OAI2BB2X1M U131 ( .B0(n211), .B1(n26), .A0N(\RegFile[5][7] ), .A1N(n26), .Y(
        n90) );
  OAI2BB2X1M U132 ( .B0(n216), .B1(n27), .A0N(\RegFile[6][0] ), .A1N(n27), .Y(
        n91) );
  OAI2BB2X1M U133 ( .B0(n215), .B1(n27), .A0N(\RegFile[6][1] ), .A1N(n27), .Y(
        n92) );
  OAI2BB2X1M U134 ( .B0(n214), .B1(n27), .A0N(\RegFile[6][2] ), .A1N(n27), .Y(
        n93) );
  OAI2BB2X1M U135 ( .B0(n213), .B1(n27), .A0N(\RegFile[6][3] ), .A1N(n27), .Y(
        n94) );
  OAI2BB2X1M U136 ( .B0(n217), .B1(n27), .A0N(\RegFile[6][4] ), .A1N(n27), .Y(
        n95) );
  OAI2BB2X1M U137 ( .B0(n212), .B1(n27), .A0N(\RegFile[6][5] ), .A1N(n27), .Y(
        n96) );
  OAI2BB2X1M U138 ( .B0(n218), .B1(n27), .A0N(\RegFile[6][6] ), .A1N(n27), .Y(
        n97) );
  OAI2BB2X1M U139 ( .B0(n211), .B1(n27), .A0N(\RegFile[6][7] ), .A1N(n27), .Y(
        n98) );
  OAI2BB2X1M U140 ( .B0(n216), .B1(n30), .A0N(\RegFile[7][0] ), .A1N(n30), .Y(
        n99) );
  OAI2BB2X1M U141 ( .B0(n215), .B1(n30), .A0N(\RegFile[7][1] ), .A1N(n30), .Y(
        n100) );
  OAI2BB2X1M U142 ( .B0(n214), .B1(n30), .A0N(\RegFile[7][2] ), .A1N(n30), .Y(
        n101) );
  OAI2BB2X1M U143 ( .B0(n213), .B1(n30), .A0N(\RegFile[7][3] ), .A1N(n30), .Y(
        n102) );
  OAI2BB2X1M U144 ( .B0(n217), .B1(n30), .A0N(\RegFile[7][4] ), .A1N(n30), .Y(
        n103) );
  OAI2BB2X1M U145 ( .B0(n212), .B1(n30), .A0N(\RegFile[7][5] ), .A1N(n30), .Y(
        n104) );
  OAI2BB2X1M U146 ( .B0(n218), .B1(n30), .A0N(\RegFile[7][6] ), .A1N(n30), .Y(
        n105) );
  OAI2BB2X1M U147 ( .B0(n211), .B1(n30), .A0N(\RegFile[7][7] ), .A1N(n30), .Y(
        n106) );
  OAI2BB2X1M U148 ( .B0(n215), .B1(n21), .A0N(REG2[1]), .A1N(n21), .Y(n60) );
  OAI2BB2X1M U149 ( .B0(n214), .B1(n21), .A0N(REG2[2]), .A1N(n21), .Y(n61) );
  OAI2BB2X1M U150 ( .B0(n213), .B1(n21), .A0N(REG2[3]), .A1N(n21), .Y(n62) );
  OAI2BB2X1M U151 ( .B0(n217), .B1(n21), .A0N(REG2[4]), .A1N(n21), .Y(n63) );
  OAI2BB2X1M U152 ( .B0(n212), .B1(n21), .A0N(REG2[5]), .A1N(n21), .Y(n64) );
  OAI2BB2X1M U153 ( .B0(n218), .B1(n21), .A0N(REG2[6]), .A1N(n21), .Y(n65) );
  OAI2BB2X1M U154 ( .B0(n216), .B1(n23), .A0N(REG3[0]), .A1N(n23), .Y(n67) );
  OAI2BB2X1M U155 ( .B0(n215), .B1(n23), .A0N(REG3[1]), .A1N(n23), .Y(n68) );
  OAI2BB2X1M U156 ( .B0(n214), .B1(n23), .A0N(REG3[2]), .A1N(n23), .Y(n69) );
  OAI2BB2X1M U157 ( .B0(n213), .B1(n23), .A0N(REG3[3]), .A1N(n23), .Y(n70) );
  OAI2BB2X1M U158 ( .B0(n217), .B1(n23), .A0N(REG3[4]), .A1N(n23), .Y(n71) );
  OAI2BB2X1M U159 ( .B0(n218), .B1(n23), .A0N(REG3[6]), .A1N(n23), .Y(n73) );
  OAI2BB2X1M U160 ( .B0(n211), .B1(n23), .A0N(REG3[7]), .A1N(n23), .Y(n74) );
  OAI2BB2X1M U161 ( .B0(n216), .B1(n31), .A0N(\RegFile[8][0] ), .A1N(n31), .Y(
        n107) );
  OAI2BB2X1M U162 ( .B0(n215), .B1(n31), .A0N(\RegFile[8][1] ), .A1N(n31), .Y(
        n108) );
  OAI2BB2X1M U163 ( .B0(n214), .B1(n31), .A0N(\RegFile[8][2] ), .A1N(n31), .Y(
        n109) );
  OAI2BB2X1M U164 ( .B0(n213), .B1(n31), .A0N(\RegFile[8][3] ), .A1N(n31), .Y(
        n110) );
  OAI2BB2X1M U165 ( .B0(n217), .B1(n31), .A0N(\RegFile[8][4] ), .A1N(n31), .Y(
        n111) );
  OAI2BB2X1M U166 ( .B0(n212), .B1(n31), .A0N(\RegFile[8][5] ), .A1N(n31), .Y(
        n112) );
  OAI2BB2X1M U167 ( .B0(n218), .B1(n31), .A0N(\RegFile[8][6] ), .A1N(n31), .Y(
        n113) );
  OAI2BB2X1M U168 ( .B0(n211), .B1(n31), .A0N(\RegFile[8][7] ), .A1N(n31), .Y(
        n114) );
  OAI2BB2X1M U169 ( .B0(n216), .B1(n33), .A0N(\RegFile[9][0] ), .A1N(n33), .Y(
        n115) );
  OAI2BB2X1M U170 ( .B0(n215), .B1(n33), .A0N(\RegFile[9][1] ), .A1N(n33), .Y(
        n116) );
  OAI2BB2X1M U171 ( .B0(n214), .B1(n33), .A0N(\RegFile[9][2] ), .A1N(n33), .Y(
        n117) );
  OAI2BB2X1M U172 ( .B0(n213), .B1(n33), .A0N(\RegFile[9][3] ), .A1N(n33), .Y(
        n118) );
  OAI2BB2X1M U173 ( .B0(n217), .B1(n33), .A0N(\RegFile[9][4] ), .A1N(n33), .Y(
        n119) );
  OAI2BB2X1M U174 ( .B0(n212), .B1(n33), .A0N(\RegFile[9][5] ), .A1N(n33), .Y(
        n120) );
  OAI2BB2X1M U175 ( .B0(n218), .B1(n33), .A0N(\RegFile[9][6] ), .A1N(n33), .Y(
        n121) );
  OAI2BB2X1M U176 ( .B0(n211), .B1(n33), .A0N(\RegFile[9][7] ), .A1N(n33), .Y(
        n122) );
  OAI2BB2X1M U177 ( .B0(n216), .B1(n35), .A0N(\RegFile[10][0] ), .A1N(n35), 
        .Y(n123) );
  OAI2BB2X1M U178 ( .B0(n215), .B1(n35), .A0N(\RegFile[10][1] ), .A1N(n35), 
        .Y(n124) );
  OAI2BB2X1M U179 ( .B0(n214), .B1(n35), .A0N(\RegFile[10][2] ), .A1N(n35), 
        .Y(n125) );
  OAI2BB2X1M U180 ( .B0(n213), .B1(n35), .A0N(\RegFile[10][3] ), .A1N(n35), 
        .Y(n126) );
  OAI2BB2X1M U181 ( .B0(n217), .B1(n35), .A0N(\RegFile[10][4] ), .A1N(n35), 
        .Y(n127) );
  OAI2BB2X1M U182 ( .B0(n212), .B1(n35), .A0N(\RegFile[10][5] ), .A1N(n35), 
        .Y(n128) );
  OAI2BB2X1M U183 ( .B0(n218), .B1(n35), .A0N(\RegFile[10][6] ), .A1N(n35), 
        .Y(n129) );
  OAI2BB2X1M U184 ( .B0(n211), .B1(n35), .A0N(\RegFile[10][7] ), .A1N(n35), 
        .Y(n130) );
  OAI2BB2X1M U185 ( .B0(n216), .B1(n36), .A0N(\RegFile[11][0] ), .A1N(n36), 
        .Y(n131) );
  OAI2BB2X1M U186 ( .B0(n215), .B1(n36), .A0N(\RegFile[11][1] ), .A1N(n36), 
        .Y(n132) );
  OAI2BB2X1M U187 ( .B0(n214), .B1(n36), .A0N(\RegFile[11][2] ), .A1N(n36), 
        .Y(n133) );
  OAI2BB2X1M U188 ( .B0(n213), .B1(n36), .A0N(\RegFile[11][3] ), .A1N(n36), 
        .Y(n134) );
  OAI2BB2X1M U189 ( .B0(n217), .B1(n36), .A0N(\RegFile[11][4] ), .A1N(n36), 
        .Y(n135) );
  OAI2BB2X1M U190 ( .B0(n212), .B1(n36), .A0N(\RegFile[11][5] ), .A1N(n36), 
        .Y(n136) );
  OAI2BB2X1M U191 ( .B0(n218), .B1(n36), .A0N(\RegFile[11][6] ), .A1N(n36), 
        .Y(n137) );
  OAI2BB2X1M U192 ( .B0(n211), .B1(n36), .A0N(\RegFile[11][7] ), .A1N(n36), 
        .Y(n138) );
  OAI2BB2X1M U193 ( .B0(n216), .B1(n37), .A0N(\RegFile[12][0] ), .A1N(n37), 
        .Y(n139) );
  OAI2BB2X1M U194 ( .B0(n215), .B1(n37), .A0N(\RegFile[12][1] ), .A1N(n37), 
        .Y(n140) );
  OAI2BB2X1M U195 ( .B0(n214), .B1(n37), .A0N(\RegFile[12][2] ), .A1N(n37), 
        .Y(n141) );
  OAI2BB2X1M U196 ( .B0(n213), .B1(n37), .A0N(\RegFile[12][3] ), .A1N(n37), 
        .Y(n142) );
  OAI2BB2X1M U197 ( .B0(n217), .B1(n37), .A0N(\RegFile[12][4] ), .A1N(n37), 
        .Y(n143) );
  OAI2BB2X1M U198 ( .B0(n212), .B1(n37), .A0N(\RegFile[12][5] ), .A1N(n37), 
        .Y(n144) );
  OAI2BB2X1M U199 ( .B0(n218), .B1(n37), .A0N(\RegFile[12][6] ), .A1N(n37), 
        .Y(n145) );
  OAI2BB2X1M U200 ( .B0(n211), .B1(n37), .A0N(\RegFile[12][7] ), .A1N(n37), 
        .Y(n146) );
  OAI2BB2X1M U201 ( .B0(n216), .B1(n38), .A0N(\RegFile[13][0] ), .A1N(n38), 
        .Y(n147) );
  OAI2BB2X1M U202 ( .B0(n215), .B1(n38), .A0N(\RegFile[13][1] ), .A1N(n38), 
        .Y(n148) );
  OAI2BB2X1M U203 ( .B0(n214), .B1(n38), .A0N(\RegFile[13][2] ), .A1N(n38), 
        .Y(n149) );
  OAI2BB2X1M U204 ( .B0(n213), .B1(n38), .A0N(\RegFile[13][3] ), .A1N(n38), 
        .Y(n150) );
  OAI2BB2X1M U205 ( .B0(n217), .B1(n38), .A0N(\RegFile[13][4] ), .A1N(n38), 
        .Y(n151) );
  OAI2BB2X1M U206 ( .B0(n212), .B1(n38), .A0N(\RegFile[13][5] ), .A1N(n38), 
        .Y(n152) );
  OAI2BB2X1M U207 ( .B0(n218), .B1(n38), .A0N(\RegFile[13][6] ), .A1N(n38), 
        .Y(n153) );
  OAI2BB2X1M U208 ( .B0(n211), .B1(n38), .A0N(\RegFile[13][7] ), .A1N(n38), 
        .Y(n154) );
  OAI2BB2X1M U209 ( .B0(n216), .B1(n39), .A0N(\RegFile[14][0] ), .A1N(n39), 
        .Y(n155) );
  OAI2BB2X1M U210 ( .B0(n215), .B1(n39), .A0N(\RegFile[14][1] ), .A1N(n39), 
        .Y(n156) );
  OAI2BB2X1M U211 ( .B0(n214), .B1(n39), .A0N(\RegFile[14][2] ), .A1N(n39), 
        .Y(n157) );
  OAI2BB2X1M U212 ( .B0(n213), .B1(n39), .A0N(\RegFile[14][3] ), .A1N(n39), 
        .Y(n158) );
  OAI2BB2X1M U213 ( .B0(n217), .B1(n39), .A0N(\RegFile[14][4] ), .A1N(n39), 
        .Y(n159) );
  OAI2BB2X1M U214 ( .B0(n212), .B1(n39), .A0N(\RegFile[14][5] ), .A1N(n39), 
        .Y(n160) );
  OAI2BB2X1M U215 ( .B0(n218), .B1(n39), .A0N(\RegFile[14][6] ), .A1N(n39), 
        .Y(n161) );
  OAI2BB2X1M U216 ( .B0(n211), .B1(n39), .A0N(\RegFile[14][7] ), .A1N(n39), 
        .Y(n162) );
  OAI2BB2X1M U217 ( .B0(n216), .B1(n41), .A0N(\RegFile[15][0] ), .A1N(n41), 
        .Y(n163) );
  OAI2BB2X1M U218 ( .B0(n215), .B1(n41), .A0N(\RegFile[15][1] ), .A1N(n41), 
        .Y(n164) );
  OAI2BB2X1M U219 ( .B0(n214), .B1(n41), .A0N(\RegFile[15][2] ), .A1N(n41), 
        .Y(n165) );
  OAI2BB2X1M U220 ( .B0(n213), .B1(n41), .A0N(\RegFile[15][3] ), .A1N(n41), 
        .Y(n166) );
  OAI2BB2X1M U221 ( .B0(n217), .B1(n41), .A0N(\RegFile[15][4] ), .A1N(n41), 
        .Y(n167) );
  OAI2BB2X1M U222 ( .B0(n212), .B1(n41), .A0N(\RegFile[15][5] ), .A1N(n41), 
        .Y(n168) );
  OAI2BB2X1M U223 ( .B0(n218), .B1(n41), .A0N(\RegFile[15][6] ), .A1N(n41), 
        .Y(n169) );
  OAI2BB2X1M U224 ( .B0(n211), .B1(n41), .A0N(\RegFile[15][7] ), .A1N(n41), 
        .Y(n170) );
  OAI2BB2X1M U225 ( .B0(n216), .B1(n21), .A0N(REG2[0]), .A1N(n21), .Y(n59) );
  OAI2BB2X1M U226 ( .B0(n211), .B1(n21), .A0N(REG2[7]), .A1N(n21), .Y(n66) );
  OAI2BB2X1M U227 ( .B0(n212), .B1(n23), .A0N(REG3[5]), .A1N(n23), .Y(n72) );
  OAI2BB1X2M U228 ( .A0N(Rd_D_Vld), .A1N(n13), .B0(n14), .Y(n42) );
endmodule


module alU_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22;

  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n14), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n16), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n17), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n18), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n15), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n13), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n12), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n18), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n18), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n18), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n18), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n18), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n18), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n15), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n14), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n14), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n15), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n17), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n16), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n15), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n16), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n16), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n17), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n16), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n17), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n17), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n17), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n13), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  INVX2M U1 ( .A(b[0]), .Y(n19) );
  XNOR2X2M U2 ( .A(n19), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n19), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n19), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n19), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n19), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n19), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  OR2X2M U8 ( .A(n19), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  NAND2X2M U9 ( .A(n3), .B(n4), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U10 ( .A(a[5]), .Y(n4) );
  INVX2M U11 ( .A(n19), .Y(n3) );
  NAND2X2M U12 ( .A(n5), .B(n6), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U13 ( .A(a[4]), .Y(n6) );
  INVX2M U14 ( .A(n19), .Y(n5) );
  NAND2X2M U15 ( .A(n7), .B(n8), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U16 ( .A(a[3]), .Y(n8) );
  INVX2M U17 ( .A(n19), .Y(n7) );
  NAND2X2M U18 ( .A(n7), .B(n9), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U19 ( .A(a[2]), .Y(n9) );
  NAND2X2M U20 ( .A(n7), .B(n10), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U21 ( .A(a[1]), .Y(n10) );
  NAND2X2M U22 ( .A(n7), .B(n11), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U23 ( .A(a[0]), .Y(n11) );
  NAND2X2M U24 ( .A(n1), .B(n2), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U25 ( .A(a[6]), .Y(n2) );
  INVX2M U26 ( .A(n19), .Y(n1) );
  XNOR2X2M U27 ( .A(n19), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  INVX2M U28 ( .A(b[6]), .Y(n13) );
  INVX2M U29 ( .A(b[1]), .Y(n18) );
  INVX2M U30 ( .A(b[2]), .Y(n17) );
  INVX2M U31 ( .A(b[3]), .Y(n16) );
  INVX2M U32 ( .A(b[4]), .Y(n15) );
  INVX2M U33 ( .A(b[5]), .Y(n14) );
  INVX2M U34 ( .A(b[7]), .Y(n12) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U40 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U41 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U46 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U47 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U51 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U52 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U55 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U56 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U58 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U59 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U60 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U61 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U62 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U63 ( .A(\u_div/CryTmp[7][1] ), .B(n20), .C(n18), .D(n17), .Y(
        quotient[7]) );
  AND3X1M U64 ( .A(n20), .B(n17), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U65 ( .A(\u_div/CryTmp[5][3] ), .B(n20), .Y(quotient[5]) );
  AND2X1M U66 ( .A(n21), .B(n16), .Y(n20) );
  AND2X1M U67 ( .A(\u_div/CryTmp[4][4] ), .B(n21), .Y(quotient[4]) );
  AND3X1M U68 ( .A(n22), .B(n15), .C(n14), .Y(n21) );
  AND3X1M U69 ( .A(n22), .B(n14), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U70 ( .A(\u_div/CryTmp[2][6] ), .B(n22), .Y(quotient[2]) );
  NOR2X1M U71 ( .A(b[6]), .B(b[7]), .Y(n22) );
  AND2X1M U72 ( .A(\u_div/CryTmp[1][7] ), .B(n12), .Y(quotient[1]) );
endmodule


module alU_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [9:0] carry;

  ADDFX2M U2_1 ( .A(A[1]), .B(n9), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n5), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n6), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n7), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n8), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_7 ( .A(A[7]), .B(n3), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n4), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  INVX2M U1 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2M U2 ( .A(B[6]), .Y(n4) );
  XNOR2X2M U3 ( .A(n10), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U4 ( .A(B[0]), .Y(n10) );
  INVX2M U5 ( .A(B[7]), .Y(n3) );
  INVX2M U6 ( .A(B[2]), .Y(n8) );
  INVX2M U7 ( .A(B[3]), .Y(n7) );
  INVX2M U8 ( .A(B[4]), .Y(n6) );
  INVX2M U9 ( .A(B[5]), .Y(n5) );
  INVX2M U10 ( .A(B[1]), .Y(n9) );
  NAND2X2M U11 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U12 ( .A(A[0]), .Y(n1) );
endmodule


module alU_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module alU_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , \A[0] , n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20
;
  assign SUM[6] = A[6];
  assign SUM[5] = \A[5] ;
  assign \A[5]  = A[5];
  assign SUM[4] = \A[4] ;
  assign \A[4]  = A[4];
  assign SUM[3] = \A[3] ;
  assign \A[3]  = A[3];
  assign SUM[2] = \A[2] ;
  assign \A[2]  = A[2];
  assign SUM[1] = \A[1] ;
  assign \A[1]  = A[1];
  assign SUM[0] = \A[0] ;
  assign \A[0]  = A[0];

  AOI21BX2M U2 ( .A0(n11), .A1(A[12]), .B0N(n12), .Y(n1) );
  NAND2X2M U3 ( .A(A[7]), .B(B[7]), .Y(n8) );
  XNOR2X2M U4 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  XNOR2X2M U5 ( .A(A[7]), .B(n2), .Y(SUM[7]) );
  INVX2M U6 ( .A(B[7]), .Y(n2) );
  XNOR2X1M U7 ( .A(n3), .B(n4), .Y(SUM[9]) );
  NOR2X1M U8 ( .A(n5), .B(n6), .Y(n4) );
  CLKXOR2X2M U9 ( .A(n7), .B(n8), .Y(SUM[8]) );
  NAND2BX1M U10 ( .AN(n9), .B(n10), .Y(n7) );
  OAI21X1M U11 ( .A0(A[12]), .A1(n11), .B0(B[12]), .Y(n12) );
  XOR3XLM U12 ( .A(B[12]), .B(A[12]), .C(n11), .Y(SUM[12]) );
  OAI21BX1M U13 ( .A0(n13), .A1(n14), .B0N(n15), .Y(n11) );
  XNOR2X1M U14 ( .A(n14), .B(n16), .Y(SUM[11]) );
  NOR2X1M U15 ( .A(n15), .B(n13), .Y(n16) );
  NOR2X1M U16 ( .A(B[11]), .B(A[11]), .Y(n13) );
  AND2X1M U17 ( .A(B[11]), .B(A[11]), .Y(n15) );
  OA21X1M U18 ( .A0(n17), .A1(n18), .B0(n19), .Y(n14) );
  CLKXOR2X2M U19 ( .A(n20), .B(n18), .Y(SUM[10]) );
  AOI2BB1X1M U20 ( .A0N(n3), .A1N(n6), .B0(n5), .Y(n18) );
  AND2X1M U21 ( .A(B[9]), .B(A[9]), .Y(n5) );
  NOR2X1M U22 ( .A(B[9]), .B(A[9]), .Y(n6) );
  OA21X1M U23 ( .A0(n8), .A1(n9), .B0(n10), .Y(n3) );
  CLKNAND2X2M U24 ( .A(B[8]), .B(A[8]), .Y(n10) );
  NOR2X1M U25 ( .A(B[8]), .B(A[8]), .Y(n9) );
  NAND2BX1M U26 ( .AN(n17), .B(n19), .Y(n20) );
  CLKNAND2X2M U27 ( .A(B[10]), .B(A[10]), .Y(n19) );
  NOR2X1M U28 ( .A(B[10]), .B(A[10]), .Y(n17) );
endmodule


module alU_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  alU_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , 
        \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , 
        \A1[1] , \A1[0] }), .B({n10, n16, n14, n13, n15, n11, n12, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n9), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n8), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n7), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n6), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n5), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n4), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n3), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  AND2X2M U2 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][6] ), .Y(n22) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U12 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U13 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U14 ( .A(\ab[0][5] ), .Y(n21) );
  INVX2M U15 ( .A(\ab[0][3] ), .Y(n19) );
  INVX2M U16 ( .A(\ab[0][7] ), .Y(n23) );
  AND2X2M U17 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n11) );
  AND2X2M U18 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n12) );
  CLKXOR2X2M U19 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U20 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U21 ( .A(\ab[0][2] ), .Y(n18) );
  AND2X2M U22 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n13) );
  AND2X2M U23 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n14) );
  CLKXOR2X2M U24 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  AND2X2M U25 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n15) );
  CLKXOR2X2M U26 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  INVX2M U27 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U28 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  CLKXOR2X2M U29 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XNOR2X2M U30 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  XNOR2X2M U31 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  XNOR2X2M U32 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U33 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U34 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  INVX2M U35 ( .A(A[1]), .Y(n38) );
  INVX2M U36 ( .A(A[0]), .Y(n39) );
  INVX2M U37 ( .A(B[6]), .Y(n25) );
  XNOR2X2M U38 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U39 ( .A(A[3]), .Y(n36) );
  INVX2M U40 ( .A(A[2]), .Y(n37) );
  INVX2M U41 ( .A(A[4]), .Y(n35) );
  XNOR2X2M U42 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U43 ( .A(A[7]), .Y(n32) );
  INVX2M U44 ( .A(A[6]), .Y(n33) );
  INVX2M U45 ( .A(A[5]), .Y(n34) );
  INVX2M U46 ( .A(B[3]), .Y(n28) );
  INVX2M U47 ( .A(B[7]), .Y(n24) );
  INVX2M U48 ( .A(B[4]), .Y(n27) );
  INVX2M U49 ( .A(B[5]), .Y(n26) );
  INVX2M U50 ( .A(B[0]), .Y(n31) );
  INVX2M U51 ( .A(B[2]), .Y(n29) );
  INVX2M U52 ( .A(B[1]), .Y(n30) );
  NOR2X1M U54 ( .A(n32), .B(n24), .Y(\ab[7][7] ) );
  NOR2X1M U55 ( .A(n32), .B(n25), .Y(\ab[7][6] ) );
  NOR2X1M U56 ( .A(n32), .B(n26), .Y(\ab[7][5] ) );
  NOR2X1M U57 ( .A(n32), .B(n27), .Y(\ab[7][4] ) );
  NOR2X1M U58 ( .A(n32), .B(n28), .Y(\ab[7][3] ) );
  NOR2X1M U59 ( .A(n32), .B(n29), .Y(\ab[7][2] ) );
  NOR2X1M U60 ( .A(n32), .B(n30), .Y(\ab[7][1] ) );
  NOR2X1M U61 ( .A(n32), .B(n31), .Y(\ab[7][0] ) );
  NOR2X1M U62 ( .A(n24), .B(n33), .Y(\ab[6][7] ) );
  NOR2X1M U63 ( .A(n25), .B(n33), .Y(\ab[6][6] ) );
  NOR2X1M U64 ( .A(n26), .B(n33), .Y(\ab[6][5] ) );
  NOR2X1M U65 ( .A(n27), .B(n33), .Y(\ab[6][4] ) );
  NOR2X1M U66 ( .A(n28), .B(n33), .Y(\ab[6][3] ) );
  NOR2X1M U67 ( .A(n29), .B(n33), .Y(\ab[6][2] ) );
  NOR2X1M U68 ( .A(n30), .B(n33), .Y(\ab[6][1] ) );
  NOR2X1M U69 ( .A(n31), .B(n33), .Y(\ab[6][0] ) );
  NOR2X1M U70 ( .A(n24), .B(n34), .Y(\ab[5][7] ) );
  NOR2X1M U71 ( .A(n25), .B(n34), .Y(\ab[5][6] ) );
  NOR2X1M U72 ( .A(n26), .B(n34), .Y(\ab[5][5] ) );
  NOR2X1M U73 ( .A(n27), .B(n34), .Y(\ab[5][4] ) );
  NOR2X1M U74 ( .A(n28), .B(n34), .Y(\ab[5][3] ) );
  NOR2X1M U75 ( .A(n29), .B(n34), .Y(\ab[5][2] ) );
  NOR2X1M U76 ( .A(n30), .B(n34), .Y(\ab[5][1] ) );
  NOR2X1M U77 ( .A(n31), .B(n34), .Y(\ab[5][0] ) );
  NOR2X1M U78 ( .A(n24), .B(n35), .Y(\ab[4][7] ) );
  NOR2X1M U79 ( .A(n25), .B(n35), .Y(\ab[4][6] ) );
  NOR2X1M U80 ( .A(n26), .B(n35), .Y(\ab[4][5] ) );
  NOR2X1M U81 ( .A(n27), .B(n35), .Y(\ab[4][4] ) );
  NOR2X1M U82 ( .A(n28), .B(n35), .Y(\ab[4][3] ) );
  NOR2X1M U83 ( .A(n29), .B(n35), .Y(\ab[4][2] ) );
  NOR2X1M U84 ( .A(n30), .B(n35), .Y(\ab[4][1] ) );
  NOR2X1M U85 ( .A(n31), .B(n35), .Y(\ab[4][0] ) );
  NOR2X1M U86 ( .A(n24), .B(n36), .Y(\ab[3][7] ) );
  NOR2X1M U87 ( .A(n25), .B(n36), .Y(\ab[3][6] ) );
  NOR2X1M U88 ( .A(n26), .B(n36), .Y(\ab[3][5] ) );
  NOR2X1M U89 ( .A(n27), .B(n36), .Y(\ab[3][4] ) );
  NOR2X1M U90 ( .A(n28), .B(n36), .Y(\ab[3][3] ) );
  NOR2X1M U91 ( .A(n29), .B(n36), .Y(\ab[3][2] ) );
  NOR2X1M U92 ( .A(n30), .B(n36), .Y(\ab[3][1] ) );
  NOR2X1M U93 ( .A(n31), .B(n36), .Y(\ab[3][0] ) );
  NOR2X1M U94 ( .A(n24), .B(n37), .Y(\ab[2][7] ) );
  NOR2X1M U95 ( .A(n25), .B(n37), .Y(\ab[2][6] ) );
  NOR2X1M U96 ( .A(n26), .B(n37), .Y(\ab[2][5] ) );
  NOR2X1M U97 ( .A(n27), .B(n37), .Y(\ab[2][4] ) );
  NOR2X1M U98 ( .A(n28), .B(n37), .Y(\ab[2][3] ) );
  NOR2X1M U99 ( .A(n29), .B(n37), .Y(\ab[2][2] ) );
  NOR2X1M U100 ( .A(n30), .B(n37), .Y(\ab[2][1] ) );
  NOR2X1M U101 ( .A(n31), .B(n37), .Y(\ab[2][0] ) );
  NOR2X1M U102 ( .A(n24), .B(n38), .Y(\ab[1][7] ) );
  NOR2X1M U103 ( .A(n25), .B(n38), .Y(\ab[1][6] ) );
  NOR2X1M U104 ( .A(n26), .B(n38), .Y(\ab[1][5] ) );
  NOR2X1M U105 ( .A(n27), .B(n38), .Y(\ab[1][4] ) );
  NOR2X1M U106 ( .A(n28), .B(n38), .Y(\ab[1][3] ) );
  NOR2X1M U107 ( .A(n29), .B(n38), .Y(\ab[1][2] ) );
  NOR2X1M U108 ( .A(n30), .B(n38), .Y(\ab[1][1] ) );
  NOR2X1M U109 ( .A(n31), .B(n38), .Y(\ab[1][0] ) );
  NOR2X1M U110 ( .A(n24), .B(n39), .Y(\ab[0][7] ) );
  NOR2X1M U111 ( .A(n25), .B(n39), .Y(\ab[0][6] ) );
  NOR2X1M U112 ( .A(n26), .B(n39), .Y(\ab[0][5] ) );
  NOR2X1M U113 ( .A(n27), .B(n39), .Y(\ab[0][4] ) );
  NOR2X1M U114 ( .A(n28), .B(n39), .Y(\ab[0][3] ) );
  NOR2X1M U115 ( .A(n29), .B(n39), .Y(\ab[0][2] ) );
  NOR2X1M U116 ( .A(n30), .B(n39), .Y(\ab[0][1] ) );
  NOR2X1M U117 ( .A(n31), .B(n39), .Y(PRODUCT[0]) );
endmodule


module alU ( clk, reset_n, en, A, B, ALU_FUN, ALU_OUT, OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input clk, reset_n, en;
  output OUT_VALID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, N125,
         N126, N127, N128, N129, N130, N131, N132, N157, N158, N159, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140;
  wire   [15:0] ALU_OUT_next;

  alU_DW_div_uns_0 div_39 ( .a({n12, n11, n10, n9, n8, n7, n6, n5}), .b({B[7], 
        n4, B[5:0]}), .quotient({N132, N131, N130, N129, N128, N127, N126, 
        N125}) );
  alU_DW01_sub_0 sub_37 ( .A({1'b0, n12, n11, n10, n9, n8, n7, n6, n5}), .B({
        1'b0, B[7], n4, B[5:0]}), .CI(1'b0), .DIFF({N108, N107, N106, N105, 
        N104, N103, N102, N101, N100}) );
  alU_DW01_add_0 add_36 ( .A({1'b0, n12, n11, n10, n9, n8, n7, n6, n5}), .B({
        1'b0, B[7], n4, B[5:0]}), .CI(1'b0), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92, N91}) );
  alU_DW02_mult_0 mult_38 ( .A({n12, n11, n10, n9, n8, n7, n6, n5}), .B({B[7], 
        n4, B[5:0]}), .TC(1'b0), .PRODUCT({N124, N123, N122, N121, N120, N119, 
        N118, N117, N116, N115, N114, N113, N112, N111, N110, N109}) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_next[7]), .CK(clk), .RN(reset_n), .Q(
        ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_next[6]), .CK(clk), .RN(reset_n), .Q(
        ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_next[5]), .CK(clk), .RN(reset_n), .Q(
        ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_next[4]), .CK(clk), .RN(reset_n), .Q(
        ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_next[3]), .CK(clk), .RN(reset_n), .Q(
        ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_next[2]), .CK(clk), .RN(reset_n), .Q(
        ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_OUT_next[1]), .CK(clk), .RN(reset_n), .Q(
        ALU_OUT[1]) );
  DFFRQX2M \ALU_OUT_reg[0]  ( .D(ALU_OUT_next[0]), .CK(clk), .RN(reset_n), .Q(
        ALU_OUT[0]) );
  DFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_OUT_next[15]), .CK(clk), .RN(reset_n), 
        .Q(ALU_OUT[15]) );
  DFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_OUT_next[14]), .CK(clk), .RN(reset_n), 
        .Q(ALU_OUT[14]) );
  DFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_OUT_next[13]), .CK(clk), .RN(reset_n), 
        .Q(ALU_OUT[13]) );
  DFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_OUT_next[12]), .CK(clk), .RN(reset_n), 
        .Q(ALU_OUT[12]) );
  DFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_OUT_next[11]), .CK(clk), .RN(reset_n), 
        .Q(ALU_OUT[11]) );
  DFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_OUT_next[10]), .CK(clk), .RN(reset_n), 
        .Q(ALU_OUT[10]) );
  DFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_OUT_next[9]), .CK(clk), .RN(reset_n), .Q(
        ALU_OUT[9]) );
  DFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_OUT_next[8]), .CK(clk), .RN(reset_n), .Q(
        ALU_OUT[8]) );
  DFFRQX2M OUT_VALID_reg ( .D(en), .CK(clk), .RN(reset_n), .Q(OUT_VALID) );
  BUFX2M U3 ( .A(A[6]), .Y(n11) );
  OAI2BB1X2M U4 ( .A0N(N124), .A1N(n31), .B0(n32), .Y(ALU_OUT_next[15]) );
  OAI2BB1X2M U7 ( .A0N(N123), .A1N(n31), .B0(n32), .Y(ALU_OUT_next[14]) );
  OAI2BB1X2M U8 ( .A0N(N121), .A1N(n31), .B0(n32), .Y(ALU_OUT_next[12]) );
  OAI2BB1X2M U9 ( .A0N(N122), .A1N(n31), .B0(n32), .Y(ALU_OUT_next[13]) );
  OAI2BB1X2M U10 ( .A0N(N118), .A1N(n31), .B0(n32), .Y(ALU_OUT_next[9]) );
  OAI2BB1X2M U11 ( .A0N(N119), .A1N(n31), .B0(n32), .Y(ALU_OUT_next[10]) );
  OAI2BB1X2M U12 ( .A0N(N120), .A1N(n31), .B0(n32), .Y(ALU_OUT_next[11]) );
  OAI2BB1X2M U13 ( .A0N(n127), .A1N(n105), .B0(n101), .Y(n47) );
  OAI2BB1X2M U14 ( .A0N(n100), .A1N(n99), .B0(n101), .Y(n48) );
  AND2X2M U15 ( .A(n99), .B(n105), .Y(n42) );
  AND2X2M U16 ( .A(n106), .B(n105), .Y(n50) );
  BUFX2M U17 ( .A(n41), .Y(n13) );
  NOR2X2M U18 ( .A(n107), .B(n125), .Y(n41) );
  INVX2M U19 ( .A(n100), .Y(n125) );
  INVX2M U20 ( .A(n107), .Y(n127) );
  NOR2BX2M U21 ( .AN(n106), .B(n125), .Y(n37) );
  NOR2BX2M U22 ( .AN(n35), .B(n124), .Y(n31) );
  INVX2M U23 ( .A(n91), .Y(n126) );
  NOR3BX2M U24 ( .AN(n105), .B(n128), .C(ALU_FUN[2]), .Y(n49) );
  NOR2X2M U25 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n106) );
  AND3X2M U26 ( .A(n106), .B(n129), .C(n3), .Y(n46) );
  NAND2X2M U27 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n107) );
  INVX2M U28 ( .A(ALU_FUN[0]), .Y(n129) );
  NOR2X2M U29 ( .A(n129), .B(n3), .Y(n105) );
  NOR2X2M U30 ( .A(n3), .B(ALU_FUN[0]), .Y(n100) );
  NAND2X2M U31 ( .A(en), .B(n123), .Y(n32) );
  INVX2M U32 ( .A(ALU_FUN[1]), .Y(n128) );
  NAND3X2M U33 ( .A(n106), .B(ALU_FUN[0]), .C(n3), .Y(n101) );
  AND2X2M U34 ( .A(ALU_FUN[2]), .B(n128), .Y(n99) );
  AND4X2M U35 ( .A(N159), .B(n99), .C(n3), .D(n129), .Y(n90) );
  NOR3X2M U36 ( .A(n125), .B(ALU_FUN[2]), .C(n128), .Y(n35) );
  NAND3X2M U37 ( .A(n127), .B(n129), .C(n3), .Y(n36) );
  NAND3X2M U38 ( .A(n3), .B(ALU_FUN[0]), .C(n99), .Y(n91) );
  INVX2M U39 ( .A(en), .Y(n124) );
  AOI31X2M U40 ( .A0(n93), .A1(n94), .A2(n95), .B0(n124), .Y(ALU_OUT_next[0])
         );
  AOI22X1M U41 ( .A0(N100), .A1(n50), .B0(N91), .B1(n37), .Y(n93) );
  AOI211X2M U42 ( .A0(n13), .A1(n140), .B0(n96), .C0(n97), .Y(n95) );
  AOI222X1M U43 ( .A0(N109), .A1(n35), .B0(n5), .B1(n42), .C0(N125), .C1(n49), 
        .Y(n94) );
  AOI31X2M U44 ( .A0(n81), .A1(n82), .A2(n83), .B0(n124), .Y(ALU_OUT_next[1])
         );
  AOI222X1M U45 ( .A0(N92), .A1(n37), .B0(N110), .B1(n35), .C0(N101), .C1(n50), 
        .Y(n81) );
  AOI211X2M U46 ( .A0(n7), .A1(n126), .B0(n84), .C0(n85), .Y(n83) );
  AOI222X1M U47 ( .A0(N126), .A1(n49), .B0(n13), .B1(n139), .C0(n6), .C1(n42), 
        .Y(n82) );
  AOI31X2M U48 ( .A0(n75), .A1(n76), .A2(n77), .B0(n124), .Y(ALU_OUT_next[2])
         );
  AOI22X1M U49 ( .A0(N102), .A1(n50), .B0(N93), .B1(n37), .Y(n75) );
  AOI221XLM U50 ( .A0(n8), .A1(n126), .B0(n13), .B1(n138), .C0(n78), .Y(n77)
         );
  AOI222X1M U51 ( .A0(N111), .A1(n35), .B0(n7), .B1(n42), .C0(N127), .C1(n49), 
        .Y(n76) );
  AOI31X2M U52 ( .A0(n69), .A1(n70), .A2(n71), .B0(n124), .Y(ALU_OUT_next[3])
         );
  AOI22X1M U53 ( .A0(N103), .A1(n50), .B0(N94), .B1(n37), .Y(n69) );
  AOI221XLM U54 ( .A0(n9), .A1(n126), .B0(n13), .B1(n137), .C0(n72), .Y(n71)
         );
  AOI222X1M U55 ( .A0(N112), .A1(n35), .B0(n8), .B1(n42), .C0(N128), .C1(n49), 
        .Y(n70) );
  AOI31X2M U56 ( .A0(n63), .A1(n64), .A2(n65), .B0(n124), .Y(ALU_OUT_next[4])
         );
  AOI22X1M U57 ( .A0(N104), .A1(n50), .B0(N95), .B1(n37), .Y(n63) );
  AOI221XLM U58 ( .A0(n126), .A1(n10), .B0(n13), .B1(n136), .C0(n66), .Y(n65)
         );
  AOI222X1M U59 ( .A0(N113), .A1(n35), .B0(n9), .B1(n42), .C0(N129), .C1(n49), 
        .Y(n64) );
  AOI31X2M U60 ( .A0(n57), .A1(n58), .A2(n59), .B0(n124), .Y(ALU_OUT_next[5])
         );
  AOI22X1M U61 ( .A0(N105), .A1(n50), .B0(N96), .B1(n37), .Y(n57) );
  AOI221XLM U62 ( .A0(n126), .A1(n11), .B0(n13), .B1(n135), .C0(n60), .Y(n59)
         );
  AOI222X1M U63 ( .A0(N114), .A1(n35), .B0(n10), .B1(n42), .C0(N130), .C1(n49), 
        .Y(n58) );
  AOI31X2M U64 ( .A0(n38), .A1(n39), .A2(n40), .B0(n124), .Y(ALU_OUT_next[7])
         );
  AOI22X1M U65 ( .A0(N107), .A1(n50), .B0(N98), .B1(n37), .Y(n38) );
  AOI221XLM U66 ( .A0(n13), .A1(n133), .B0(n42), .B1(n12), .C0(n43), .Y(n40)
         );
  AOI22X1M U67 ( .A0(N132), .A1(n49), .B0(N116), .B1(n35), .Y(n39) );
  AOI21X2M U68 ( .A0(n33), .A1(n34), .B0(n124), .Y(ALU_OUT_next[8]) );
  AOI21X2M U69 ( .A0(N99), .A1(n37), .B0(n123), .Y(n33) );
  AOI2BB2XLM U70 ( .B0(N117), .B1(n35), .A0N(n133), .A1N(n36), .Y(n34) );
  OAI222X1M U71 ( .A0(n55), .A1(n122), .B0(n4), .B1(n56), .C0(n36), .C1(n135), 
        .Y(n54) );
  AOI221XLM U72 ( .A0(n11), .A1(n46), .B0(n47), .B1(n134), .C0(n13), .Y(n56)
         );
  AOI221XLM U73 ( .A0(n46), .A1(n134), .B0(n11), .B1(n48), .C0(n42), .Y(n55)
         );
  INVX2M U74 ( .A(n25), .Y(n120) );
  AOI31X2M U75 ( .A0(n51), .A1(n52), .A2(n53), .B0(n124), .Y(ALU_OUT_next[6])
         );
  AOI22X1M U76 ( .A0(N106), .A1(n50), .B0(N97), .B1(n37), .Y(n51) );
  AOI221XLM U77 ( .A0(n126), .A1(n12), .B0(n13), .B1(n134), .C0(n54), .Y(n53)
         );
  AOI222X1M U78 ( .A0(N115), .A1(n35), .B0(n42), .B1(n11), .C0(N131), .C1(n49), 
        .Y(n52) );
  INVX2M U79 ( .A(n92), .Y(n123) );
  AOI211X2M U80 ( .A0(N108), .A1(n50), .B0(n13), .C0(n47), .Y(n92) );
  BUFX2M U81 ( .A(ALU_FUN[3]), .Y(n3) );
  INVX2M U82 ( .A(n116), .Y(N158) );
  INVX2M U83 ( .A(n4), .Y(n122) );
  INVX2M U84 ( .A(n6), .Y(n139) );
  INVX2M U85 ( .A(n5), .Y(n140) );
  INVX2M U86 ( .A(n11), .Y(n134) );
  INVX2M U87 ( .A(n12), .Y(n133) );
  INVX2M U88 ( .A(n8), .Y(n137) );
  INVX2M U89 ( .A(n7), .Y(n138) );
  INVX2M U90 ( .A(n10), .Y(n135) );
  INVX2M U91 ( .A(n9), .Y(n136) );
  BUFX2M U92 ( .A(B[6]), .Y(n4) );
  BUFX2M U93 ( .A(A[7]), .Y(n12) );
  BUFX2M U94 ( .A(A[5]), .Y(n10) );
  BUFX2M U95 ( .A(A[4]), .Y(n9) );
  BUFX2M U96 ( .A(A[3]), .Y(n8) );
  BUFX2M U97 ( .A(A[2]), .Y(n7) );
  BUFX2M U98 ( .A(A[1]), .Y(n6) );
  BUFX2M U99 ( .A(A[0]), .Y(n5) );
  OAI2B2X1M U100 ( .A1N(B[0]), .A0(n98), .B0(n91), .B1(n139), .Y(n97) );
  AOI221XLM U101 ( .A0(n46), .A1(n140), .B0(n5), .B1(n48), .C0(n42), .Y(n98)
         );
  OAI2B2X1M U102 ( .A1N(B[1]), .A0(n86), .B0(n36), .B1(n140), .Y(n85) );
  AOI221XLM U103 ( .A0(n46), .A1(n139), .B0(n6), .B1(n48), .C0(n42), .Y(n86)
         );
  OAI222X1M U104 ( .A0(n79), .A1(n119), .B0(B[2]), .B1(n80), .C0(n36), .C1(
        n139), .Y(n78) );
  AOI221XLM U105 ( .A0(n7), .A1(n46), .B0(n47), .B1(n138), .C0(n13), .Y(n80)
         );
  AOI221XLM U106 ( .A0(n46), .A1(n138), .B0(n7), .B1(n48), .C0(n42), .Y(n79)
         );
  OAI222X1M U107 ( .A0(n73), .A1(n121), .B0(B[3]), .B1(n74), .C0(n36), .C1(
        n138), .Y(n72) );
  AOI221XLM U108 ( .A0(n8), .A1(n46), .B0(n47), .B1(n137), .C0(n13), .Y(n74)
         );
  AOI221XLM U109 ( .A0(n46), .A1(n137), .B0(n8), .B1(n48), .C0(n42), .Y(n73)
         );
  OAI222X1M U110 ( .A0(n67), .A1(n132), .B0(B[4]), .B1(n68), .C0(n36), .C1(
        n137), .Y(n66) );
  INVX2M U111 ( .A(B[4]), .Y(n132) );
  AOI221XLM U112 ( .A0(n9), .A1(n46), .B0(n47), .B1(n136), .C0(n13), .Y(n68)
         );
  AOI221XLM U113 ( .A0(n46), .A1(n136), .B0(n9), .B1(n48), .C0(n42), .Y(n67)
         );
  OAI222X1M U114 ( .A0(n61), .A1(n131), .B0(B[5]), .B1(n62), .C0(n36), .C1(
        n136), .Y(n60) );
  INVX2M U115 ( .A(B[5]), .Y(n131) );
  AOI221XLM U116 ( .A0(n10), .A1(n46), .B0(n47), .B1(n135), .C0(n13), .Y(n62)
         );
  AOI221XLM U117 ( .A0(n46), .A1(n135), .B0(n10), .B1(n48), .C0(n42), .Y(n61)
         );
  OAI222X1M U118 ( .A0(n44), .A1(n130), .B0(B[7]), .B1(n45), .C0(n36), .C1(
        n134), .Y(n43) );
  INVX2M U119 ( .A(B[7]), .Y(n130) );
  AOI221XLM U120 ( .A0(n46), .A1(n12), .B0(n47), .B1(n133), .C0(n13), .Y(n45)
         );
  AOI221XLM U121 ( .A0(n46), .A1(n133), .B0(n12), .B1(n48), .C0(n42), .Y(n44)
         );
  INVX2M U122 ( .A(n14), .Y(n118) );
  OAI21X2M U123 ( .A0(B[0]), .A1(n102), .B0(n103), .Y(n96) );
  AOI221XLM U124 ( .A0(n5), .A1(n46), .B0(n47), .B1(n140), .C0(n13), .Y(n102)
         );
  AOI31X2M U125 ( .A0(N157), .A1(n3), .A2(n104), .B0(n90), .Y(n103) );
  NOR3X2M U126 ( .A(n128), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n104) );
  OAI21X2M U127 ( .A0(B[1]), .A1(n87), .B0(n88), .Y(n84) );
  AOI221XLM U128 ( .A0(n6), .A1(n46), .B0(n47), .B1(n139), .C0(n13), .Y(n87)
         );
  AOI31X2M U129 ( .A0(N158), .A1(n3), .A2(n89), .B0(n90), .Y(n88) );
  NOR3X2M U130 ( .A(n129), .B(ALU_FUN[2]), .C(n128), .Y(n89) );
  INVX2M U131 ( .A(B[0]), .Y(n117) );
  INVX2M U132 ( .A(B[2]), .Y(n119) );
  INVX2M U133 ( .A(B[3]), .Y(n121) );
  NOR2X1M U134 ( .A(n133), .B(B[7]), .Y(n113) );
  NAND2BX1M U135 ( .AN(B[4]), .B(n9), .Y(n29) );
  NAND2BX1M U136 ( .AN(n9), .B(B[4]), .Y(n18) );
  CLKNAND2X2M U137 ( .A(n29), .B(n18), .Y(n108) );
  NOR2X1M U138 ( .A(n121), .B(n8), .Y(n26) );
  NOR2X1M U139 ( .A(n119), .B(n7), .Y(n17) );
  NOR2X1M U140 ( .A(n117), .B(n5), .Y(n14) );
  CLKNAND2X2M U141 ( .A(n7), .B(n119), .Y(n28) );
  NAND2BX1M U142 ( .AN(n17), .B(n28), .Y(n23) );
  AOI21X1M U143 ( .A0(n14), .A1(n139), .B0(B[1]), .Y(n15) );
  AOI211X1M U144 ( .A0(n6), .A1(n118), .B0(n23), .C0(n15), .Y(n16) );
  CLKNAND2X2M U145 ( .A(n8), .B(n121), .Y(n27) );
  OAI31X1M U146 ( .A0(n26), .A1(n17), .A2(n16), .B0(n27), .Y(n19) );
  NAND2BX1M U147 ( .AN(n10), .B(B[5]), .Y(n111) );
  OAI211X1M U148 ( .A0(n108), .A1(n19), .B0(n18), .C0(n111), .Y(n20) );
  NAND2BX1M U149 ( .AN(B[5]), .B(n10), .Y(n30) );
  XNOR2X1M U150 ( .A(n11), .B(n4), .Y(n110) );
  AOI32X1M U151 ( .A0(n20), .A1(n30), .A2(n110), .B0(n4), .B1(n134), .Y(n21)
         );
  CLKNAND2X2M U152 ( .A(B[7]), .B(n133), .Y(n114) );
  OAI21X1M U153 ( .A0(n113), .A1(n21), .B0(n114), .Y(N159) );
  CLKNAND2X2M U154 ( .A(n5), .B(n117), .Y(n24) );
  OA21X1M U155 ( .A0(n24), .A1(n139), .B0(B[1]), .Y(n22) );
  AOI211X1M U156 ( .A0(n24), .A1(n139), .B0(n23), .C0(n22), .Y(n25) );
  AOI31X1M U157 ( .A0(n120), .A1(n28), .A2(n27), .B0(n26), .Y(n109) );
  OAI2B11X1M U158 ( .A1N(n109), .A0(n108), .B0(n30), .C0(n29), .Y(n112) );
  AOI32X1M U159 ( .A0(n112), .A1(n111), .A2(n110), .B0(n11), .B1(n122), .Y(
        n115) );
  AOI2B1X1M U160 ( .A1N(n115), .A0(n114), .B0(n113), .Y(n116) );
  NOR2X1M U161 ( .A(N159), .B(N158), .Y(N157) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module UART_RX_FSM_scale_WIDTH6 ( clk, reset_n, RX_IN, PAR_EN, par_err, 
        strt_glitch, stp_err, edge_cnt, prescaler, bit_cnt, data_valid, enable, 
        deser_en, dat_samp_en, par_chk_en, strt_chk_en, stp_chk_en );
  input [5:0] edge_cnt;
  input [5:0] prescaler;
  input [3:0] bit_cnt;
  input clk, reset_n, RX_IN, PAR_EN, par_err, strt_glitch, stp_err;
  output data_valid, enable, deser_en, dat_samp_en, par_chk_en, strt_chk_en,
         stp_chk_en;
  wire   n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFRX1M \current_state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(reset_n), 
        .Q(current_state[0]), .QN(n12) );
  DFFRX1M \current_state_reg[2]  ( .D(next_state[2]), .CK(clk), .RN(reset_n), 
        .Q(current_state[2]), .QN(n14) );
  DFFRX1M \current_state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(reset_n), 
        .Q(current_state[1]) );
  NOR4XLM U3 ( .A(n40), .B(par_err), .C(strt_glitch), .D(stp_err), .Y(
        data_valid) );
  INVX2M U4 ( .A(n50), .Y(n15) );
  NAND2X2M U5 ( .A(n39), .B(n7), .Y(n24) );
  NOR2X2M U6 ( .A(n24), .B(n34), .Y(deser_en) );
  NOR2X2M U7 ( .A(n24), .B(n26), .Y(par_chk_en) );
  OAI21X2M U8 ( .A0(n27), .A1(n25), .B0(n28), .Y(next_state[2]) );
  AOI33X2M U9 ( .A0(n29), .A1(n1), .A2(n11), .B0(n30), .B1(n16), .B2(n13), .Y(
        n28) );
  INVX2M U10 ( .A(n29), .Y(n8) );
  INVX2M U11 ( .A(n30), .Y(n9) );
  INVX2M U12 ( .A(n26), .Y(n11) );
  INVX2M U13 ( .A(n34), .Y(n13) );
  NOR3BX2M U14 ( .AN(prescaler[5]), .B(prescaler[3]), .C(prescaler[4]), .Y(n50) );
  NOR3BX2M U15 ( .AN(prescaler[4]), .B(prescaler[3]), .C(prescaler[5]), .Y(n45) );
  NOR3BX2M U16 ( .AN(prescaler[3]), .B(prescaler[4]), .C(prescaler[5]), .Y(n46) );
  NAND3BX2M U17 ( .AN(n25), .B(n39), .C(edge_cnt[0]), .Y(n40) );
  AND4X2M U18 ( .A(edge_cnt[1]), .B(n41), .C(n42), .D(n2), .Y(n39) );
  OAI22X1M U19 ( .A0(n15), .A1(n43), .B0(edge_cnt[4]), .B1(n44), .Y(n42) );
  AOI33X2M U20 ( .A0(n45), .A1(n5), .A2(edge_cnt[3]), .B0(n46), .B1(n4), .B2(
        edge_cnt[2]), .Y(n44) );
  NOR3X2M U21 ( .A(prescaler[2]), .B(prescaler[1]), .C(prescaler[0]), .Y(n41)
         );
  OAI21X2M U22 ( .A0(current_state[2]), .A1(RX_IN), .B0(n38), .Y(enable) );
  OAI22X1M U23 ( .A0(n34), .A1(n30), .B0(n36), .B1(n23), .Y(next_state[0]) );
  OA22X2M U24 ( .A0(n12), .A1(strt_glitch), .B0(RX_IN), .B1(current_state[0]), 
        .Y(n36) );
  NOR3BX2M U25 ( .AN(n41), .B(n38), .C(n47), .Y(dat_samp_en) );
  AOI31X2M U26 ( .A0(n3), .A1(n2), .A2(n48), .B0(n49), .Y(n47) );
  INVX2M U27 ( .A(edge_cnt[4]), .Y(n3) );
  OAI32X1M U28 ( .A0(n7), .A1(edge_cnt[2]), .A2(n6), .B0(edge_cnt[1]), .B1(n5), 
        .Y(n54) );
  OAI22X1M U29 ( .A0(n51), .A1(n4), .B0(edge_cnt[3]), .B1(n52), .Y(n48) );
  AOI32X1M U30 ( .A0(n6), .A1(n5), .A2(n45), .B0(n53), .B1(n50), .Y(n51) );
  AOI22X1M U31 ( .A0(n53), .A1(n45), .B0(n46), .B1(n54), .Y(n52) );
  NOR3X2M U32 ( .A(n6), .B(n5), .C(n7), .Y(n53) );
  NOR4X1M U33 ( .A(edge_cnt[5]), .B(edge_cnt[1]), .C(n15), .D(n43), .Y(n49) );
  NAND3X2M U34 ( .A(n5), .B(n4), .C(edge_cnt[4]), .Y(n43) );
  INVX2M U35 ( .A(edge_cnt[2]), .Y(n5) );
  INVX2M U36 ( .A(edge_cnt[3]), .Y(n4) );
  INVX2M U37 ( .A(edge_cnt[1]), .Y(n6) );
  INVX2M U38 ( .A(edge_cnt[0]), .Y(n7) );
  AOI32X1M U39 ( .A0(n35), .A1(PAR_EN), .A2(bit_cnt[0]), .B0(n16), .B1(n8), 
        .Y(n27) );
  AND3X2M U40 ( .A(bit_cnt[1]), .B(n10), .C(bit_cnt[3]), .Y(n35) );
  XNOR2X2M U41 ( .A(n37), .B(bit_cnt[3]), .Y(n30) );
  NAND2BX2M U42 ( .AN(bit_cnt[1]), .B(n10), .Y(n37) );
  NAND4BX1M U43 ( .AN(bit_cnt[0]), .B(bit_cnt[3]), .C(bit_cnt[1]), .D(n10), 
        .Y(n29) );
  OAI211X2M U44 ( .A0(n27), .A1(n25), .B0(n31), .C0(n32), .Y(next_state[1]) );
  OAI21X2M U45 ( .A0(n8), .A1(n1), .B0(n11), .Y(n31) );
  AOI31X2M U46 ( .A0(n9), .A1(current_state[0]), .A2(n33), .B0(n13), .Y(n32)
         );
  NOR2X2M U47 ( .A(strt_glitch), .B(n23), .Y(n33) );
  NAND3X2M U48 ( .A(current_state[1]), .B(n12), .C(current_state[2]), .Y(n25)
         );
  NAND3X2M U49 ( .A(current_state[0]), .B(n14), .C(current_state[1]), .Y(n34)
         );
  NAND2BX2M U50 ( .AN(current_state[1]), .B(n14), .Y(n23) );
  NAND3X2M U51 ( .A(n12), .B(n14), .C(current_state[1]), .Y(n26) );
  NOR2X2M U52 ( .A(n24), .B(n25), .Y(stp_chk_en) );
  INVX2M U53 ( .A(par_err), .Y(n1) );
  INVX2M U54 ( .A(edge_cnt[5]), .Y(n2) );
  INVX2M U55 ( .A(bit_cnt[2]), .Y(n10) );
  NOR3X2M U56 ( .A(n12), .B(n23), .C(n24), .Y(strt_chk_en) );
  AND2X2M U57 ( .A(n25), .B(n55), .Y(n38) );
  OAI21X2M U58 ( .A0(current_state[0]), .A1(current_state[1]), .B0(n14), .Y(
        n55) );
  INVX2M U59 ( .A(PAR_EN), .Y(n16) );
endmodule


module edge_bit_counter_scale_WIDTH6 ( clk, reset_n, enable, prescaler, PAR_EN, 
        bit_cnt, edge_cnt );
  input [5:0] prescaler;
  output [3:0] bit_cnt;
  output [5:0] edge_cnt;
  input clk, reset_n, enable, PAR_EN;
  wire   N46, N47, N48, N62, N63, N64, N65, N66, N67, N75, N76, N77, N91, N92,
         N93, N94, N95, N96, N104, N105, N106, N120, N121, N122, N123, N124,
         N125, N146, N147, N148, N149, N150, N151, N152, N153, N154, N155,
         N181, N192, N199, N206, n8, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         N237, N233, N217, \add_106_aco/carry[5] , \add_106_aco/carry[4] ,
         \add_106_aco/carry[3] , \add_106_aco/carry[2] , \add_77_aco/carry[5] ,
         \add_77_aco/carry[4] , \add_77_aco/carry[3] , \add_77_aco/carry[2] ,
         \mult_add_77_aco/PROD_not[5] , \add_49_aco/carry[5] ,
         \add_49_aco/carry[4] , \add_49_aco/carry[3] , \add_49_aco/carry[2] ,
         \mult_add_35_aco/PROD_not[3] , \mult_add_63_aco/PROD_not[3] ,
         \mult_add_92_aco/PROD_not[3] , n1, n2, n3, n4, n5, n6, n7, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85;

  DFFSQX2M \edge_cnt_reg[0]  ( .D(N146), .CK(clk), .SN(reset_n), .Q(
        edge_cnt[0]) );
  DFFSQX2M \bit_cnt_reg[0]  ( .D(N152), .CK(clk), .SN(reset_n), .Q(bit_cnt[0])
         );
  DFFRX1M \bit_cnt_reg[3]  ( .D(N155), .CK(clk), .RN(reset_n), .Q(bit_cnt[3]), 
        .QN(n8) );
  DFFRX1M \edge_cnt_reg[1]  ( .D(N147), .CK(clk), .RN(reset_n), .Q(edge_cnt[1]) );
  DFFRX1M \edge_cnt_reg[2]  ( .D(N148), .CK(clk), .RN(reset_n), .Q(edge_cnt[2]) );
  DFFRX1M \bit_cnt_reg[2]  ( .D(N154), .CK(clk), .RN(reset_n), .Q(bit_cnt[2]), 
        .QN(n73) );
  DFFRX1M \bit_cnt_reg[1]  ( .D(N153), .CK(clk), .RN(reset_n), .Q(bit_cnt[1]), 
        .QN(n72) );
  DFFRX1M \edge_cnt_reg[3]  ( .D(N149), .CK(clk), .RN(reset_n), .Q(edge_cnt[3]), .QN(n69) );
  DFFRX1M \edge_cnt_reg[4]  ( .D(N150), .CK(clk), .RN(reset_n), .Q(edge_cnt[4]), .QN(n68) );
  DFFRX1M \edge_cnt_reg[5]  ( .D(N151), .CK(clk), .RN(reset_n), .Q(edge_cnt[5]), .QN(n67) );
  AND2X2M U3 ( .A(edge_cnt[2]), .B(N199), .Y(n1) );
  AND2X2M U4 ( .A(edge_cnt[2]), .B(N206), .Y(n2) );
  AND2X2M U5 ( .A(edge_cnt[2]), .B(N192), .Y(n3) );
  AND2X2M U6 ( .A(edge_cnt[1]), .B(N192), .Y(n4) );
  AND2X2M U7 ( .A(edge_cnt[1]), .B(N199), .Y(n5) );
  AND2X2M U8 ( .A(edge_cnt[1]), .B(N206), .Y(n6) );
  AND2X2M U9 ( .A(edge_cnt[3]), .B(N199), .Y(n7) );
  AND2X2M U10 ( .A(edge_cnt[3]), .B(N206), .Y(n9) );
  AND2X2M U11 ( .A(edge_cnt[3]), .B(N192), .Y(n10) );
  AND2X2M U12 ( .A(edge_cnt[4]), .B(N199), .Y(n11) );
  AND2X2M U13 ( .A(edge_cnt[4]), .B(N206), .Y(n12) );
  AND2X2M U14 ( .A(edge_cnt[4]), .B(N192), .Y(n13) );
  NOR3X2M U15 ( .A(prescaler[4]), .B(prescaler[5]), .C(n78), .Y(n46) );
  OR3X2M U16 ( .A(n31), .B(n29), .C(n30), .Y(n40) );
  OAI2B11X2M U17 ( .A1N(N62), .A0(n77), .B0(n74), .C0(n55), .Y(N146) );
  INVX2M U18 ( .A(n59), .Y(N62) );
  AOI221XLM U19 ( .A0(N91), .A1(n75), .B0(N120), .B1(n65), .C0(n47), .Y(n55)
         );
  INVX2M U20 ( .A(n58), .Y(N91) );
  NOR2X2M U21 ( .A(n54), .B(n64), .Y(N147) );
  AOI222X1M U22 ( .A0(N63), .A1(n46), .B0(N121), .B1(n65), .C0(N92), .C1(n75), 
        .Y(n54) );
  NOR2X2M U23 ( .A(n53), .B(n64), .Y(N148) );
  AOI222X1M U24 ( .A0(N64), .A1(n46), .B0(N122), .B1(n65), .C0(N93), .C1(n75), 
        .Y(n53) );
  NOR2X2M U25 ( .A(n52), .B(n64), .Y(N149) );
  AOI222X1M U26 ( .A0(N65), .A1(n46), .B0(N123), .B1(n65), .C0(N94), .C1(n75), 
        .Y(n52) );
  NOR2X2M U27 ( .A(n51), .B(n64), .Y(N150) );
  AOI222X1M U28 ( .A0(N66), .A1(n46), .B0(N124), .B1(n65), .C0(N95), .C1(n75), 
        .Y(n51) );
  NOR2X2M U29 ( .A(n50), .B(n64), .Y(N151) );
  AOI222X1M U30 ( .A0(N67), .A1(n46), .B0(N125), .B1(n65), .C0(N96), .C1(n75), 
        .Y(n50) );
  INVX2M U31 ( .A(n64), .Y(n74) );
  AOI222X1M U32 ( .A0(N199), .A1(n75), .B0(N206), .B1(n65), .C0(N192), .C1(n46), .Y(n26) );
  XNOR2X2M U33 ( .A(n20), .B(n85), .Y(N105) );
  XNOR2X2M U34 ( .A(n60), .B(n70), .Y(N75) );
  XNOR2X2M U35 ( .A(n18), .B(n83), .Y(N76) );
  XNOR2X2M U36 ( .A(n61), .B(n70), .Y(N46) );
  XNOR2X2M U37 ( .A(n19), .B(n81), .Y(N47) );
  NOR2BX2M U38 ( .AN(n65), .B(N206), .Y(n29) );
  NOR2X2M U39 ( .A(n48), .B(N199), .Y(n31) );
  NOR2X2M U40 ( .A(n77), .B(N192), .Y(n30) );
  OAI21X2M U41 ( .A0(n28), .A1(n25), .B0(n26), .Y(n35) );
  INVX2M U42 ( .A(n25), .Y(n66) );
  NAND2X2M U43 ( .A(n60), .B(n15), .Y(n83) );
  NAND2X2M U44 ( .A(n61), .B(n16), .Y(n81) );
  NAND2X2M U45 ( .A(n62), .B(n17), .Y(n85) );
  XNOR2X2M U46 ( .A(n62), .B(n70), .Y(N104) );
  NOR2X2M U47 ( .A(n71), .B(n72), .Y(n28) );
  NOR2BX2M U48 ( .AN(n28), .B(n73), .Y(n27) );
  INVX2M U49 ( .A(n17), .Y(n70) );
  INVX2M U50 ( .A(n57), .Y(N120) );
  NOR3X2M U51 ( .A(n75), .B(n46), .C(n65), .Y(n47) );
  INVX2M U52 ( .A(n46), .Y(n77) );
  INVX2M U53 ( .A(n48), .Y(n75) );
  OAI211X2M U54 ( .A0(n42), .A1(n79), .B0(n43), .C0(n44), .Y(N152) );
  AOI31X2M U55 ( .A0(n79), .A1(n71), .A2(n40), .B0(n47), .Y(n43) );
  AOI222X1M U56 ( .A0(n70), .A1(n29), .B0(n70), .B1(n30), .C0(n70), .C1(n31), 
        .Y(n42) );
  AOI2B1X1M U57 ( .A1N(n26), .A0(bit_cnt[0]), .B0(n64), .Y(n44) );
  BUFX2M U58 ( .A(n34), .Y(n64) );
  NAND3BX2M U59 ( .AN(prescaler[0]), .B(enable), .C(n56), .Y(n34) );
  NOR2X2M U60 ( .A(prescaler[2]), .B(prescaler[1]), .Y(n56) );
  AOI2B1X1M U61 ( .A1N(n32), .A0(n33), .B0(n64), .Y(N154) );
  NOR2X2M U62 ( .A(n36), .B(n79), .Y(n32) );
  AOI32X1M U63 ( .A0(n28), .A1(n73), .A2(n66), .B0(bit_cnt[2]), .B1(n35), .Y(
        n33) );
  AOI222X1M U64 ( .A0(N105), .A1(n29), .B0(N47), .B1(n30), .C0(N76), .C1(n31), 
        .Y(n36) );
  AOI2B1X1M U65 ( .A1N(n37), .A0(n38), .B0(n64), .Y(N153) );
  NOR2X2M U66 ( .A(n41), .B(n79), .Y(n37) );
  AOI32X1M U67 ( .A0(bit_cnt[0]), .A1(n72), .A2(n66), .B0(bit_cnt[1]), .B1(n39), .Y(n38) );
  AOI222X1M U68 ( .A0(N104), .A1(n29), .B0(N46), .B1(n30), .C0(N75), .C1(n31), 
        .Y(n41) );
  AND2X2M U69 ( .A(n22), .B(n74), .Y(N155) );
  OAI222X1M U70 ( .A0(n23), .A1(n79), .B0(n24), .B1(n25), .C0(n26), .C1(n8), 
        .Y(n22) );
  CLKXOR2X2M U71 ( .A(n8), .B(n27), .Y(n24) );
  AOI222X1M U72 ( .A0(N106), .A1(n29), .B0(N48), .B1(n30), .C0(N77), .C1(n31), 
        .Y(n23) );
  OAI2B11X2M U73 ( .A1N(n21), .A0(bit_cnt[0]), .B0(n79), .C0(n40), .Y(n25) );
  NOR3X2M U74 ( .A(edge_cnt[2]), .B(edge_cnt[1]), .C(edge_cnt[0]), .Y(n49) );
  AND2X2M U75 ( .A(N206), .B(edge_cnt[5]), .Y(n14) );
  AND2X2M U76 ( .A(bit_cnt[0]), .B(N181), .Y(n15) );
  AND2X2M U77 ( .A(bit_cnt[0]), .B(N181), .Y(n16) );
  AND2X2M U78 ( .A(bit_cnt[0]), .B(N181), .Y(n17) );
  AND2X2M U79 ( .A(bit_cnt[2]), .B(N181), .Y(n18) );
  AND2X2M U80 ( .A(bit_cnt[2]), .B(N181), .Y(n19) );
  AND2X2M U81 ( .A(bit_cnt[2]), .B(N181), .Y(n20) );
  AND2X2M U82 ( .A(edge_cnt[0]), .B(N206), .Y(n57) );
  AND2X2M U83 ( .A(edge_cnt[0]), .B(N199), .Y(n58) );
  NOR3X2M U84 ( .A(n72), .B(bit_cnt[2]), .C(n8), .Y(n21) );
  NAND4X2M U85 ( .A(edge_cnt[3]), .B(n49), .C(n68), .D(n67), .Y(N192) );
  NAND4X2M U86 ( .A(edge_cnt[5]), .B(n49), .C(n69), .D(n68), .Y(N206) );
  NAND4X2M U87 ( .A(edge_cnt[4]), .B(n49), .C(n69), .D(n67), .Y(N199) );
  OAI21X2M U88 ( .A0(bit_cnt[0]), .A1(n25), .B0(n26), .Y(n39) );
  XNOR2X2M U89 ( .A(\add_77_aco/carry[5] ), .B(\mult_add_77_aco/PROD_not[5] ), 
        .Y(N96) );
  ADDHX1M U90 ( .A(n4), .B(n59), .CO(\add_49_aco/carry[2] ), .S(N63) );
  AND2X2M U91 ( .A(edge_cnt[0]), .B(N192), .Y(n59) );
  AND2X2M U92 ( .A(bit_cnt[1]), .B(N181), .Y(n60) );
  AND2X2M U93 ( .A(bit_cnt[1]), .B(N181), .Y(n61) );
  AND2X2M U94 ( .A(bit_cnt[1]), .B(N181), .Y(n62) );
  NAND2X2M U95 ( .A(bit_cnt[0]), .B(n21), .Y(N181) );
  AND2X2M U96 ( .A(N192), .B(edge_cnt[5]), .Y(n63) );
  ADDHX1M U97 ( .A(n7), .B(\add_77_aco/carry[3] ), .CO(\add_77_aco/carry[4] ), 
        .S(N94) );
  ADDHX1M U98 ( .A(n9), .B(\add_106_aco/carry[3] ), .CO(\add_106_aco/carry[4] ), .S(N123) );
  ADDHX1M U99 ( .A(n10), .B(\add_49_aco/carry[3] ), .CO(\add_49_aco/carry[4] ), 
        .S(N65) );
  ADDHX1M U100 ( .A(n5), .B(n58), .CO(\add_77_aco/carry[2] ), .S(N92) );
  ADDHX1M U101 ( .A(n6), .B(n57), .CO(\add_106_aco/carry[2] ), .S(N121) );
  ADDHX1M U102 ( .A(n1), .B(\add_77_aco/carry[2] ), .CO(\add_77_aco/carry[3] ), 
        .S(N93) );
  ADDHX1M U103 ( .A(n2), .B(\add_106_aco/carry[2] ), .CO(
        \add_106_aco/carry[3] ), .S(N122) );
  ADDHX1M U104 ( .A(n3), .B(\add_49_aco/carry[2] ), .CO(\add_49_aco/carry[3] ), 
        .S(N64) );
  CLKXOR2X2M U105 ( .A(N237), .B(n84), .Y(N106) );
  INVX2M U106 ( .A(\mult_add_92_aco/PROD_not[3] ), .Y(N237) );
  NOR2BX2M U107 ( .AN(n20), .B(n85), .Y(n84) );
  CLKXOR2X2M U108 ( .A(N233), .B(n82), .Y(N77) );
  INVX2M U109 ( .A(\mult_add_63_aco/PROD_not[3] ), .Y(N233) );
  NOR2BX2M U110 ( .AN(n18), .B(n83), .Y(n82) );
  CLKXOR2X2M U111 ( .A(N217), .B(n80), .Y(N48) );
  INVX2M U112 ( .A(\mult_add_35_aco/PROD_not[3] ), .Y(N217) );
  NOR2BX2M U113 ( .AN(n19), .B(n81), .Y(n80) );
  ADDHX1M U114 ( .A(n11), .B(\add_77_aco/carry[4] ), .CO(\add_77_aco/carry[5] ), .S(N95) );
  ADDHX1M U115 ( .A(n12), .B(\add_106_aco/carry[4] ), .CO(
        \add_106_aco/carry[5] ), .S(N124) );
  ADDHX1M U116 ( .A(n13), .B(\add_49_aco/carry[4] ), .CO(\add_49_aco/carry[5] ), .S(N66) );
  INVX2M U117 ( .A(bit_cnt[0]), .Y(n71) );
  NAND3X2M U118 ( .A(n78), .B(n76), .C(prescaler[4]), .Y(n48) );
  INVX2M U119 ( .A(prescaler[5]), .Y(n76) );
  INVX2M U120 ( .A(prescaler[3]), .Y(n78) );
  INVX2M U121 ( .A(PAR_EN), .Y(n79) );
  BUFX2M U122 ( .A(n45), .Y(n65) );
  NOR3X2M U123 ( .A(prescaler[3]), .B(prescaler[4]), .C(n76), .Y(n45) );
  CLKNAND2X2M U124 ( .A(N181), .B(bit_cnt[3]), .Y(
        \mult_add_92_aco/PROD_not[3] ) );
  CLKNAND2X2M U125 ( .A(N181), .B(bit_cnt[3]), .Y(
        \mult_add_63_aco/PROD_not[3] ) );
  CLKNAND2X2M U126 ( .A(N181), .B(bit_cnt[3]), .Y(
        \mult_add_35_aco/PROD_not[3] ) );
  CLKXOR2X2M U127 ( .A(\add_49_aco/carry[5] ), .B(n63), .Y(N67) );
  CLKNAND2X2M U128 ( .A(N199), .B(edge_cnt[5]), .Y(
        \mult_add_77_aco/PROD_not[5] ) );
  CLKXOR2X2M U129 ( .A(\add_106_aco/carry[5] ), .B(n14), .Y(N125) );
endmodule


module data_sampling_scale_WIDTH6 ( clk, reset_n, RX_IN, edge_cnt, prescaler, 
        dat_samp_en, sampled_bit );
  input [5:0] edge_cnt;
  input [5:0] prescaler;
  input clk, reset_n, RX_IN, dat_samp_en;
  output sampled_bit;
  wire   n1, n3, n4, n6, n7, n8, n10, n11, n12, n13, n16, n17, n18, n20, n21,
         n22, n24, n25, n26, n29, n30, n31, n32, n2, n5, n9, n14, n15, n19,
         n23, n27, n28;
  wire   [2:0] samples;

  DFFRX1M sampled_bit_reg ( .D(n29), .CK(clk), .RN(reset_n), .Q(sampled_bit)
         );
  DFFRX1M \samples_reg[2]  ( .D(n30), .CK(clk), .RN(reset_n), .Q(samples[2])
         );
  DFFRX1M \samples_reg[1]  ( .D(n31), .CK(clk), .RN(reset_n), .Q(samples[1])
         );
  DFFRX1M \samples_reg[0]  ( .D(n32), .CK(clk), .RN(reset_n), .Q(samples[0])
         );
  NOR4X1M U3 ( .A(prescaler[0]), .B(n5), .C(prescaler[2]), .D(prescaler[1]), 
        .Y(n8) );
  INVX2M U4 ( .A(n16), .Y(n2) );
  INVX2M U5 ( .A(n21), .Y(n19) );
  OAI2BB2X1M U6 ( .B0(n28), .B1(n24), .A0N(n24), .A1N(samples[0]), .Y(n32) );
  NAND4X2M U7 ( .A(edge_cnt[1]), .B(n8), .C(n25), .D(n10), .Y(n24) );
  AOI2BB2XLM U8 ( .B0(n26), .B1(edge_cnt[2]), .A0N(n11), .A1N(edge_cnt[2]), 
        .Y(n25) );
  AOI22X1M U9 ( .A0(n13), .A1(n9), .B0(edge_cnt[3]), .B1(n19), .Y(n26) );
  OAI2BB2X1M U10 ( .B0(n28), .B1(n17), .A0N(n17), .A1N(samples[1]), .Y(n31) );
  NAND3X2M U11 ( .A(n18), .B(n15), .C(n8), .Y(n17) );
  OAI32X1M U12 ( .A0(n20), .A1(edge_cnt[5]), .A2(edge_cnt[4]), .B0(n16), .B1(
        n21), .Y(n18) );
  AOI32X1M U13 ( .A0(n11), .A1(n14), .A2(edge_cnt[2]), .B0(n13), .B1(n12), .Y(
        n20) );
  OAI2BB2X1M U14 ( .B0(n4), .B1(n28), .A0N(n4), .A1N(samples[2]), .Y(n30) );
  OAI2B1X2M U15 ( .A1N(n6), .A0(n7), .B0(n8), .Y(n4) );
  AND4X2M U16 ( .A(n14), .B(n10), .C(n11), .D(edge_cnt[2]), .Y(n7) );
  AOI33X2M U17 ( .A0(n10), .A1(n12), .A2(n13), .B0(edge_cnt[0]), .B1(n2), .B2(
        n19), .Y(n6) );
  INVX2M U18 ( .A(RX_IN), .Y(n28) );
  INVX2M U19 ( .A(dat_samp_en), .Y(n5) );
  OAI2BB2X1M U20 ( .B0(n1), .B1(n5), .A0N(sampled_bit), .A1N(n5), .Y(n29) );
  AOI21X2M U21 ( .A0(samples[1]), .A1(samples[0]), .B0(n3), .Y(n1) );
  OA21X2M U22 ( .A0(samples[1]), .A1(samples[0]), .B0(samples[2]), .Y(n3) );
  NOR3X2M U23 ( .A(edge_cnt[4]), .B(edge_cnt[5]), .C(n15), .Y(n10) );
  NAND4BX1M U24 ( .AN(edge_cnt[2]), .B(edge_cnt[4]), .C(n14), .D(n22), .Y(n16)
         );
  NOR2X2M U25 ( .A(edge_cnt[5]), .B(edge_cnt[3]), .Y(n22) );
  NOR4X1M U26 ( .A(n27), .B(edge_cnt[3]), .C(prescaler[4]), .D(prescaler[5]), 
        .Y(n11) );
  NOR3X2M U27 ( .A(edge_cnt[1]), .B(edge_cnt[2]), .C(n9), .Y(n12) );
  INVX2M U28 ( .A(edge_cnt[3]), .Y(n9) );
  INVX2M U29 ( .A(edge_cnt[1]), .Y(n14) );
  INVX2M U30 ( .A(edge_cnt[0]), .Y(n15) );
  NOR3X2M U31 ( .A(prescaler[3]), .B(prescaler[5]), .C(n23), .Y(n13) );
  INVX2M U32 ( .A(prescaler[4]), .Y(n23) );
  INVX2M U33 ( .A(prescaler[3]), .Y(n27) );
  NAND3X2M U34 ( .A(n27), .B(n23), .C(prescaler[5]), .Y(n21) );
endmodule


module deserializer_DATA_WIDTH8 ( clk, reset_n, deser_en, sampled_bit, P_DATA
 );
  output [7:0] P_DATA;
  input clk, reset_n, deser_en, sampled_bit;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n1, n2, n3, n4, n5, n6, n7, n8,
         n17;

  DFFRX1M \DATA_reg[0]  ( .D(n16), .CK(clk), .RN(reset_n), .Q(P_DATA[0]), .QN(
        n2) );
  DFFRX1M \DATA_reg[7]  ( .D(n9), .CK(clk), .RN(reset_n), .Q(P_DATA[7]) );
  DFFRX1M \DATA_reg[6]  ( .D(n10), .CK(clk), .RN(reset_n), .Q(P_DATA[6]), .QN(
        n8) );
  DFFRX1M \DATA_reg[5]  ( .D(n11), .CK(clk), .RN(reset_n), .Q(P_DATA[5]), .QN(
        n7) );
  DFFRX1M \DATA_reg[4]  ( .D(n12), .CK(clk), .RN(reset_n), .Q(P_DATA[4]), .QN(
        n6) );
  DFFRX1M \DATA_reg[3]  ( .D(n13), .CK(clk), .RN(reset_n), .Q(P_DATA[3]), .QN(
        n5) );
  DFFRX1M \DATA_reg[2]  ( .D(n14), .CK(clk), .RN(reset_n), .Q(P_DATA[2]), .QN(
        n4) );
  DFFRX1M \DATA_reg[1]  ( .D(n15), .CK(clk), .RN(reset_n), .Q(P_DATA[1]), .QN(
        n3) );
  INVX2M U2 ( .A(n1), .Y(n17) );
  OAI22X1M U3 ( .A0(n1), .A1(n8), .B0(n17), .B1(n7), .Y(n10) );
  OAI22X1M U4 ( .A0(n1), .A1(n7), .B0(n17), .B1(n6), .Y(n11) );
  OAI22X1M U5 ( .A0(n1), .A1(n6), .B0(n17), .B1(n5), .Y(n12) );
  OAI22X1M U6 ( .A0(n1), .A1(n5), .B0(n17), .B1(n4), .Y(n13) );
  OAI22X1M U7 ( .A0(n1), .A1(n4), .B0(n17), .B1(n3), .Y(n14) );
  OAI22X1M U8 ( .A0(n1), .A1(n3), .B0(n17), .B1(n2), .Y(n15) );
  BUFX2M U9 ( .A(deser_en), .Y(n1) );
  OAI2BB2X1M U10 ( .B0(n8), .B1(n17), .A0N(P_DATA[7]), .A1N(n17), .Y(n9) );
  OAI2BB2X1M U11 ( .B0(n1), .B1(n2), .A0N(sampled_bit), .A1N(n1), .Y(n16) );
endmodule


module StartCheck ( clk, reset_n, sampled_bit, strt_chk_en, strt_glitch );
  input clk, reset_n, sampled_bit, strt_chk_en;
  output strt_glitch;
  wire   n1;

  DFFRX1M strt_glitch_reg ( .D(n1), .CK(clk), .RN(reset_n), .Q(strt_glitch) );
  AO2B2X2M U2 ( .B0(strt_chk_en), .B1(sampled_bit), .A0(strt_glitch), .A1N(
        strt_chk_en), .Y(n1) );
endmodule


module ParityCheck ( clk, reset_n, PAR_TYP, par_chk_en, sampled_bit, P_DATA, 
        par_err );
  input [7:0] P_DATA;
  input clk, reset_n, PAR_TYP, par_chk_en, sampled_bit;
  output par_err;
  wire   n1, n3, n4, n5, n6, n7, n8, n2;

  DFFRX2M par_err_reg ( .D(n8), .CK(clk), .RN(reset_n), .Q(par_err) );
  XOR3XLM U2 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n4) );
  XNOR2X2M U3 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  XOR3XLM U4 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n7), .Y(n3) );
  XNOR2X2M U5 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n7) );
  OAI2BB2X1M U6 ( .B0(n1), .B1(n2), .A0N(par_err), .A1N(n2), .Y(n8) );
  XOR3XLM U7 ( .A(n3), .B(n4), .C(n5), .Y(n1) );
  INVX2M U8 ( .A(par_chk_en), .Y(n2) );
  XNOR2X2M U9 ( .A(sampled_bit), .B(PAR_TYP), .Y(n5) );
endmodule


module StopCheck ( clk, reset_n, sampled_bit, stp_chk_en, stp_err );
  input clk, reset_n, sampled_bit, stp_chk_en;
  output stp_err;
  wire   n2, n1;

  DFFRX2M stp_err_reg ( .D(n2), .CK(clk), .RN(reset_n), .Q(stp_err) );
  OAI2BB2X1M U2 ( .B0(sampled_bit), .B1(n1), .A0N(stp_err), .A1N(n1), .Y(n2)
         );
  INVX2M U3 ( .A(stp_chk_en), .Y(n1) );
endmodule


module UART_RX_DATA_WIDTH8_scale_WIDTH6 ( clk, reset_n, RX_IN, prescaler, 
        PAR_EN, PAR_TYP, data_valid, P_DATA, Stop_Error, Parity_Error );
  input [5:0] prescaler;
  output [7:0] P_DATA;
  input clk, reset_n, RX_IN, PAR_EN, PAR_TYP;
  output data_valid, Stop_Error, Parity_Error;
  wire   strt_glitch_, enable_, deser_en_, dat_samp_en_, par_chk_en_,
         strt_chk_en_, stp_chk_en_, sampled_bit_, n1, n2;
  wire   [5:0] edge_cnt_;
  wire   [3:0] bit_cnt_;

  UART_RX_FSM_scale_WIDTH6 B0 ( .clk(clk), .reset_n(n1), .RX_IN(RX_IN), 
        .PAR_EN(PAR_EN), .par_err(Parity_Error), .strt_glitch(strt_glitch_), 
        .stp_err(Stop_Error), .edge_cnt(edge_cnt_), .prescaler(prescaler), 
        .bit_cnt(bit_cnt_), .data_valid(data_valid), .enable(enable_), 
        .deser_en(deser_en_), .dat_samp_en(dat_samp_en_), .par_chk_en(
        par_chk_en_), .strt_chk_en(strt_chk_en_), .stp_chk_en(stp_chk_en_) );
  edge_bit_counter_scale_WIDTH6 B1 ( .clk(clk), .reset_n(n1), .enable(enable_), 
        .prescaler(prescaler), .PAR_EN(PAR_EN), .bit_cnt(bit_cnt_), .edge_cnt(
        edge_cnt_) );
  data_sampling_scale_WIDTH6 B2 ( .clk(clk), .reset_n(n1), .RX_IN(RX_IN), 
        .edge_cnt(edge_cnt_), .prescaler(prescaler), .dat_samp_en(dat_samp_en_), .sampled_bit(sampled_bit_) );
  deserializer_DATA_WIDTH8 B3 ( .clk(clk), .reset_n(n1), .deser_en(deser_en_), 
        .sampled_bit(sampled_bit_), .P_DATA(P_DATA) );
  StartCheck B4 ( .clk(clk), .reset_n(n1), .sampled_bit(sampled_bit_), 
        .strt_chk_en(strt_chk_en_), .strt_glitch(strt_glitch_) );
  ParityCheck B5 ( .clk(clk), .reset_n(n1), .PAR_TYP(PAR_TYP), .par_chk_en(
        par_chk_en_), .sampled_bit(sampled_bit_), .P_DATA(P_DATA), .par_err(
        Parity_Error) );
  StopCheck B6 ( .clk(clk), .reset_n(n1), .sampled_bit(sampled_bit_), 
        .stp_chk_en(stp_chk_en_), .stp_err(Stop_Error) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(reset_n), .Y(n2) );
endmodule


module serializer_DATA_WIDTH8 ( clk, reset_n, ser_en, Data_Valid, busy, P_DATA, 
        ser_data, ser_done );
  input [7:0] P_DATA;
  input clk, reset_n, ser_en, Data_Valid, busy;
  output ser_data, ser_done;
  wire   N23, N24, N25, N27, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n1, n2, n3, n24, n25,
         n26, n27, n28, n29, n30, n31;
  wire   [7:1] Data;
  wire   [2:0] counter;
  assign ser_done = N27;

  DFFRQX2M \Data_reg[6]  ( .D(n18), .CK(clk), .RN(reset_n), .Q(Data[6]) );
  DFFRQX2M \counter_reg[1]  ( .D(N24), .CK(clk), .RN(reset_n), .Q(counter[1])
         );
  DFFRQX2M \counter_reg[2]  ( .D(N25), .CK(clk), .RN(reset_n), .Q(counter[2])
         );
  DFFRQX2M \counter_reg[0]  ( .D(N23), .CK(clk), .RN(reset_n), .Q(counter[0])
         );
  DFFRQX1M \Data_reg[7]  ( .D(n17), .CK(clk), .RN(reset_n), .Q(Data[7]) );
  DFFRQX1M \Data_reg[4]  ( .D(n20), .CK(clk), .RN(reset_n), .Q(Data[4]) );
  DFFRQX1M \Data_reg[3]  ( .D(n21), .CK(clk), .RN(reset_n), .Q(Data[3]) );
  DFFRQX1M \Data_reg[2]  ( .D(n22), .CK(clk), .RN(reset_n), .Q(Data[2]) );
  DFFRQX2M \Data_reg[1]  ( .D(n23), .CK(clk), .RN(reset_n), .Q(Data[1]) );
  DFFRQX2M \Data_reg[0]  ( .D(n16), .CK(clk), .RN(reset_n), .Q(ser_data) );
  DFFRHQX1M \Data_reg[5]  ( .D(n19), .CK(clk), .RN(reset_n), .Q(Data[5]) );
  AND2X2M U3 ( .A(P_DATA[3]), .B(n7), .Y(n26) );
  OAI2BB1X1M U4 ( .A0N(ser_data), .A1N(n4), .B0(n5), .Y(n16) );
  AND2X4M U5 ( .A(n2), .B(n1), .Y(n5) );
  NAND2X2M U6 ( .A(Data[1]), .B(n6), .Y(n1) );
  OAI2BB1X2M U7 ( .A0N(n4), .A1N(Data[3]), .B0(n11), .Y(n21) );
  NOR2X2M U8 ( .A(n25), .B(n26), .Y(n11) );
  AND2X2M U9 ( .A(P_DATA[7]), .B(n7), .Y(n28) );
  NOR2BX2M U10 ( .AN(Data_Valid), .B(busy), .Y(n7) );
  NAND2X2M U11 ( .A(P_DATA[0]), .B(n7), .Y(n2) );
  NAND2X2M U12 ( .A(P_DATA[1]), .B(n7), .Y(n24) );
  NAND2XLM U13 ( .A(Data[2]), .B(n6), .Y(n3) );
  AND2X2M U14 ( .A(n3), .B(n24), .Y(n13) );
  NOR2X1M U15 ( .A(n29), .B(n7), .Y(n6) );
  OAI2BB1X2M U16 ( .A0N(Data[1]), .A1N(n4), .B0(n13), .Y(n23) );
  AOI22XLM U17 ( .A0(Data[3]), .A1(n6), .B0(P_DATA[2]), .B1(n7), .Y(n12) );
  AND2X2M U18 ( .A(Data[4]), .B(n6), .Y(n25) );
  OAI2BB1XLM U19 ( .A0N(n4), .A1N(Data[2]), .B0(n12), .Y(n22) );
  OAI2BB1XLM U20 ( .A0N(n4), .A1N(Data[4]), .B0(n10), .Y(n20) );
  AOI22XLM U21 ( .A0(Data[5]), .A1(n6), .B0(P_DATA[4]), .B1(n7), .Y(n10) );
  OAI2BB1XLM U22 ( .A0N(n4), .A1N(Data[5]), .B0(n9), .Y(n19) );
  AOI22XLM U23 ( .A0(Data[6]), .A1(n6), .B0(P_DATA[5]), .B1(n7), .Y(n9) );
  AND2X2M U24 ( .A(n4), .B(Data[7]), .Y(n27) );
  OR2X2M U25 ( .A(n27), .B(n28), .Y(n17) );
  NOR2XLM U26 ( .A(n7), .B(n6), .Y(n4) );
  INVX2M U27 ( .A(ser_en), .Y(n29) );
  OAI2BB1X2M U28 ( .A0N(n4), .A1N(Data[6]), .B0(n8), .Y(n18) );
  AOI22X1M U29 ( .A0(Data[7]), .A1(n6), .B0(P_DATA[6]), .B1(n7), .Y(n8) );
  OAI2BB2X1M U30 ( .B0(n14), .B1(n29), .A0N(counter[2]), .A1N(N23), .Y(N25) );
  AOI32X1M U31 ( .A0(counter[0]), .A1(n31), .A2(counter[1]), .B0(counter[2]), 
        .B1(n30), .Y(n14) );
  INVX2M U32 ( .A(counter[2]), .Y(n31) );
  NOR2X2M U33 ( .A(n29), .B(counter[0]), .Y(N23) );
  AND3X2M U34 ( .A(counter[0]), .B(counter[2]), .C(counter[1]), .Y(N27) );
  NOR2X2M U35 ( .A(n15), .B(n29), .Y(N24) );
  CLKXOR2X2M U36 ( .A(counter[0]), .B(n30), .Y(n15) );
  INVX2M U37 ( .A(counter[1]), .Y(n30) );
endmodule


module UART_FSM ( clk, reset_n, PAR_EN, ser_done, Data_Valid, ser_en, mux_sel, 
        busy );
  output [1:0] mux_sel;
  input clk, reset_n, PAR_EN, ser_done, Data_Valid;
  output ser_en, busy;
  wire   n5, n6, n7, n8, n9, n2, n4;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(reset_n), 
        .Q(current_state[0]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(clk), .RN(reset_n), 
        .Q(current_state[2]) );
  DFFRX1M \current_state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(reset_n), 
        .Q(current_state[1]), .QN(n4) );
  INVX2M U3 ( .A(n5), .Y(ser_en) );
  NAND2X2M U4 ( .A(mux_sel[1]), .B(n7), .Y(n5) );
  INVX2M U5 ( .A(n9), .Y(mux_sel[0]) );
  NOR2BX2M U6 ( .AN(mux_sel[1]), .B(n6), .Y(next_state[2]) );
  AOI2B1X1M U7 ( .A1N(PAR_EN), .A0(ser_done), .B0(n2), .Y(n6) );
  XNOR2X2M U8 ( .A(current_state[0]), .B(current_state[1]), .Y(n7) );
  OAI21X2M U9 ( .A0(current_state[0]), .A1(n4), .B0(mux_sel[0]), .Y(busy) );
  NOR2X2M U10 ( .A(n4), .B(current_state[2]), .Y(mux_sel[1]) );
  NOR2X2M U11 ( .A(n2), .B(current_state[2]), .Y(n9) );
  INVX2M U12 ( .A(current_state[0]), .Y(n2) );
  OAI22X1M U13 ( .A0(ser_done), .A1(mux_sel[0]), .B0(current_state[1]), .B1(n8), .Y(next_state[0]) );
  AOI2B1X1M U14 ( .A1N(current_state[2]), .A0(Data_Valid), .B0(n9), .Y(n8) );
  OAI21X2M U15 ( .A0(current_state[2]), .A1(n7), .B0(n5), .Y(next_state[1]) );
endmodule


module parity_calc_DATA_WIDTH8 ( clk, reset_n, Data_Valid, PAR_TYP, PAR_EN, 
        P_DATA, parity_bit );
  input [7:0] P_DATA;
  input clk, reset_n, Data_Valid, PAR_TYP, PAR_EN;
  output parity_bit;
  wire   n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n1, n2, n16
;
  wire   [7:0] DATA;

  DFFRQX2M \DATA_reg[1]  ( .D(n9), .CK(clk), .RN(reset_n), .Q(DATA[1]) );
  DFFRQX2M \DATA_reg[2]  ( .D(n10), .CK(clk), .RN(reset_n), .Q(DATA[2]) );
  DFFRQX2M parity_bit_reg ( .D(n7), .CK(clk), .RN(reset_n), .Q(parity_bit) );
  DFFRQX2M \DATA_reg[5]  ( .D(n13), .CK(clk), .RN(reset_n), .Q(DATA[5]) );
  DFFRQX2M \DATA_reg[4]  ( .D(n12), .CK(clk), .RN(reset_n), .Q(DATA[4]) );
  DFFRQX2M \DATA_reg[6]  ( .D(n14), .CK(clk), .RN(reset_n), .Q(DATA[6]) );
  DFFRQX2M \DATA_reg[7]  ( .D(n15), .CK(clk), .RN(reset_n), .Q(DATA[7]) );
  DFFRQX1M \DATA_reg[0]  ( .D(n8), .CK(clk), .RN(reset_n), .Q(DATA[0]) );
  DFFRQX1M \DATA_reg[3]  ( .D(n11), .CK(clk), .RN(reset_n), .Q(DATA[3]) );
  AO22X2M U2 ( .A0(n2), .A1(PAR_EN), .B0(parity_bit), .B1(n16), .Y(n7) );
  AO2B2X2M U3 ( .B0(DATA[7]), .B1(n1), .A0(P_DATA[7]), .A1N(n1), .Y(n15) );
  INVX2M U4 ( .A(Data_Valid), .Y(n1) );
  AO2B2XLM U5 ( .B0(DATA[3]), .B1(n1), .A0(P_DATA[3]), .A1N(n1), .Y(n11) );
  AO2B2XLM U6 ( .B0(DATA[5]), .B1(n1), .A0(P_DATA[5]), .A1N(n1), .Y(n13) );
  AO2B2X2M U7 ( .B0(DATA[0]), .B1(n1), .A0(P_DATA[0]), .A1N(n1), .Y(n8) );
  AO2B2X4M U8 ( .B0(P_DATA[6]), .B1(Data_Valid), .A0(DATA[6]), .A1N(Data_Valid), .Y(n14) );
  AO2B2X2M U9 ( .B0(P_DATA[1]), .B1(Data_Valid), .A0(DATA[1]), .A1N(Data_Valid), .Y(n9) );
  AO2B2X2M U10 ( .B0(P_DATA[2]), .B1(Data_Valid), .A0(DATA[2]), .A1N(
        Data_Valid), .Y(n10) );
  XNOR3X2M U11 ( .A(n3), .B(PAR_TYP), .C(n4), .Y(n2) );
  INVX2M U12 ( .A(PAR_EN), .Y(n16) );
  XOR3XLM U13 ( .A(DATA[1]), .B(DATA[0]), .C(n5), .Y(n4) );
  AO2B2X2M U14 ( .B0(P_DATA[4]), .B1(Data_Valid), .A0(DATA[4]), .A1N(
        Data_Valid), .Y(n12) );
  XOR3XLM U15 ( .A(DATA[5]), .B(DATA[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U16 ( .A(DATA[7]), .B(DATA[6]), .Y(n6) );
  XNOR2X2M U17 ( .A(DATA[2]), .B(DATA[3]), .Y(n5) );
endmodule


module MUXX ( clk, reset_n, parity_bit, ser_data, mux_sel, TX_OUT );
  input [1:0] mux_sel;
  input clk, reset_n, parity_bit, ser_data;
  output TX_OUT;
  wire   out, n2, n3, n1;

  DFFSQX2M TX_OUT_reg ( .D(out), .CK(clk), .SN(reset_n), .Q(TX_OUT) );
  OAI21X2M U3 ( .A0(n2), .A1(n1), .B0(n3), .Y(out) );
  NAND3X2M U4 ( .A(mux_sel[1]), .B(n1), .C(ser_data), .Y(n3) );
  NOR2BX2M U5 ( .AN(mux_sel[1]), .B(parity_bit), .Y(n2) );
  INVX2M U6 ( .A(mux_sel[0]), .Y(n1) );
endmodule


module UART_TX_DATA_WIDTH8 ( clk, reset_n, Data_Valid, PAR_EN, PAR_TYP, P_DATA, 
        busy, TX_OUT );
  input [7:0] P_DATA;
  input clk, reset_n, Data_Valid, PAR_EN, PAR_TYP;
  output busy, TX_OUT;
  wire   ser_en, ser_data, ser_done, parity_bit, n1, n2;
  wire   [1:0] mux_sel;

  serializer_DATA_WIDTH8 B0 ( .clk(clk), .reset_n(n1), .ser_en(ser_en), 
        .Data_Valid(Data_Valid), .busy(busy), .P_DATA(P_DATA), .ser_data(
        ser_data), .ser_done(ser_done) );
  UART_FSM B1 ( .clk(clk), .reset_n(n1), .PAR_EN(PAR_EN), .ser_done(ser_done), 
        .Data_Valid(Data_Valid), .ser_en(ser_en), .mux_sel(mux_sel), .busy(
        busy) );
  parity_calc_DATA_WIDTH8 B2 ( .clk(clk), .reset_n(n1), .Data_Valid(Data_Valid), .PAR_TYP(PAR_TYP), .PAR_EN(PAR_EN), .P_DATA(P_DATA), .parity_bit(parity_bit)
         );
  MUXX B4 ( .clk(clk), .reset_n(n1), .parity_bit(parity_bit), .ser_data(
        ser_data), .mux_sel(mux_sel), .TX_OUT(TX_OUT) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(reset_n), .Y(n2) );
endmodule


module UART_TOP ( TX_CLK, RX_CLK, SYNC_RST, F_EMPTY, RX_IN, UART_CONFIG, 
        RD_DATA, BUSY, VALID, TX_OUT, P_DATA, Stop_Error, Parity_Error );
  input [7:0] UART_CONFIG;
  input [7:0] RD_DATA;
  output [7:0] P_DATA;
  input TX_CLK, RX_CLK, SYNC_RST, F_EMPTY, RX_IN;
  output BUSY, VALID, TX_OUT, Stop_Error, Parity_Error;


  UART_RX_DATA_WIDTH8_scale_WIDTH6 B0 ( .clk(RX_CLK), .reset_n(SYNC_RST), 
        .RX_IN(RX_IN), .prescaler(UART_CONFIG[7:2]), .PAR_EN(UART_CONFIG[0]), 
        .PAR_TYP(UART_CONFIG[1]), .data_valid(VALID), .P_DATA(P_DATA), 
        .Stop_Error(Stop_Error), .Parity_Error(Parity_Error) );
  UART_TX_DATA_WIDTH8 B1 ( .clk(TX_CLK), .reset_n(SYNC_RST), .Data_Valid(
        F_EMPTY), .PAR_EN(UART_CONFIG[0]), .PAR_TYP(UART_CONFIG[1]), .P_DATA(
        RD_DATA), .busy(BUSY), .TX_OUT(TX_OUT) );
endmodule


module DATA_SYNC ( clk, reset_n, bus_enable, unsync_bus, enable_pulse, 
        sync_bus );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input clk, reset_n, bus_enable;
  output enable_pulse;
  wire   p_gen, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [1:0] sync;

  DFFRQX2M p_gen_reg ( .D(sync[1]), .CK(clk), .RN(reset_n), .Q(p_gen) );
  DFFRQX2M \sync_reg[1]  ( .D(sync[0]), .CK(clk), .RN(reset_n), .Q(sync[1]) );
  DFFRQX2M \sync_bus_reg[7]  ( .D(n9), .CK(clk), .RN(reset_n), .Q(sync_bus[7])
         );
  DFFRQX2M \sync_bus_reg[6]  ( .D(n8), .CK(clk), .RN(reset_n), .Q(sync_bus[6])
         );
  DFFRQX2M \sync_bus_reg[5]  ( .D(n7), .CK(clk), .RN(reset_n), .Q(sync_bus[5])
         );
  DFFRQX2M \sync_bus_reg[4]  ( .D(n6), .CK(clk), .RN(reset_n), .Q(sync_bus[4])
         );
  DFFRQX2M \sync_bus_reg[3]  ( .D(n5), .CK(clk), .RN(reset_n), .Q(sync_bus[3])
         );
  DFFRQX2M \sync_bus_reg[1]  ( .D(n3), .CK(clk), .RN(reset_n), .Q(sync_bus[1])
         );
  DFFRQX2M \sync_bus_reg[2]  ( .D(n4), .CK(clk), .RN(reset_n), .Q(sync_bus[2])
         );
  DFFRQX2M \sync_bus_reg[0]  ( .D(n2), .CK(clk), .RN(reset_n), .Q(sync_bus[0])
         );
  DFFRQX2M enable_pulse_reg ( .D(n10), .CK(clk), .RN(reset_n), .Q(enable_pulse) );
  DFFRQX2M \sync_reg[0]  ( .D(bus_enable), .CK(clk), .RN(reset_n), .Q(sync[0])
         );
  INVX2M U3 ( .A(n1), .Y(n10) );
  NAND2BX2M U4 ( .AN(p_gen), .B(sync[1]), .Y(n1) );
  AO22X1M U5 ( .A0(unsync_bus[0]), .A1(n10), .B0(sync_bus[0]), .B1(n1), .Y(n2)
         );
  AO22X1M U6 ( .A0(unsync_bus[1]), .A1(n10), .B0(sync_bus[1]), .B1(n1), .Y(n3)
         );
  AO22X1M U7 ( .A0(unsync_bus[2]), .A1(n10), .B0(sync_bus[2]), .B1(n1), .Y(n4)
         );
  AO22X1M U8 ( .A0(unsync_bus[3]), .A1(n10), .B0(sync_bus[3]), .B1(n1), .Y(n5)
         );
  AO22X1M U9 ( .A0(unsync_bus[4]), .A1(n10), .B0(sync_bus[4]), .B1(n1), .Y(n6)
         );
  AO22X1M U10 ( .A0(unsync_bus[5]), .A1(n10), .B0(sync_bus[5]), .B1(n1), .Y(n7) );
  AO22X1M U11 ( .A0(unsync_bus[6]), .A1(n10), .B0(sync_bus[6]), .B1(n1), .Y(n8) );
  AO22X1M U12 ( .A0(unsync_bus[7]), .A1(n10), .B0(sync_bus[7]), .B1(n1), .Y(n9) );
endmodule


module RST_SYNC_0 ( clk, reset_n, SYNC_RST );
  input clk, reset_n;
  output SYNC_RST;

  wire   [1:0] sync;

  DFFRQX2M SYNC_RST_reg ( .D(sync[1]), .CK(clk), .RN(reset_n), .Q(SYNC_RST) );
  DFFRQX2M \sync_reg[1]  ( .D(sync[0]), .CK(clk), .RN(reset_n), .Q(sync[1]) );
  DFFRQX2M \sync_reg[0]  ( .D(1'b1), .CK(clk), .RN(reset_n), .Q(sync[0]) );
endmodule


module RST_SYNC_1 ( clk, reset_n, SYNC_RST );
  input clk, reset_n;
  output SYNC_RST;

  wire   [1:0] sync;

  DFFRQX2M SYNC_RST_reg ( .D(sync[1]), .CK(clk), .RN(reset_n), .Q(SYNC_RST) );
  DFFRQX2M \sync_reg[1]  ( .D(sync[0]), .CK(clk), .RN(reset_n), .Q(sync[1]) );
  DFFRQX2M \sync_reg[0]  ( .D(1'b1), .CK(clk), .RN(reset_n), .Q(sync[0]) );
endmodule


module PULSE_GEN ( clk, reset_n, D, Pulse );
  input clk, reset_n, D;
  output Pulse;
  wire   Q, N1;

  DFFRQX2M Q_reg ( .D(D), .CK(clk), .RN(reset_n), .Q(Q) );
  DFFRQX2M Pulse_reg ( .D(N1), .CK(clk), .RN(reset_n), .Q(Pulse) );
  NOR2BX2M U3 ( .AN(D), .B(Q), .Y(N1) );
endmodule


module rempty_depth8_n3 ( rclk, rrst_n, rinc, rq2_wptr, raddr, rptr, rempty );
  input [3:0] rq2_wptr;
  output [3:0] raddr;
  output [3:0] rptr;
  input rclk, rrst_n, rinc;
  output rempty;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
  wire   [3:0] sync1;
  wire   [3:0] sync0;
  assign rptr[3] = raddr[3];

  DFFRQX2M \sync1_reg[3]  ( .D(sync0[3]), .CK(rclk), .RN(rrst_n), .Q(sync1[3])
         );
  DFFRQX2M \sync1_reg[2]  ( .D(sync0[2]), .CK(rclk), .RN(rrst_n), .Q(sync1[2])
         );
  DFFRQX2M \sync1_reg[1]  ( .D(sync0[1]), .CK(rclk), .RN(rrst_n), .Q(sync1[1])
         );
  DFFRQX2M \sync1_reg[0]  ( .D(sync0[0]), .CK(rclk), .RN(rrst_n), .Q(sync1[0])
         );
  DFFRX1M \raddr_reg[0]  ( .D(n15), .CK(rclk), .RN(rrst_n), .Q(raddr[0]), .QN(
        n2) );
  DFFRQX2M \raddr_reg[3]  ( .D(n12), .CK(rclk), .RN(rrst_n), .Q(raddr[3]) );
  DFFRQX2M \sync0_reg[2]  ( .D(rq2_wptr[2]), .CK(rclk), .RN(rrst_n), .Q(
        sync0[2]) );
  DFFRQX2M \sync0_reg[1]  ( .D(rq2_wptr[1]), .CK(rclk), .RN(rrst_n), .Q(
        sync0[1]) );
  DFFRQX2M \sync0_reg[0]  ( .D(rq2_wptr[0]), .CK(rclk), .RN(rrst_n), .Q(
        sync0[0]) );
  DFFRQX2M \sync0_reg[3]  ( .D(rq2_wptr[3]), .CK(rclk), .RN(rrst_n), .Q(
        sync0[3]) );
  DFFRQX2M \raddr_reg[2]  ( .D(n13), .CK(rclk), .RN(rrst_n), .Q(raddr[2]) );
  DFFRQX2M \raddr_reg[1]  ( .D(n14), .CK(rclk), .RN(rrst_n), .Q(raddr[1]) );
  INVX2M U3 ( .A(n3), .Y(rempty) );
  XNOR2X2M U4 ( .A(rptr[1]), .B(sync1[1]), .Y(n8) );
  XNOR2X2M U5 ( .A(n2), .B(raddr[1]), .Y(rptr[0]) );
  NOR2X2M U6 ( .A(n7), .B(n2), .Y(n6) );
  XNOR2X2M U7 ( .A(raddr[2]), .B(n5), .Y(n13) );
  XNOR2X2M U8 ( .A(raddr[3]), .B(n4), .Y(n12) );
  NAND2BX2M U9 ( .AN(n5), .B(raddr[2]), .Y(n4) );
  NAND4X2M U10 ( .A(n8), .B(n9), .C(n10), .D(n11), .Y(n3) );
  XNOR2X2M U11 ( .A(raddr[3]), .B(sync1[3]), .Y(n10) );
  XNOR2X2M U12 ( .A(rptr[2]), .B(sync1[2]), .Y(n11) );
  XNOR2X2M U13 ( .A(rptr[0]), .B(sync1[0]), .Y(n9) );
  NAND2X2M U14 ( .A(n6), .B(raddr[1]), .Y(n5) );
  NAND2X2M U15 ( .A(rinc), .B(n3), .Y(n7) );
  CLKXOR2X2M U16 ( .A(raddr[1]), .B(raddr[2]), .Y(rptr[1]) );
  CLKXOR2X2M U17 ( .A(raddr[3]), .B(raddr[2]), .Y(rptr[2]) );
  CLKXOR2X2M U18 ( .A(raddr[1]), .B(n6), .Y(n14) );
  CLKXOR2X2M U19 ( .A(n2), .B(n7), .Y(n15) );
endmodule


module wfull_depth8_n3 ( wclk, wrst_n, winc, wq2_rptr, waddr, wptr, wfull );
  input [3:0] wq2_rptr;
  output [3:0] waddr;
  output [3:0] wptr;
  input wclk, wrst_n, winc;
  output wfull;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
  wire   [3:0] sync1;
  wire   [3:0] sync0;
  assign wptr[3] = waddr[3];

  DFFRQX2M \sync1_reg[1]  ( .D(sync0[1]), .CK(wclk), .RN(wrst_n), .Q(sync1[1])
         );
  DFFRQX2M \sync1_reg[0]  ( .D(sync0[0]), .CK(wclk), .RN(wrst_n), .Q(sync1[0])
         );
  DFFRQX2M \sync1_reg[3]  ( .D(sync0[3]), .CK(wclk), .RN(wrst_n), .Q(sync1[3])
         );
  DFFRQX2M \sync1_reg[2]  ( .D(sync0[2]), .CK(wclk), .RN(wrst_n), .Q(sync1[2])
         );
  DFFRQX2M \waddr_reg[3]  ( .D(n12), .CK(wclk), .RN(wrst_n), .Q(waddr[3]) );
  DFFRQX2M \waddr_reg[2]  ( .D(n13), .CK(wclk), .RN(wrst_n), .Q(waddr[2]) );
  DFFRQX2M \sync0_reg[2]  ( .D(wq2_rptr[2]), .CK(wclk), .RN(wrst_n), .Q(
        sync0[2]) );
  DFFRQX2M \sync0_reg[1]  ( .D(wq2_rptr[1]), .CK(wclk), .RN(wrst_n), .Q(
        sync0[1]) );
  DFFRQX2M \sync0_reg[0]  ( .D(wq2_rptr[0]), .CK(wclk), .RN(wrst_n), .Q(
        sync0[0]) );
  DFFRX1M \waddr_reg[0]  ( .D(n15), .CK(wclk), .RN(wrst_n), .Q(waddr[0]), .QN(
        n2) );
  DFFRQX2M \waddr_reg[1]  ( .D(n14), .CK(wclk), .RN(wrst_n), .Q(waddr[1]) );
  DFFRQX2M \sync0_reg[3]  ( .D(wq2_rptr[3]), .CK(wclk), .RN(wrst_n), .Q(
        sync0[3]) );
  NAND2X2M U3 ( .A(winc), .B(n3), .Y(n7) );
  INVX2M U4 ( .A(n3), .Y(wfull) );
  XNOR2X2M U5 ( .A(wptr[1]), .B(sync1[1]), .Y(n8) );
  XNOR2X2M U6 ( .A(n2), .B(waddr[1]), .Y(wptr[0]) );
  NOR2X2M U7 ( .A(n7), .B(n2), .Y(n6) );
  XNOR2X2M U8 ( .A(waddr[2]), .B(n5), .Y(n13) );
  XNOR2X2M U9 ( .A(waddr[3]), .B(n4), .Y(n12) );
  NAND2BX2M U10 ( .AN(n5), .B(waddr[2]), .Y(n4) );
  NAND4X2M U11 ( .A(n8), .B(n9), .C(n10), .D(n11), .Y(n3) );
  CLKXOR2X2M U12 ( .A(waddr[3]), .B(sync1[3]), .Y(n11) );
  XNOR2X2M U13 ( .A(wptr[0]), .B(sync1[0]), .Y(n9) );
  CLKXOR2X2M U14 ( .A(sync1[2]), .B(wptr[2]), .Y(n10) );
  NAND2X2M U15 ( .A(n6), .B(waddr[1]), .Y(n5) );
  CLKXOR2X2M U16 ( .A(waddr[3]), .B(waddr[2]), .Y(wptr[2]) );
  CLKXOR2X2M U17 ( .A(waddr[1]), .B(waddr[2]), .Y(wptr[1]) );
  CLKXOR2X2M U18 ( .A(waddr[1]), .B(n6), .Y(n14) );
  CLKXOR2X2M U19 ( .A(n2), .B(n7), .Y(n15) );
endmodule


module fifo_async_width8_depth8_n3 ( wclk, waddr, raddr, winc, wfull, wdata, 
        rdata );
  input [3:0] waddr;
  input [3:0] raddr;
  input [7:0] wdata;
  output [7:0] rdata;
  input wclk, winc, wfull;
  wire   N9, N10, N11, \mem[7][7] , \mem[7][6] , \mem[7][5] , \mem[7][4] ,
         \mem[7][3] , \mem[7][2] , \mem[7][1] , \mem[7][0] , \mem[6][7] ,
         \mem[6][6] , \mem[6][5] , \mem[6][4] , \mem[6][3] , \mem[6][2] ,
         \mem[6][1] , \mem[6][0] , \mem[5][7] , \mem[5][6] , \mem[5][5] ,
         \mem[5][4] , \mem[5][3] , \mem[5][2] , \mem[5][1] , \mem[5][0] ,
         \mem[4][7] , \mem[4][6] , \mem[4][5] , \mem[4][4] , \mem[4][3] ,
         \mem[4][2] , \mem[4][1] , \mem[4][0] , \mem[3][7] , \mem[3][6] ,
         \mem[3][5] , \mem[3][4] , \mem[3][3] , \mem[3][2] , \mem[3][1] ,
         \mem[3][0] , \mem[2][7] , \mem[2][6] , \mem[2][5] , \mem[2][4] ,
         \mem[2][3] , \mem[2][2] , \mem[2][1] , \mem[2][0] , \mem[1][7] ,
         \mem[1][6] , \mem[1][5] , \mem[1][4] , \mem[1][3] , \mem[1][2] ,
         \mem[1][1] , \mem[1][0] , \mem[0][7] , \mem[0][6] , \mem[0][5] ,
         \mem[0][4] , \mem[0][3] , \mem[0][2] , \mem[0][1] , \mem[0][0] , n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125;
  assign N9 = raddr[0];
  assign N10 = raddr[1];
  assign N11 = raddr[2];

  DFFQX2M \mem_reg[4][7]  ( .D(n61), .CK(wclk), .Q(\mem[4][7] ) );
  DFFQX2M \mem_reg[6][2]  ( .D(n72), .CK(wclk), .Q(\mem[6][2] ) );
  DFFQX2M \mem_reg[6][0]  ( .D(n70), .CK(wclk), .Q(\mem[6][0] ) );
  DFFQX2M \mem_reg[2][2]  ( .D(n40), .CK(wclk), .Q(\mem[2][2] ) );
  DFFQX2M \mem_reg[2][1]  ( .D(n39), .CK(wclk), .Q(\mem[2][1] ) );
  DFFQX2M \mem_reg[2][0]  ( .D(n38), .CK(wclk), .Q(\mem[2][0] ) );
  DFFQX2M \mem_reg[5][6]  ( .D(n68), .CK(wclk), .Q(\mem[5][6] ) );
  DFFQX2M \mem_reg[5][2]  ( .D(n64), .CK(wclk), .Q(\mem[5][2] ) );
  DFFQX2M \mem_reg[5][0]  ( .D(n62), .CK(wclk), .Q(\mem[5][0] ) );
  DFFQX2M \mem_reg[1][2]  ( .D(n32), .CK(wclk), .Q(\mem[1][2] ) );
  DFFQX2M \mem_reg[1][1]  ( .D(n31), .CK(wclk), .Q(\mem[1][1] ) );
  DFFQX2M \mem_reg[1][0]  ( .D(n30), .CK(wclk), .Q(\mem[1][0] ) );
  DFFQX2M \mem_reg[7][2]  ( .D(n80), .CK(wclk), .Q(\mem[7][2] ) );
  DFFQX2M \mem_reg[3][2]  ( .D(n48), .CK(wclk), .Q(\mem[3][2] ) );
  DFFQX2M \mem_reg[3][0]  ( .D(n46), .CK(wclk), .Q(\mem[3][0] ) );
  DFFQX2M \mem_reg[4][6]  ( .D(n60), .CK(wclk), .Q(\mem[4][6] ) );
  DFFQX2M \mem_reg[4][2]  ( .D(n56), .CK(wclk), .Q(\mem[4][2] ) );
  DFFQX2M \mem_reg[4][1]  ( .D(n55), .CK(wclk), .Q(\mem[4][1] ) );
  DFFQX2M \mem_reg[4][0]  ( .D(n54), .CK(wclk), .Q(\mem[4][0] ) );
  DFFQX2M \mem_reg[0][6]  ( .D(n28), .CK(wclk), .Q(\mem[0][6] ) );
  DFFQX2M \mem_reg[0][5]  ( .D(n27), .CK(wclk), .Q(\mem[0][5] ) );
  DFFQX2M \mem_reg[0][4]  ( .D(n26), .CK(wclk), .Q(\mem[0][4] ) );
  DFFQX2M \mem_reg[0][3]  ( .D(n25), .CK(wclk), .Q(\mem[0][3] ) );
  DFFQX2M \mem_reg[0][2]  ( .D(n24), .CK(wclk), .Q(\mem[0][2] ) );
  DFFQX2M \mem_reg[0][1]  ( .D(n23), .CK(wclk), .Q(\mem[0][1] ) );
  DFFQX2M \mem_reg[0][0]  ( .D(n22), .CK(wclk), .Q(\mem[0][0] ) );
  DFFHQX2M \mem_reg[7][7]  ( .D(n85), .CK(wclk), .Q(\mem[7][7] ) );
  DFFQX2M \mem_reg[6][4]  ( .D(n74), .CK(wclk), .Q(\mem[6][4] ) );
  DFFQX2M \mem_reg[2][6]  ( .D(n44), .CK(wclk), .Q(\mem[2][6] ) );
  DFFQX2M \mem_reg[2][4]  ( .D(n42), .CK(wclk), .Q(\mem[2][4] ) );
  DFFQX2M \mem_reg[5][4]  ( .D(n66), .CK(wclk), .Q(\mem[5][4] ) );
  DFFQX2M \mem_reg[1][6]  ( .D(n36), .CK(wclk), .Q(\mem[1][6] ) );
  DFFQX2M \mem_reg[1][4]  ( .D(n34), .CK(wclk), .Q(\mem[1][4] ) );
  DFFQX2M \mem_reg[7][4]  ( .D(n82), .CK(wclk), .Q(\mem[7][4] ) );
  DFFQX2M \mem_reg[3][6]  ( .D(n52), .CK(wclk), .Q(\mem[3][6] ) );
  DFFQX2M \mem_reg[3][4]  ( .D(n50), .CK(wclk), .Q(\mem[3][4] ) );
  DFFQX2M \mem_reg[4][4]  ( .D(n58), .CK(wclk), .Q(\mem[4][4] ) );
  DFFQX2M \mem_reg[4][3]  ( .D(n57), .CK(wclk), .Q(\mem[4][3] ) );
  DFFQX2M \mem_reg[7][6]  ( .D(n84), .CK(wclk), .Q(\mem[7][6] ) );
  DFFQX2M \mem_reg[6][6]  ( .D(n76), .CK(wclk), .Q(\mem[6][6] ) );
  DFFQX2M \mem_reg[2][5]  ( .D(n43), .CK(wclk), .Q(\mem[2][5] ) );
  DFFQX2M \mem_reg[2][3]  ( .D(n41), .CK(wclk), .Q(\mem[2][3] ) );
  DFFQX2M \mem_reg[1][5]  ( .D(n35), .CK(wclk), .Q(\mem[1][5] ) );
  DFFQX2M \mem_reg[1][3]  ( .D(n33), .CK(wclk), .Q(\mem[1][3] ) );
  DFFQX2M \mem_reg[3][7]  ( .D(n53), .CK(wclk), .Q(\mem[3][7] ) );
  DFFQX2M \mem_reg[2][7]  ( .D(n45), .CK(wclk), .Q(\mem[2][7] ) );
  DFFQX2M \mem_reg[1][7]  ( .D(n37), .CK(wclk), .Q(\mem[1][7] ) );
  DFFQX2M \mem_reg[0][7]  ( .D(n29), .CK(wclk), .Q(\mem[0][7] ) );
  DFFQX2M \mem_reg[3][5]  ( .D(n51), .CK(wclk), .Q(\mem[3][5] ) );
  DFFQX2M \mem_reg[3][3]  ( .D(n49), .CK(wclk), .Q(\mem[3][3] ) );
  DFFQX2M \mem_reg[4][5]  ( .D(n59), .CK(wclk), .Q(\mem[4][5] ) );
  DFFQX2M \mem_reg[5][3]  ( .D(n65), .CK(wclk), .Q(\mem[5][3] ) );
  DFFQX2M \mem_reg[7][0]  ( .D(n78), .CK(wclk), .Q(\mem[7][0] ) );
  DFFQX2M \mem_reg[5][5]  ( .D(n67), .CK(wclk), .Q(\mem[5][5] ) );
  DFFQX2M \mem_reg[7][5]  ( .D(n83), .CK(wclk), .Q(\mem[7][5] ) );
  DFFQX2M \mem_reg[6][5]  ( .D(n75), .CK(wclk), .Q(\mem[6][5] ) );
  DFFQX2M \mem_reg[6][3]  ( .D(n73), .CK(wclk), .Q(\mem[6][3] ) );
  DFFQX2M \mem_reg[7][3]  ( .D(n81), .CK(wclk), .Q(\mem[7][3] ) );
  DFFQX4M \mem_reg[7][1]  ( .D(n79), .CK(wclk), .Q(\mem[7][1] ) );
  DFFQX2M \mem_reg[6][1]  ( .D(n71), .CK(wclk), .Q(\mem[6][1] ) );
  DFFQX2M \mem_reg[5][1]  ( .D(n63), .CK(wclk), .Q(\mem[5][1] ) );
  DFFQX2M \mem_reg[3][1]  ( .D(n47), .CK(wclk), .Q(\mem[3][1] ) );
  DFFQX4M \mem_reg[6][7]  ( .D(n77), .CK(wclk), .Q(\mem[6][7] ) );
  DFFQX4M \mem_reg[5][7]  ( .D(n69), .CK(wclk), .Q(\mem[5][7] ) );
  NAND2X4M U2 ( .A(n95), .B(N11), .Y(n86) );
  MX4X4M U3 ( .A(\mem[4][1] ), .B(\mem[6][1] ), .C(\mem[5][1] ), .D(
        \mem[7][1] ), .S0(N10), .S1(n109), .Y(n95) );
  NAND2X2M U4 ( .A(n107), .B(N11), .Y(n9) );
  CLKNAND2X2M U5 ( .A(n102), .B(n7), .Y(n89) );
  NAND2X2M U6 ( .A(n96), .B(n7), .Y(n10) );
  MX4X4M U7 ( .A(\mem[0][1] ), .B(\mem[1][1] ), .C(\mem[2][1] ), .D(
        \mem[3][1] ), .S0(n109), .S1(N10), .Y(n96) );
  MX2X3M U8 ( .A(n3), .B(n4), .S0(N10), .Y(n103) );
  MX2X3M U9 ( .A(\mem[4][5] ), .B(\mem[5][5] ), .S0(n109), .Y(n3) );
  MX2X3M U10 ( .A(n100), .B(n99), .S0(N11), .Y(rdata[3]) );
  MX4X2M U11 ( .A(\mem[4][3] ), .B(\mem[5][3] ), .C(\mem[6][3] ), .D(
        \mem[7][3] ), .S0(n109), .S1(N10), .Y(n99) );
  CLKMX2X2M U12 ( .A(n94), .B(n93), .S0(N11), .Y(rdata[0]) );
  NAND2X2M U13 ( .A(n106), .B(n7), .Y(n1) );
  NAND2X2M U14 ( .A(n105), .B(N11), .Y(n2) );
  NAND2X2M U15 ( .A(n1), .B(n2), .Y(rdata[6]) );
  MX4X1M U16 ( .A(\mem[4][0] ), .B(\mem[5][0] ), .C(\mem[6][0] ), .D(
        \mem[7][0] ), .S0(n109), .S1(N10), .Y(n93) );
  CLKNAND2X2M U17 ( .A(n8), .B(n9), .Y(rdata[7]) );
  MX4X1M U18 ( .A(\mem[0][7] ), .B(\mem[1][7] ), .C(\mem[2][7] ), .D(
        \mem[3][7] ), .S0(n109), .S1(N10), .Y(n108) );
  CLKNAND2X2M U19 ( .A(n108), .B(n7), .Y(n8) );
  MX2X3M U20 ( .A(\mem[6][5] ), .B(\mem[7][5] ), .S0(n109), .Y(n4) );
  NAND2X1M U21 ( .A(n103), .B(N11), .Y(n6) );
  NAND2X2M U22 ( .A(n104), .B(n7), .Y(n5) );
  NAND2X2M U23 ( .A(n5), .B(n6), .Y(rdata[5]) );
  MX4X1M U24 ( .A(\mem[0][5] ), .B(\mem[1][5] ), .C(\mem[2][5] ), .D(
        \mem[3][5] ), .S0(n109), .S1(N10), .Y(n104) );
  INVXLM U25 ( .A(N11), .Y(n7) );
  NAND2X2M U26 ( .A(n10), .B(n86), .Y(rdata[1]) );
  MX4X1M U27 ( .A(\mem[0][6] ), .B(\mem[1][6] ), .C(\mem[2][6] ), .D(
        \mem[3][6] ), .S0(n109), .S1(N10), .Y(n106) );
  MX4X1M U28 ( .A(\mem[4][6] ), .B(\mem[5][6] ), .C(\mem[6][6] ), .D(
        \mem[7][6] ), .S0(n109), .S1(N10), .Y(n105) );
  MX4X1M U29 ( .A(\mem[0][0] ), .B(\mem[1][0] ), .C(\mem[2][0] ), .D(
        \mem[3][0] ), .S0(n109), .S1(N10), .Y(n94) );
  MX4X2M U30 ( .A(\mem[0][3] ), .B(\mem[1][3] ), .C(\mem[2][3] ), .D(
        \mem[3][3] ), .S0(n109), .S1(N10), .Y(n100) );
  CLKNAND2X2M U31 ( .A(n98), .B(n7), .Y(n87) );
  CLKNAND2X2M U32 ( .A(n97), .B(N11), .Y(n88) );
  NAND2X2M U33 ( .A(n87), .B(n88), .Y(rdata[2]) );
  MX4X1M U34 ( .A(\mem[0][2] ), .B(\mem[1][2] ), .C(\mem[2][2] ), .D(
        \mem[3][2] ), .S0(n109), .S1(N10), .Y(n98) );
  MX4X1M U35 ( .A(\mem[4][2] ), .B(\mem[5][2] ), .C(\mem[6][2] ), .D(
        \mem[7][2] ), .S0(n109), .S1(N10), .Y(n97) );
  CLKNAND2X2M U36 ( .A(n101), .B(N11), .Y(n90) );
  NAND2X2M U37 ( .A(n89), .B(n90), .Y(rdata[4]) );
  BUFX2M U38 ( .A(n20), .Y(n111) );
  BUFX2M U39 ( .A(n21), .Y(n110) );
  BUFX2M U40 ( .A(n13), .Y(n115) );
  BUFX2M U41 ( .A(n14), .Y(n114) );
  BUFX2M U42 ( .A(n15), .Y(n113) );
  OAI2BB2XLM U43 ( .B0(n123), .B1(n114), .A0N(\mem[2][7] ), .A1N(n114), .Y(n45) );
  OAI2BB2XLM U44 ( .B0(n119), .B1(n110), .A0N(\mem[7][3] ), .A1N(n110), .Y(n81) );
  OAI2BB2XLM U45 ( .B0(n120), .B1(n110), .A0N(\mem[7][4] ), .A1N(n110), .Y(n82) );
  OAI2BB2XLM U46 ( .B0(n121), .B1(n110), .A0N(\mem[7][5] ), .A1N(n110), .Y(n83) );
  OAI2BB2XLM U47 ( .B0(n122), .B1(n110), .A0N(\mem[7][6] ), .A1N(n110), .Y(n84) );
  MX2X3M U48 ( .A(\mem[4][7] ), .B(\mem[5][7] ), .S0(n109), .Y(n91) );
  MX2X3M U49 ( .A(\mem[6][7] ), .B(\mem[7][7] ), .S0(n109), .Y(n92) );
  MX2X3M U50 ( .A(n91), .B(n92), .S0(N10), .Y(n107) );
  NOR2BX2M U51 ( .AN(winc), .B(wfull), .Y(n16) );
  NAND3X2M U52 ( .A(n124), .B(n125), .C(n18), .Y(n17) );
  NAND3X2M U53 ( .A(n124), .B(n125), .C(n12), .Y(n11) );
  MX4X1M U54 ( .A(\mem[0][4] ), .B(\mem[1][4] ), .C(\mem[2][4] ), .D(
        \mem[3][4] ), .S0(n109), .S1(N10), .Y(n102) );
  MX4X1M U55 ( .A(\mem[4][4] ), .B(\mem[5][4] ), .C(\mem[6][4] ), .D(
        \mem[7][4] ), .S0(n109), .S1(N10), .Y(n101) );
  NOR2BX2M U56 ( .AN(n16), .B(waddr[2]), .Y(n12) );
  OAI2BB2X1M U57 ( .B0(n11), .B1(n116), .A0N(\mem[0][0] ), .A1N(n11), .Y(n22)
         );
  OAI2BB2X1M U58 ( .B0(n11), .B1(n117), .A0N(\mem[0][1] ), .A1N(n11), .Y(n23)
         );
  OAI2BB2X1M U59 ( .B0(n11), .B1(n118), .A0N(\mem[0][2] ), .A1N(n11), .Y(n24)
         );
  OAI2BB2X1M U60 ( .B0(n11), .B1(n119), .A0N(\mem[0][3] ), .A1N(n11), .Y(n25)
         );
  OAI2BB2X1M U61 ( .B0(n11), .B1(n120), .A0N(\mem[0][4] ), .A1N(n11), .Y(n26)
         );
  OAI2BB2X1M U62 ( .B0(n11), .B1(n121), .A0N(\mem[0][5] ), .A1N(n11), .Y(n27)
         );
  OAI2BB2X1M U63 ( .B0(n11), .B1(n122), .A0N(\mem[0][6] ), .A1N(n11), .Y(n28)
         );
  OAI2BB2X1M U64 ( .B0(n11), .B1(n123), .A0N(\mem[0][7] ), .A1N(n11), .Y(n29)
         );
  OAI2BB2X1M U65 ( .B0(n116), .B1(n17), .A0N(\mem[4][0] ), .A1N(n17), .Y(n54)
         );
  OAI2BB2X1M U66 ( .B0(n117), .B1(n17), .A0N(\mem[4][1] ), .A1N(n17), .Y(n55)
         );
  OAI2BB2X1M U67 ( .B0(n118), .B1(n17), .A0N(\mem[4][2] ), .A1N(n17), .Y(n56)
         );
  OAI2BB2X1M U68 ( .B0(n119), .B1(n17), .A0N(\mem[4][3] ), .A1N(n17), .Y(n57)
         );
  OAI2BB2X1M U69 ( .B0(n120), .B1(n17), .A0N(\mem[4][4] ), .A1N(n17), .Y(n58)
         );
  OAI2BB2X1M U70 ( .B0(n121), .B1(n17), .A0N(\mem[4][5] ), .A1N(n17), .Y(n59)
         );
  OAI2BB2X1M U71 ( .B0(n122), .B1(n17), .A0N(\mem[4][6] ), .A1N(n17), .Y(n60)
         );
  OAI2BB2X1M U72 ( .B0(n123), .B1(n17), .A0N(\mem[4][7] ), .A1N(n17), .Y(n61)
         );
  INVX2M U73 ( .A(wdata[0]), .Y(n116) );
  INVX2M U74 ( .A(wdata[1]), .Y(n117) );
  INVX2M U75 ( .A(wdata[2]), .Y(n118) );
  INVX2M U76 ( .A(wdata[3]), .Y(n119) );
  INVX2M U77 ( .A(wdata[4]), .Y(n120) );
  INVX2M U78 ( .A(wdata[5]), .Y(n121) );
  INVX2M U79 ( .A(wdata[6]), .Y(n122) );
  INVX2M U80 ( .A(wdata[7]), .Y(n123) );
  BUFX2M U81 ( .A(n19), .Y(n112) );
  NAND3X2M U82 ( .A(waddr[0]), .B(n125), .C(n18), .Y(n19) );
  OAI2BB2X1M U83 ( .B0(n116), .B1(n115), .A0N(\mem[1][0] ), .A1N(n115), .Y(n30) );
  OAI2BB2X1M U84 ( .B0(n117), .B1(n115), .A0N(\mem[1][1] ), .A1N(n115), .Y(n31) );
  OAI2BB2X1M U85 ( .B0(n118), .B1(n115), .A0N(\mem[1][2] ), .A1N(n115), .Y(n32) );
  OAI2BB2X1M U86 ( .B0(n119), .B1(n115), .A0N(\mem[1][3] ), .A1N(n115), .Y(n33) );
  OAI2BB2X1M U87 ( .B0(n120), .B1(n115), .A0N(\mem[1][4] ), .A1N(n115), .Y(n34) );
  OAI2BB2X1M U88 ( .B0(n121), .B1(n115), .A0N(\mem[1][5] ), .A1N(n115), .Y(n35) );
  OAI2BB2X1M U89 ( .B0(n122), .B1(n115), .A0N(\mem[1][6] ), .A1N(n115), .Y(n36) );
  OAI2BB2X1M U90 ( .B0(n123), .B1(n115), .A0N(\mem[1][7] ), .A1N(n115), .Y(n37) );
  OAI2BB2X1M U91 ( .B0(n116), .B1(n114), .A0N(\mem[2][0] ), .A1N(n114), .Y(n38) );
  OAI2BB2X1M U92 ( .B0(n117), .B1(n114), .A0N(\mem[2][1] ), .A1N(n114), .Y(n39) );
  OAI2BB2X1M U93 ( .B0(n118), .B1(n114), .A0N(\mem[2][2] ), .A1N(n114), .Y(n40) );
  OAI2BB2X1M U94 ( .B0(n119), .B1(n114), .A0N(\mem[2][3] ), .A1N(n114), .Y(n41) );
  OAI2BB2X1M U95 ( .B0(n120), .B1(n114), .A0N(\mem[2][4] ), .A1N(n114), .Y(n42) );
  OAI2BB2X1M U96 ( .B0(n121), .B1(n114), .A0N(\mem[2][5] ), .A1N(n114), .Y(n43) );
  OAI2BB2X1M U97 ( .B0(n122), .B1(n114), .A0N(\mem[2][6] ), .A1N(n114), .Y(n44) );
  OAI2BB2X1M U98 ( .B0(n116), .B1(n113), .A0N(\mem[3][0] ), .A1N(n113), .Y(n46) );
  OAI2BB2X1M U99 ( .B0(n117), .B1(n113), .A0N(\mem[3][1] ), .A1N(n113), .Y(n47) );
  OAI2BB2X1M U100 ( .B0(n118), .B1(n113), .A0N(\mem[3][2] ), .A1N(n113), .Y(
        n48) );
  OAI2BB2X1M U101 ( .B0(n119), .B1(n113), .A0N(\mem[3][3] ), .A1N(n113), .Y(
        n49) );
  OAI2BB2X1M U102 ( .B0(n120), .B1(n113), .A0N(\mem[3][4] ), .A1N(n113), .Y(
        n50) );
  OAI2BB2X1M U103 ( .B0(n121), .B1(n113), .A0N(\mem[3][5] ), .A1N(n113), .Y(
        n51) );
  OAI2BB2X1M U104 ( .B0(n122), .B1(n113), .A0N(\mem[3][6] ), .A1N(n113), .Y(
        n52) );
  OAI2BB2X1M U105 ( .B0(n123), .B1(n113), .A0N(\mem[3][7] ), .A1N(n113), .Y(
        n53) );
  OAI2BB2X1M U106 ( .B0(n116), .B1(n112), .A0N(\mem[5][0] ), .A1N(n112), .Y(
        n62) );
  OAI2BB2X1M U107 ( .B0(n117), .B1(n112), .A0N(\mem[5][1] ), .A1N(n112), .Y(
        n63) );
  OAI2BB2X1M U108 ( .B0(n118), .B1(n112), .A0N(\mem[5][2] ), .A1N(n112), .Y(
        n64) );
  OAI2BB2X1M U109 ( .B0(n119), .B1(n112), .A0N(\mem[5][3] ), .A1N(n112), .Y(
        n65) );
  OAI2BB2X1M U110 ( .B0(n120), .B1(n112), .A0N(\mem[5][4] ), .A1N(n112), .Y(
        n66) );
  OAI2BB2X1M U111 ( .B0(n121), .B1(n112), .A0N(\mem[5][5] ), .A1N(n112), .Y(
        n67) );
  OAI2BB2X1M U112 ( .B0(n122), .B1(n112), .A0N(\mem[5][6] ), .A1N(n112), .Y(
        n68) );
  OAI2BB2X1M U113 ( .B0(n123), .B1(n112), .A0N(\mem[5][7] ), .A1N(n112), .Y(
        n69) );
  OAI2BB2X1M U114 ( .B0(n116), .B1(n111), .A0N(\mem[6][0] ), .A1N(n111), .Y(
        n70) );
  OAI2BB2X1M U115 ( .B0(n117), .B1(n111), .A0N(\mem[6][1] ), .A1N(n111), .Y(
        n71) );
  OAI2BB2X1M U116 ( .B0(n118), .B1(n111), .A0N(\mem[6][2] ), .A1N(n111), .Y(
        n72) );
  OAI2BB2X1M U117 ( .B0(n119), .B1(n111), .A0N(\mem[6][3] ), .A1N(n111), .Y(
        n73) );
  OAI2BB2X1M U118 ( .B0(n120), .B1(n111), .A0N(\mem[6][4] ), .A1N(n111), .Y(
        n74) );
  OAI2BB2X1M U119 ( .B0(n121), .B1(n111), .A0N(\mem[6][5] ), .A1N(n111), .Y(
        n75) );
  OAI2BB2X1M U120 ( .B0(n122), .B1(n111), .A0N(\mem[6][6] ), .A1N(n111), .Y(
        n76) );
  OAI2BB2X1M U121 ( .B0(n123), .B1(n111), .A0N(\mem[6][7] ), .A1N(n111), .Y(
        n77) );
  OAI2BB2X1M U122 ( .B0(n116), .B1(n110), .A0N(\mem[7][0] ), .A1N(n110), .Y(
        n78) );
  OAI2BB2X1M U123 ( .B0(n117), .B1(n110), .A0N(\mem[7][1] ), .A1N(n110), .Y(
        n79) );
  OAI2BB2X1M U124 ( .B0(n118), .B1(n110), .A0N(\mem[7][2] ), .A1N(n110), .Y(
        n80) );
  OAI2BB2X1M U125 ( .B0(n123), .B1(n110), .A0N(\mem[7][7] ), .A1N(n110), .Y(
        n85) );
  AND2X2M U126 ( .A(waddr[2]), .B(n16), .Y(n18) );
  NAND3X2M U127 ( .A(n12), .B(n125), .C(waddr[0]), .Y(n13) );
  NAND3X2M U128 ( .A(n12), .B(n124), .C(waddr[1]), .Y(n14) );
  NAND3X2M U129 ( .A(waddr[0]), .B(n12), .C(waddr[1]), .Y(n15) );
  NAND3X2M U130 ( .A(waddr[1]), .B(waddr[0]), .C(n18), .Y(n21) );
  NAND3X2M U131 ( .A(waddr[1]), .B(n124), .C(n18), .Y(n20) );
  INVX2M U132 ( .A(waddr[0]), .Y(n124) );
  INVX2M U133 ( .A(waddr[1]), .Y(n125) );
  BUFX4M U134 ( .A(N9), .Y(n109) );
endmodule


module FIFO_TOP ( wclk, rclk, wrst_n, rrst_n, winc, rinc, wdata, rdata, wfull, 
        rempty );
  input [7:0] wdata;
  output [7:0] rdata;
  input wclk, rclk, wrst_n, rrst_n, winc, rinc;
  output wfull, rempty;
  wire   n1;
  wire   [3:0] wptr;
  wire   [3:0] raddr;
  wire   [3:0] rptr;
  wire   [3:0] waddr;

  rempty_depth8_n3 B0 ( .rclk(rclk), .rrst_n(n1), .rinc(rinc), .rq2_wptr(wptr), 
        .raddr(raddr), .rptr(rptr), .rempty(rempty) );
  wfull_depth8_n3 B1 ( .wclk(wclk), .wrst_n(wrst_n), .winc(winc), .wq2_rptr(
        rptr), .waddr(waddr), .wptr(wptr), .wfull(wfull) );
  fifo_async_width8_depth8_n3 B2 ( .wclk(wclk), .waddr(waddr), .raddr(raddr), 
        .winc(winc), .wfull(wfull), .wdata(wdata), .rdata(rdata) );
  BUFX2M U1 ( .A(rrst_n), .Y(n1) );
endmodule


module ClkDIV_0_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module ClkDIV_0_DW01_inc_1 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(SUM[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDIV_0 ( clk, reset_n, enable, I_div_ratio, o_div_clk );
  input [7:0] I_div_ratio;
  input clk, reset_n, enable;
  output o_div_clk;
  wire   flag, N10, N11, N12, N13, N14, N15, N16, N17, N21, N22, N23, N24, N25,
         N26, N27, N28, N57, N58, N59, N60, N61, N62, N63, N64, n17, n18, n1,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33;
  wire   [7:0] counter;

  ClkDIV_0_DW01_inc_0 r69 ( .A(counter), .SUM({N28, N27, N26, N25, N24, N23, 
        N22, N21}) );
  ClkDIV_0_DW01_inc_1 add_31 ( .A({1'b0, I_div_ratio[7:1]}), .SUM({N17, N16, 
        N15, N14, N13, N12, N11, N10}) );
  DFFRQX2M o_div_clk_reg ( .D(n17), .CK(clk), .RN(reset_n), .Q(o_div_clk) );
  DFFSQX2M flag_reg ( .D(n18), .CK(clk), .SN(reset_n), .Q(flag) );
  DFFRQX2M \counter_reg[7]  ( .D(N64), .CK(clk), .RN(reset_n), .Q(counter[7])
         );
  DFFRQX2M \counter_reg[0]  ( .D(N57), .CK(clk), .RN(reset_n), .Q(counter[0])
         );
  DFFRQX2M \counter_reg[6]  ( .D(N63), .CK(clk), .RN(reset_n), .Q(counter[6])
         );
  DFFRQX2M \counter_reg[1]  ( .D(N58), .CK(clk), .RN(reset_n), .Q(counter[1])
         );
  DFFRQX2M \counter_reg[2]  ( .D(N59), .CK(clk), .RN(reset_n), .Q(counter[2])
         );
  DFFRQX2M \counter_reg[5]  ( .D(N62), .CK(clk), .RN(reset_n), .Q(counter[5])
         );
  DFFRQX2M \counter_reg[4]  ( .D(N61), .CK(clk), .RN(reset_n), .Q(counter[4])
         );
  DFFRQX2M \counter_reg[3]  ( .D(N60), .CK(clk), .RN(reset_n), .Q(counter[3])
         );
  NAND2X2M U3 ( .A(n6), .B(n3), .Y(n5) );
  XNOR2X1M U4 ( .A(flag), .B(n1), .Y(n18) );
  OAI2B1X1M U5 ( .A1N(n3), .A0(n4), .B0(I_div_ratio[0]), .Y(n1) );
  CLKXOR2X2M U6 ( .A(n5), .B(o_div_clk), .Y(n17) );
  NOR2BX1M U8 ( .AN(N28), .B(n5), .Y(N64) );
  NOR2BX1M U9 ( .AN(N27), .B(n5), .Y(N63) );
  NOR2BX1M U10 ( .AN(N26), .B(n5), .Y(N62) );
  NOR2BX1M U11 ( .AN(N25), .B(n5), .Y(N61) );
  NOR2BX1M U12 ( .AN(N24), .B(n5), .Y(N60) );
  NOR2BX1M U13 ( .AN(N23), .B(n5), .Y(N59) );
  NOR2BX1M U14 ( .AN(N22), .B(n5), .Y(N58) );
  NOR2BX1M U15 ( .AN(N21), .B(n5), .Y(N57) );
  CLKNAND2X2M U16 ( .A(flag), .B(n7), .Y(n3) );
  MXI2X1M U17 ( .A(n7), .B(n4), .S0(I_div_ratio[0]), .Y(n6) );
  AND4X1M U18 ( .A(n8), .B(n9), .C(n10), .D(n11), .Y(n4) );
  NOR4X1M U19 ( .A(n12), .B(n13), .C(flag), .D(n14), .Y(n11) );
  NAND3X1M U20 ( .A(n15), .B(n16), .C(n19), .Y(n12) );
  XNOR2X1M U21 ( .A(counter[1]), .B(N11), .Y(n19) );
  XNOR2X1M U22 ( .A(counter[2]), .B(N12), .Y(n16) );
  XNOR2X1M U23 ( .A(counter[0]), .B(N10), .Y(n15) );
  NOR3X1M U24 ( .A(n20), .B(n21), .C(n22), .Y(n10) );
  CLKXOR2X2M U25 ( .A(counter[3]), .B(N13), .Y(n22) );
  CLKXOR2X2M U26 ( .A(counter[5]), .B(N15), .Y(n21) );
  CLKXOR2X2M U27 ( .A(counter[4]), .B(N14), .Y(n20) );
  XNOR2X1M U28 ( .A(counter[6]), .B(N16), .Y(n9) );
  XNOR2X1M U29 ( .A(counter[7]), .B(N17), .Y(n8) );
  AND4X1M U30 ( .A(n23), .B(n24), .C(n25), .D(n26), .Y(n7) );
  NOR4X1M U31 ( .A(n27), .B(n13), .C(counter[7]), .D(n14), .Y(n26) );
  NOR4BX1M U32 ( .AN(n28), .B(I_div_ratio[2]), .C(I_div_ratio[3]), .D(
        I_div_ratio[1]), .Y(n14) );
  NOR4X1M U33 ( .A(I_div_ratio[7]), .B(I_div_ratio[6]), .C(I_div_ratio[5]), 
        .D(I_div_ratio[4]), .Y(n28) );
  CLKINVX1M U34 ( .A(enable), .Y(n13) );
  CLKNAND2X2M U35 ( .A(n29), .B(n30), .Y(n27) );
  XNOR2X1M U36 ( .A(I_div_ratio[1]), .B(counter[0]), .Y(n30) );
  XNOR2X1M U37 ( .A(I_div_ratio[2]), .B(counter[1]), .Y(n29) );
  NOR3X1M U38 ( .A(n31), .B(n32), .C(n33), .Y(n25) );
  CLKXOR2X2M U39 ( .A(counter[2]), .B(I_div_ratio[3]), .Y(n33) );
  CLKXOR2X2M U40 ( .A(counter[4]), .B(I_div_ratio[5]), .Y(n32) );
  CLKXOR2X2M U41 ( .A(counter[3]), .B(I_div_ratio[4]), .Y(n31) );
  XNOR2X1M U42 ( .A(I_div_ratio[6]), .B(counter[5]), .Y(n24) );
  XNOR2X1M U43 ( .A(I_div_ratio[7]), .B(counter[6]), .Y(n23) );
endmodule


module ClkDIV_1_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module ClkDIV_1_DW01_inc_1 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(SUM[7]), .S(SUM[6]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDIV_1 ( clk, reset_n, enable, I_div_ratio, o_div_clk );
  input [7:0] I_div_ratio;
  input clk, reset_n, enable;
  output o_div_clk;
  wire   flag, N10, N11, N12, N13, N14, N15, N16, N17, N21, N22, N23, N24, N25,
         N26, N27, N28, N57, N58, N59, N60, N61, N62, N63, N64, n1, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35;
  wire   [7:0] counter;

  ClkDIV_1_DW01_inc_0 r69 ( .A(counter), .SUM({N28, N27, N26, N25, N24, N23, 
        N22, N21}) );
  ClkDIV_1_DW01_inc_1 add_31 ( .A({1'b0, I_div_ratio[7:1]}), .SUM({N17, N16, 
        N15, N14, N13, N12, N11, N10}) );
  DFFRQX2M o_div_clk_reg ( .D(n35), .CK(clk), .RN(reset_n), .Q(o_div_clk) );
  DFFSQX2M flag_reg ( .D(n34), .CK(clk), .SN(reset_n), .Q(flag) );
  DFFRQX2M \counter_reg[7]  ( .D(N64), .CK(clk), .RN(reset_n), .Q(counter[7])
         );
  DFFRQX2M \counter_reg[0]  ( .D(N57), .CK(clk), .RN(reset_n), .Q(counter[0])
         );
  DFFRQX2M \counter_reg[6]  ( .D(N63), .CK(clk), .RN(reset_n), .Q(counter[6])
         );
  DFFRQX2M \counter_reg[1]  ( .D(N58), .CK(clk), .RN(reset_n), .Q(counter[1])
         );
  DFFRQX2M \counter_reg[2]  ( .D(N59), .CK(clk), .RN(reset_n), .Q(counter[2])
         );
  DFFRQX2M \counter_reg[5]  ( .D(N62), .CK(clk), .RN(reset_n), .Q(counter[5])
         );
  DFFRQX2M \counter_reg[4]  ( .D(N61), .CK(clk), .RN(reset_n), .Q(counter[4])
         );
  DFFRQX2M \counter_reg[3]  ( .D(N60), .CK(clk), .RN(reset_n), .Q(counter[3])
         );
  NAND2X2M U3 ( .A(n6), .B(n3), .Y(n5) );
  XNOR2X1M U4 ( .A(flag), .B(n1), .Y(n34) );
  OAI2B1X1M U5 ( .A1N(n3), .A0(n4), .B0(I_div_ratio[0]), .Y(n1) );
  CLKXOR2X2M U6 ( .A(n5), .B(o_div_clk), .Y(n35) );
  NOR2BX1M U8 ( .AN(N28), .B(n5), .Y(N64) );
  NOR2BX1M U9 ( .AN(N27), .B(n5), .Y(N63) );
  NOR2BX1M U10 ( .AN(N26), .B(n5), .Y(N62) );
  NOR2BX1M U11 ( .AN(N25), .B(n5), .Y(N61) );
  NOR2BX1M U12 ( .AN(N24), .B(n5), .Y(N60) );
  NOR2BX1M U13 ( .AN(N23), .B(n5), .Y(N59) );
  NOR2BX1M U14 ( .AN(N22), .B(n5), .Y(N58) );
  NOR2BX1M U15 ( .AN(N21), .B(n5), .Y(N57) );
  CLKNAND2X2M U16 ( .A(flag), .B(n7), .Y(n3) );
  MXI2X1M U17 ( .A(n7), .B(n4), .S0(I_div_ratio[0]), .Y(n6) );
  AND4X1M U18 ( .A(n8), .B(n9), .C(n10), .D(n11), .Y(n4) );
  NOR4X1M U19 ( .A(n12), .B(n13), .C(flag), .D(n14), .Y(n11) );
  NAND3X1M U20 ( .A(n15), .B(n16), .C(n19), .Y(n12) );
  XNOR2X1M U21 ( .A(counter[1]), .B(N11), .Y(n19) );
  XNOR2X1M U22 ( .A(counter[2]), .B(N12), .Y(n16) );
  XNOR2X1M U23 ( .A(counter[0]), .B(N10), .Y(n15) );
  NOR3X1M U24 ( .A(n20), .B(n21), .C(n22), .Y(n10) );
  CLKXOR2X2M U25 ( .A(counter[3]), .B(N13), .Y(n22) );
  CLKXOR2X2M U26 ( .A(counter[5]), .B(N15), .Y(n21) );
  CLKXOR2X2M U27 ( .A(counter[4]), .B(N14), .Y(n20) );
  XNOR2X1M U28 ( .A(counter[6]), .B(N16), .Y(n9) );
  XNOR2X1M U29 ( .A(counter[7]), .B(N17), .Y(n8) );
  AND4X1M U30 ( .A(n23), .B(n24), .C(n25), .D(n26), .Y(n7) );
  NOR4X1M U31 ( .A(n27), .B(n13), .C(counter[7]), .D(n14), .Y(n26) );
  NOR4BX1M U32 ( .AN(n28), .B(I_div_ratio[2]), .C(I_div_ratio[3]), .D(
        I_div_ratio[1]), .Y(n14) );
  NOR4X1M U33 ( .A(I_div_ratio[7]), .B(I_div_ratio[6]), .C(I_div_ratio[5]), 
        .D(I_div_ratio[4]), .Y(n28) );
  CLKINVX1M U34 ( .A(enable), .Y(n13) );
  CLKNAND2X2M U35 ( .A(n29), .B(n30), .Y(n27) );
  XNOR2X1M U36 ( .A(I_div_ratio[1]), .B(counter[0]), .Y(n30) );
  XNOR2X1M U37 ( .A(I_div_ratio[2]), .B(counter[1]), .Y(n29) );
  NOR3X1M U38 ( .A(n31), .B(n32), .C(n33), .Y(n25) );
  CLKXOR2X2M U39 ( .A(counter[2]), .B(I_div_ratio[3]), .Y(n33) );
  CLKXOR2X2M U40 ( .A(counter[4]), .B(I_div_ratio[5]), .Y(n32) );
  CLKXOR2X2M U41 ( .A(counter[3]), .B(I_div_ratio[4]), .Y(n31) );
  XNOR2X1M U42 ( .A(I_div_ratio[6]), .B(counter[5]), .Y(n24) );
  XNOR2X1M U43 ( .A(I_div_ratio[7]), .B(counter[6]), .Y(n23) );
endmodule


module mux ( in1, in2, sel, out );
  input in1, in2, sel;
  output out;


  MX2X2M U1 ( .A(in2), .B(in1), .S0(sel), .Y(out) );
endmodule


module SYSTEM_TOP ( REF_CLK, UART_CLK, RST, RX_IN, TX_OUT, Stop_Error, 
        Parity_Error );
  input REF_CLK, UART_CLK, RST, RX_IN;
  output TX_OUT, Stop_Error, Parity_Error;
  wire   SYNC_RST1, sync_valid, FIFO_FULL, OUT_Valid, Rd_D_Vld, WrEn, RdEn,
         WR_INC, EN, Gate_EN, ALU_CLK, TX_CLK, RX_CLK, SYNC_RST2, Busy,
         unsync_valid, F_EMPTY, RD_INC, RX_CLKK, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18;
  wire   [7:0] UART_CONFIG;
  wire   [3:0] Div_Ratio_RX;
  wire   [7:0] sync_data;
  wire   [15:0] ALU_OUT;
  wire   [7:0] Rd_D;
  wire   [7:0] Wr_D;
  wire   [7:0] WR_DATA;
  wire   [3:0] FUN;
  wire   [3:0] Addr;
  wire   [7:0] Op_A;
  wire   [7:0] Op_B;
  wire   [7:0] Div_Ratio_TX;
  wire   [7:0] RD_DATA;
  wire   [7:0] unsync_data;

  SYS_CTRL B0 ( .REF_CLK(REF_CLK), .SYNC_RST(n12), .SYNC_VALID(sync_valid), 
        .SYNC_P_DATA(sync_data), .FIFO_FULL(FIFO_FULL), .OUT_VALID(OUT_Valid), 
        .ALU_OUT(ALU_OUT), .Rd_D_Vld(Rd_D_Vld), .Rd_D(Rd_D), .WrEN(WrEn), 
        .RdEN(RdEn), .WR_INC(WR_INC), .EN(EN), .Gate_EN(Gate_EN), .Wr_D(Wr_D), 
        .WR_DATA(WR_DATA), .FUNC(FUN), .Addr(Addr) );
  RegFile B1 ( .clk(REF_CLK), .reset_n(n12), .Wr_En(WrEn), .Rd_En(RdEn), 
        .Address({Addr[3:1], n11}), .WrData(Wr_D), .RdData(Rd_D), .Rd_D_Vld(
        Rd_D_Vld), .REG0(Op_A), .REG1(Op_B), .REG2(UART_CONFIG), .REG3(
        Div_Ratio_TX) );
  alU B2 ( .clk(ALU_CLK), .reset_n(n12), .en(EN), .A(Op_A), .B(Op_B), 
        .ALU_FUN(FUN), .ALU_OUT(ALU_OUT), .OUT_VALID(OUT_Valid) );
  CLK_GATE B3 ( .CLK_EN(Gate_EN), .CLK(REF_CLK), .GATED_CLK(ALU_CLK) );
  UART_TOP B4 ( .TX_CLK(TX_CLK), .RX_CLK(RX_CLK), .SYNC_RST(SYNC_RST2), 
        .F_EMPTY(n14), .RX_IN(RX_IN), .UART_CONFIG(UART_CONFIG), .RD_DATA(
        RD_DATA), .BUSY(Busy), .VALID(unsync_valid), .TX_OUT(TX_OUT), .P_DATA(
        unsync_data), .Stop_Error(Stop_Error), .Parity_Error(Parity_Error) );
  DATA_SYNC B5 ( .clk(REF_CLK), .reset_n(n12), .bus_enable(unsync_valid), 
        .unsync_bus(unsync_data), .enable_pulse(sync_valid), .sync_bus(
        sync_data) );
  RST_SYNC_0 B6 ( .clk(REF_CLK), .reset_n(RST), .SYNC_RST(SYNC_RST1) );
  RST_SYNC_1 B7 ( .clk(UART_CLK), .reset_n(RST), .SYNC_RST(SYNC_RST2) );
  PULSE_GEN B8 ( .clk(TX_CLK), .reset_n(SYNC_RST2), .D(Busy), .Pulse(RD_INC)
         );
  FIFO_TOP B9 ( .wclk(REF_CLK), .rclk(TX_CLK), .wrst_n(n12), .rrst_n(SYNC_RST2), .winc(WR_INC), .rinc(RD_INC), .wdata(WR_DATA), .rdata(RD_DATA), .wfull(
        FIFO_FULL), .rempty(F_EMPTY) );
  ClkDIV_0 B10 ( .clk(UART_CLK), .reset_n(SYNC_RST2), .enable(1'b1), 
        .I_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, Div_Ratio_RX}), .o_div_clk(
        RX_CLKK) );
  ClkDIV_1 B11 ( .clk(UART_CLK), .reset_n(SYNC_RST2), .enable(1'b1), 
        .I_div_ratio(Div_Ratio_TX), .o_div_clk(TX_CLK) );
  mux B12 ( .in1(UART_CLK), .in2(RX_CLKK), .sel(Div_Ratio_RX[0]), .out(RX_CLK)
         );
  NOR4X1M U17 ( .A(n6), .B(UART_CONFIG[5]), .C(UART_CONFIG[7]), .D(
        UART_CONFIG[6]), .Y(Div_Ratio_RX[3]) );
  BUFX2M U18 ( .A(Addr[0]), .Y(n11) );
  INVX2M U19 ( .A(F_EMPTY), .Y(n14) );
  INVX4M U20 ( .A(n13), .Y(n12) );
  INVX2M U21 ( .A(SYNC_RST1), .Y(n13) );
  NAND4BX1M U22 ( .AN(UART_CONFIG[5]), .B(UART_CONFIG[6]), .C(n16), .D(n15), 
        .Y(n8) );
  NAND4BX1M U23 ( .AN(UART_CONFIG[6]), .B(UART_CONFIG[5]), .C(n16), .D(n15), 
        .Y(n7) );
  NOR3X2M U24 ( .A(n7), .B(UART_CONFIG[3]), .C(UART_CONFIG[2]), .Y(
        Div_Ratio_RX[2]) );
  NOR3X2M U25 ( .A(n8), .B(UART_CONFIG[3]), .C(UART_CONFIG[2]), .Y(
        Div_Ratio_RX[1]) );
  NAND3X2M U26 ( .A(n18), .B(n17), .C(UART_CONFIG[4]), .Y(n6) );
  OAI211X2M U27 ( .A0(n9), .A1(n10), .B0(n18), .C0(n17), .Y(Div_Ratio_RX[0])
         );
  NAND2X2M U28 ( .A(n8), .B(n7), .Y(n10) );
  NOR4X1M U29 ( .A(UART_CONFIG[7]), .B(UART_CONFIG[6]), .C(UART_CONFIG[5]), 
        .D(n16), .Y(n9) );
  INVX2M U30 ( .A(UART_CONFIG[4]), .Y(n16) );
  INVX2M U31 ( .A(UART_CONFIG[3]), .Y(n17) );
  INVX2M U32 ( .A(UART_CONFIG[2]), .Y(n18) );
  INVX2M U33 ( .A(UART_CONFIG[7]), .Y(n15) );
endmodule

