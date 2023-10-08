`timescale 1ns / 1ps
module tb;

  // Define parameters
  reg clk;
  reg rst;
  reg shift_en;
  reg [3:0] d_in;
  wire [3:0] q;

  // Instantiate the shift_register module
  pnseq dut (
    .clk(clk),
    .rst(rst),
    .shift_en(shift_en),
    .d_in(d_in),
    .q(q)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Toggle clock every 5 time units
  end

  // Initialize signals
  initial begin
    clk = 0;
    rst = 0;
    shift_en = 0;
    d_in = 4'b0000;

    // Apply reset
    rst = 1;
    #10 rst = 0;

    // Test case 1: Shift in data
    d_in = 4'b1010;
    shift_en = 1;
    #20 shift_en = 0;
    
    // Test case 2: Reset and shift again
    rst = 1;
    #10 rst = 0;
    #20 d_in = 4'b1101;
    shift_en = 1;
    #20 shift_en = 0;
    
    // Add more test cases here if needed
    
    // Terminate simulation
    $finish;
  end

  // Display the results
  always @(posedge clk) begin
    $display("q = %b", q);
  end

endmodule

// Simulate the testbench
module tb;
  reg clk;
  initial begin
    clk = 0;
    // Generate clock with 50 time units period
    forever #25 clk = ~clk;
  end
  // Instantiate the testbench module
  testbench test (
    .clk(clk)
  );
  // Terminate simulation after a period of time
  initial #500 $finish;
endmodule

