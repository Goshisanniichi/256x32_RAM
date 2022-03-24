module Tri_state_Module(o, i, en);
   input [31:0] i;
   input en;
   output [31:0] o;
	
	assign o = (en) ? i : 32'bz;
	
/*always @(en or i)
begin
   case (en)
      1'b1 : o = i;
      1'b0 : o = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      default : o = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
   endcase
end*/

endmodule
