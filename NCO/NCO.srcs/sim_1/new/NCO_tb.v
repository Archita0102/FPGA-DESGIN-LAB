
module NCO_tb;
    reg clk;
    reg rst;
    wire [15:0] sawtooth;
    wire square;

    // Instantiate the NCO module
    NCO dut (
        .clk(clk),
        .rst(rst),
        .fcw(16'b0000000000000001), // Frequency Control Word (Set to 1 for testing)
        .sawtooth(sawtooth),
        .square(square)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Toggle the clock every 5 time units
    end

    // Testbench stimulus
    initial begin
        clk = 0;
        rst = 0;

        // Apply reset
        rst = 1;
        #10 rst = 0;

        // Monitor and display the waveforms for 2000 time units
        $monitor("Time=%t, Sawtooth=%h, Square=%b", $time, sawtooth, square);
        #2000;
        $finish; // Finish the simulation
    end
endmodule