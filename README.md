# Sequence_Detector_Moore_0011
A Sequence Detector using Moore state machine is implemented using Verilog. the sequence to be detected is 0011.

This code implements a clock frequency divider module and a Moore state machine for detecting the sequence "0011". The frequency divider module divides the input clock frequency of 100 MHz to 1 Hz frequency. The Moore state machine takes the output of the frequency divider module as the clock input and takes a 1-bit input "w" and active low reset signal "Resetn". The output "z" is 1 if the sequence "0011" is detected; otherwise, it is 0.

The code has two modules: Frequency_Divider and top_Seq_Det_Moore_0011.

# Frequency_Divider
The Frequency_Divider module takes an input clock signal "clock_in" and generates an output clock signal "clock_out" with a lower frequency of 1 Hz. The module has an internal counter "count" that counts the number of clock cycles of the input clock signal. When the count reaches a specific value, the output clock is toggled, and the count is reset to zero. The value of the count is set to 50000000, which corresponds to a frequency division factor of 100 million (input clock frequency) divided by 50 million (output clock frequency).

# top_Seq_Det_Moore_0011
The top_Seq_Det_Moore_0011 module takes an input clock signal "Clock", a reset signal "Resetn", and a 1-bit input "w". It generates an output "z" which is 1 if the sequence "0011" is detected; otherwise, it is 0. The module has five states: A, B, C, D, and E, with state transitions based on the input "w". The output "z" is determined by the current state of the machine.

The module has an instance of the Frequency_Divider module to generate a lower frequency clock signal for the state machine. The state machine logic uses the input "w" and the current state "y" to determine the next state "Y". The output "z" is determined by the current state "y", which is assigned the value "E" when the sequence "0011" is detected.

The state machine has an active low reset signal "Resetn". When the reset signal is asserted, the state machine is reset to the initial state "A". When the reset signal is deasserted, the state machine operates based on the input "w" and the clock signal generated by the frequency divider module.

Overall, this code demonstrates the implementation of a clock frequency divider and a Moore state machine for sequence detection using Verilog HDL.
