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
    // compute inversions
    wire naddress0;
    wire naddress1;
    not a0Inv(naddress0, address0);
    not a1Inv(naddress1, address1);

    // compute partial and gates
    wire na0na1;
    wire a0na1;
    wire na0a1;
    wire a0a1;
    and na0na1(na0na1, naddress0, naddress1);
    and a0na1(a0na1, address0, naddress1);
    and na0a1(na0a1, naddress0, address1);
    and a0a1(a0a1, address0, address1);

    // compute ands with inputs
    wire in0and;
    wire in1and;
    wire in2and;
    wire in3and;
    and in0and(in0and, in0, na0na1);
    and in1and(in1and, in1, a0na1);
    and in2and(in2and, in2, na0a1);
    and in3and(in3and, in3, a0a1);

    wire or1;
    wire or2;
    or or1(or1, in0and, in1and);
    or or2(or2, in2and, in3and);

    or outgate(out, or1, or2);

endmodule

