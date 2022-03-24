module Decoder_v2(writeAddress, cs); 
output [3:0] cs; 
input [1:0]writeAddress; 

assign cs[0] = ~writeAddress[1] & ~writeAddress[0];
assign cs[1] = ~writeAddress[1] & writeAddress[0];
assign cs[2] = writeAddress[1] & ~writeAddress[0];
assign cs[3] = writeAddress[1] & writeAddress[0];
//input en; 

/*always @(writeAddress or en)   begin 
	if (en == 1'b1) 
case (writeAddress) 
2'b00: {cs0, cs1, cs2, cs3} = 4'b1000;
2'b01: {cs0, cs1, cs2, cs3} = 4'b0100;
2'b10: {cs0, cs1, cs2, cs3} = 4'b0010;
2'b11: {cs0, cs1, cs2, cs3} = 4'b0001;

default: {cs0, cs1, cs2, cs3} = 4'bz; 
endcase 
//if (en == 0) {cs0, cs1, cs2, cs3} = 4'b0000; 
end */
endmodule
