# HW02

Three binary devices are simulated using verilog. These devices are: a 4 to 1 multiplexer, a 2 bit decoder, and an adder with carryin. Each device is written in the hardware description language, Verilog, and are validated using generated truth tables and waveform gate propagation analysis. The truth tables allow us to see how the outputs eventually settle, which we can compare to known, expected, values. The waveform allows us to see the signal propagation, showing that our circuits are implemented with delays and could later be used to understand when the gates experience glitches in timing.

## Multiplexer

This 4 to 1 multiplexer allows the desired input to be selected using a combination of the two addresses, addr0 and addr1. Only one input can be selected at a time. 

![image alt text](/public/mhgOGMajsH98v7yyFdDp5Q_img_0.png)

The waveform clearly shows the output (out1) lag time of around .1 to .2 microseconds. This is entirely reasonable as the device was implemented with two layers of intermediate gates.

![image alt text](/public/mhgOGMajsH98v7yyFdDp5Q_img_1.png)

## Decoder

This is a 2 bit decoder with enable. When enabled, it decodes two binary inputs (addresses) into a single output. Otherwise, it will give outputs of zero.

![image alt text](/public/mhgOGMajsH98v7yyFdDp5Q_img_2.png)

The decoder's simulated waveform shows gate propagation delays between .1 and .2 for all the outputs (out0, out1, out2, out3).

![image alt text](/public/mhgOGMajsH98v7yyFdDp5Q_img_3.png)

The decoder's generated truth table verifies that our gate configurations works as the simulated outputs match the expected outputs.

## Adder

![image alt text](/public/mhgOGMajsH98v7yyFdDp5Q_img_4.png)

The generated truth table shows that our adder is behaving as expected. The expected outputs (Ecout, Esum) are identical to simulated outputs (cout, sum).

![image alt text](/public/mhgOGMajsH98v7yyFdDp5Q_img_5.png)

The adder's simulated waveform shows gate propagation delays between .1 and .2 microseconds for the output (carrryout). 

