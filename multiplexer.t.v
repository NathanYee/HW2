// Multiplexer testbench
`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();
  reg addr0, addr1;
  reg in0, in1, in2, in3;
  wire out;

  // behavioralMultiplexer multiplexer (out,addr0,addr1,in0,in1,in2,in3);
  structuralMultiplexer multiplexer (out,addr0,addr1,in0,in1,in2,in3); // Swap after testing

  initial begin
  $dumpfile("multiplexer.vcd");
  $dumpvars();
  $display("addr0 addr1 in0 in1 in2 in3 | out | Eout");
  addr0=0;addr1=0;in0=0;in1=0;in2=0;in3=0; #1000 
  $display("    %b     %b   %b   %b   %b   %b |   %b | 0", addr0,addr1,in0,in1,in2,in3,out);
  addr0=0;addr1=0;in0=1;in1=0;in2=0;in3=0; #1000 
  $display("    %b     %b   %b   %b   %b   %b |   %b | 1", addr0,addr1,in0,in1,in2,in3,out);
  addr0=1;addr1=0;in0=0;in1=0;in2=0;in3=0; #1000 
  $display("    %b     %b   %b   %b   %b   %b |   %b | 0", addr0,addr1,in0,in1,in2,in3,out);
  addr0=1;addr1=0;in0=0;in1=1;in2=0;in3=0; #1000 
  $display("    %b     %b   %b   %b   %b   %b |   %b | 1", addr0,addr1,in0,in1,in2,in3,out);
  addr0=0;addr1=1;in0=0;in1=0;in2=0;in3=0; #1000 
  $display("    %b     %b   %b   %b   %b   %b |   %b | 0", addr0,addr1,in0,in1,in2,in3,out);
  addr0=0;addr1=1;in0=0;in1=0;in2=1;in3=0; #1000 
  $display("    %b     %b   %b   %b   %b   %b |   %b | 1", addr0,addr1,in0,in1,in2,in3,out);
  addr0=1;addr1=1;in0=0;in1=0;in2=0;in3=0; #1000 
  $display("    %b     %b   %b   %b   %b   %b |   %b | 0", addr0,addr1,in0,in1,in2,in3,out);
  addr0=1;addr1=1;in0=0;in1=0;in2=0;in3=1; #1000 
  $display("    %b     %b   %b   %b   %b   %b |   %b | 1", addr0,addr1,in0,in1,in2,in3,out);
  $finish();
  end



endmodule
