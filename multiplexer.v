// Multiplexer circuit

`define AND and #50
`define OR or #50
`define NOT not #50

module behavioralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // Join single-bit inputs into a bus, use address as index
    wire[3:0] inputs = {in3, in2, in1, in0};
    wire[1:0] address = {address1, address0};
    assign out = inputs[address];
endmodule


module structuralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // wire and compute intermediate inversions
    wire naddress0;
    wire naddress1;
    `NOT a0Inv(naddress0, address0);
    `NOT a1Inv(naddress1, address1);

    // use triple "AND" gates to wire the appropriate signed addresses with corresponding
    // inputs
    wire in0and;
    wire in1and;
    wire in2and;
    wire in3and;
    `AND in0and(in0and, in0, naddress0, naddress1);
    `AND in1and(in1and, in1, address0, naddress1);
    `AND in2and(in2and, in2, naddress0, address1);
    `AND in3and(in3and, in3, address0, address1);

    // see if any of the intermediate "AND gates are true. Only one of the "AND" gates 
    // can be true, due to the full permutations of the addresses.
    `OR outgate(out, in0and, in1and, in2and, in3and);

endmodule

