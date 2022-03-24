module RAM_256x32(CLK, WR, Din, address, Dout, D0, D1, D2, D3);

input CLK, WR; //  clock and the write enable signal
input [31:0] Din; // data in 
input [7:0] address; // address input the 2 least sig bits go to chip select

output [31:0] Dout, D0, D1, D2, D3; // final data out from the 256x32 ram
wire  [3:0] cs;
wire [31:0] Dout_sig0, Dout_sig1, Dout_sig2, Dout_sig3; // data out determined by the cs signal


Decoder_v2 dec1 (address [7:6], cs); //(writeAddress, cs[0], cs1, cs2, cs3, en);

RAM_64x8 rcs0d3124 (cs[0], WR, CLK, address[5:0], Din[31:24], Dout_sig0[31:24]); //(CS, WR, CLK, address, Din, Dout);
RAM_64x8 rcs0d2316 (cs[0], WR, CLK, address[5:0], Din[23:16], Dout_sig0[23:16]); //(CS, WR, CLK, address, Din, Dout);
RAM_64x8 rcs0d158  (cs[0], WR, CLK, address[5:0], Din[15:8], Dout_sig0[15:8]); //(CS, WR, CLK, address, Din, Dout);
RAM_64x8 rcs0d70   (cs[0], WR, CLK, address[5:0], Din[7:0], Dout_sig0[7:0]); //(CS, WR, CLK, address, Din, Dout);

RAM_64x8 rcs1d3124 (cs[1], WR, CLK, address[5:0], Din[31:24], Dout_sig1[31:24]); //(CS, WR, CLK, address, Din, Dout);
RAM_64x8 rcs1d2316 (cs[1], WR, CLK, address[5:0], Din[23:16], Dout_sig1[23:16]); //(CS, WR, CLK, address, Din, Dout);
RAM_64x8 rcs1d158  (cs[1], WR, CLK, address[5:0], Din[15:8], Dout_sig1[15:8]); //(CS, WR, CLK, address, Din, Dout);
RAM_64x8 rcs1d70   (cs[1], WR, CLK, address[5:0], Din[7:0], Dout_sig1[7:0]); //(CS, WR, CLK, address, Din, Dout);

RAM_64x8 rcs2d3124 (cs[2], WR, CLK, address[5:0], Din[31:24], Dout_sig2[31:24]); //(CS, WR, CLK, address, Din, Dout);
RAM_64x8 rcs2d2316 (cs[2], WR, CLK, address[5:0], Din[23:16], Dout_sig2[23:16]); //(CS, WR, CLK, address, Din, Dout);
RAM_64x8 rcs2d158  (cs[2], WR, CLK, address[5:0], Din[15:8], Dout_sig2[15:8]); //(CS, WR, CLK, address, Din, Dout);
RAM_64x8 rcs2d70   (cs[2], WR, CLK, address[5:0], Din[7:0], Dout_sig2[7:0]); //(CS, WR, CLK, address, Din, Dout);

RAM_64x8 rcs3d3124 (cs[3], WR, CLK, address[5:0], Din[31:24], Dout_sig3[31:24]); //(CS, WR, CLK, address, Din, Dout);
RAM_64x8 rcs3d2316 (cs[3], WR, CLK, address[5:0], Din[23:16], Dout_sig3[23:16]); //(CS, WR, CLK, address, Din, Dout);
RAM_64x8 rcs3d158  (cs[3], WR, CLK, address[5:0], Din[15:8], Dout_sig3[15:8]); //(CS, WR, CLK, address, Din, Dout);
RAM_64x8 rcs3d70   (cs[3], WR, CLK, address[5:0], Din[7:0], Dout_sig3[7:0]); //(CS, WR, CLK, address, Din, Dout);

assign D0 = Dout_sig0;
assign D1 = Dout_sig1;
assign D2 = Dout_sig2;
assign D3 = Dout_sig3;

Tri_state_Module rcs0 (Dout[31:0], Dout_sig0[31:0] , cs[0] ); //Tri_state_Module(o, i, en);

Tri_state_Module rcs1 (Dout[31:0], Dout_sig1[31:0] , cs[1] ); //Tri_state_Module(o, i, en);

Tri_state_Module rcs2 (Dout[31:0], Dout_sig2[31:0] , cs[2] ); //Tri_state_Module(o, i, en);

Tri_state_Module rcs3 (Dout[31:0], Dout_sig3[31:0] , cs[3] ); //Tri_state_Module(o, i, en);

endmodule
