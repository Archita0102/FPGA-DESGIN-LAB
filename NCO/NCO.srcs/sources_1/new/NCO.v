module NCO (
    input wire clk,               // Clock input (1 GHz)
    input wire rst,               // Reset input
    input wire [15:0] fcw,       // Frequency Control Word (16-bit)
    output wire [15:0] sawtooth, // Sawtooth waveform output (16-bit)
    output wire square           // Square waveform output (1-bit)
);

reg [15:0] phase_accumulator;    // 16-bit phase accumulator

assign square = phase_accumulator[15]; // MSB of phase accumulator for square wave

always @(posedge clk or posedge rst) begin
    if (rst) begin
        phase_accumulator <= 16'b0; // Reset phase accumulator
    end else begin
        // Increment phase accumulator using the FCW
        phase_accumulator <= phase_accumulator + fcw;
    end
end

assign sawtooth = phase_accumulator; // Sawtooth waveform is the phase accumulator

endmodule

