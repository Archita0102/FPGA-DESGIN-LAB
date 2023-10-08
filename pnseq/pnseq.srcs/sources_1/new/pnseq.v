module d_flip_flop (
  input clk,   // Clock input
  input rst,   // Reset input (active high)
  input d,     // Data input
  output reg q     // Q output
);

  //reg q_internal;   // Internal state of the flip-flop

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      // Reset the flip-flop to 0
      q <= 1'b0;
    end 
    else begin
      // Update the flip-flop state with D input
      q <= d;
    end
  end

  //assign q = q_internal;

endmodule

module pnseq (
  input clk,      // Clock input
  input rst,      // Reset input (active high)
  output [3:0] q  // 4-bit pseudo-random sequence output
);

 wire xor_out;
 wire [3:0] q_internal;
 
// always@(*)
// begin
// if (rst)
// q_internal[0] = 1'b1;
// end

  // Instantiate 4 D flip-flops
  d_flip_flop ff1 (.clk(clk), .rst(rst), .d(xor_out), .q(q_internal[0]));
  d_flip_flop ff2 (.clk(clk), .rst(rst), .d(q_internal[0]), .q(q_internal[1]));
  d_flip_flop ff3 (.clk(clk), .rst(rst), .d(q_internal[1]), .q(q_internal[2]));
  d_flip_flop ff4 (.clk(clk), .rst(rst), .d(q_internal[2]), .q(q_internal[3]));

  // Calculate XOR of LSB and MSB of previous cycle
  assign xor_out = q_internal[3] ^ q_internal[0];

  assign q = q_internal;

endmodule
