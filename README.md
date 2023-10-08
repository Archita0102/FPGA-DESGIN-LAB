# FPGA-DESGIN-LAB
This repository consists of all my programs made during FPGA lab course

1. Here counter and PN sequence generator is made by using D Flip Flop. 
2. Sequence detector is made using PN sequence generator.
3. A numerically controlled oscillator (NCO) is a sequential circuit that generates a waveform with a desired frequency/duty cycle
   
   a. You will implement NCOs that has a 16-bit phase accumulator and has a 16-bit output
        i The input (Frequency Control Word/FCW) controls the desired frequency and is to be viewed as an 16-bit integer
        ii The output can be viewed as a 16-bit integer (in practice, this would be fed to a DAC)
   
   b You must generate the following waveforms:
        i Sawtooth wave (16-bit) with frequency (approx) 15.259kHz, 2MHz, 30MHz, 200MHz
        ii Square wave (1-bit) with frequency (approx) 15.259kHz, 2MHz, 30MHz, 200MHz
        iii Assume clock frequency of 1GHz
        iv Use only the modules you have implemented thus far (and basic logic gates)
