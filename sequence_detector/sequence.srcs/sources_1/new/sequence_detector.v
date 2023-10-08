`timescale 1ns / 1ps

module sequence_detector(

input clk,rst,din,

output reg dout);



   parameter s0 = 2'b00;

   parameter s1 = 2'b01;

   parameter s2 = 2'b10;

   parameter s3 = 2'b11;



   reg [2:0] state = 0;



   always @(posedge clk)

   begin

      if (rst) begin

         state <= s0;

         dout <= 0;

      end

      else

      begin

         case (state)

            s0 : begin

               if (din)

               begin

                  dout <= 0;

                  state <= s1;

               end

               else begin

                  dout <= 0;

                  state <= s0;

               end

            end

            s1 : begin

               if (din)

               begin

                  dout <= 0;

                  state <= s1;

               end

               else

               begin

                  dout <= 0;

                  state <= s2;

               end

            end

            s2 : begin

               if (din)

               begin

                  dout <= 0;

                  state <= s1;

               end

               else

               begin

                  dout <= 0;

                  state <= s3;

               end

            end

            s3 : begin

               if (din)

               begin

                  dout <= 1;

                  state <= s1;

               end

               else

               begin

                  dout <= 0;

                  state <= s0;

               end

            end

            default : begin

               state <= s0;

            end

         endcase

      end

   end

endmodule