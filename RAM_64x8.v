module RAM_64x8 (CS, WR, CLK, address, Din, Dout);

	input CS;
	input WR; 
	input CLK;
	input [5:0] address; 
	input [7:0] Din;
	output reg[7:0] Dout;


	reg [7:0] memArray [63:0];
	reg [7:0] memOut;
	
	
	always @(posedge CLK) 
		begin
			if(CS && WR)
			memArray[address] = Din;
		end
	
	always @(posedge CLK)
		begin
			memOut = memArray[address];
			
			Dout = (CS && ~WR) ? memOut:8'b0;
		end

	//always	

endmodule
  
