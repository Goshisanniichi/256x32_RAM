module RAM_256x32_TB;

reg CLK, WR; //  clock and the write enable signal
reg [31:0] Din; // addressta in 
reg [7:0] address; // address input the 2 least sig bits go to chip select

wire [31:0] Dout, D0, D1, D2, D3; // final address data out from the 256x32 ram ANd alos the 64x8

RAM_256x32 dut (.CLK(CLK), .WR(WR), .Din(Din), .address(address), .Dout(Dout), .D0(D0), .D1(D1), .D2(D2), .D3(D3));

//give other inputs
initial begin 

CLK = 0;

forever #5 CLK = ~CLK;
 end

initial begin // 

#10;

WR <= 1;
address <= 8'b00110110; //write address
Din <=32'd8473; // Data to be stored at the address above 
#10;

WR <= 1;
address <= 8'b01011100; //write address
Din <=32'd9632; // Data to be stored at the address above
#10;

WR <= 1;
address <= 8'b10101101; //write address
Din <=32'd4862; // Data to be stored at the address above
#10;

WR <= 1;
address <= 8'b11010111; //write address
Din <=32'd1973; // Data to be stored at the address above
#10;

WR <= 0;
address <= 8'b00110110; //write address
//Din <=32'd8473; // Data to be read at the address above 
#10;

WR <= 0;
address <= 8'b01011100; //write address
//Din <=32'd9632; // Data to be read at the address above
#10;

WR <= 0;
address <= 8'b10101101; //write address
//Din <=32'd4862; // Data to be read at the address above
#10;

WR <= 0;
address <= 8'b11010111; //write address
//Din <=32'd1973; // Data to be read at the address above
#40 $stop;

end

endmodule

