// Decoder circuit
`define AND and #50
`define OR or #50
`define NOT not #50

module behavioralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    // Uses concatenation and shift operators
    assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule


module structuralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    // Wire Inversions
    wire naddress0;
    wire naddress1;
    `NOT a0Inv(naddress0, address0);
    `NOT a1Inv(naddress1, address1);

    // Wire the appropriate address gates and the enable using a 3 input "AND" gate
    `AND out0gate(out0, naddress0, naddress1, enable);
    `AND out1gate(out1, address0, naddress1, enable);
    `AND out2gate(out2, naddress0, address1, enable);
    `AND out3gate(out3, address0, address1, enable);


endmodule

