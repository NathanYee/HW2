// Adder circuit
`define AND and #50
`define OR or #50
`define XOR xor #50
`define NOT not #50

module behavioralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Your adder code here
    wire alltrue;
    `AND alltrue(alltrue, a, b, carryin);

    wire justone;
    `XOR justone(justone, a, b, carryin);

    // sum is true when a, b, cin are true or when exactly one is true
    `OR sumout(sum, alltrue, justone);

    // define all "AND" pairs of A, B, and Cin 
    wire ab;
    wire acin;
    wire bcin;
    `AND ab(ab, a, b);
    `AND acin(acin, a, carryin);
    `AND bcin(bcin, b, carryin);

    // cout is true when a, b, cin are true or when exactly two are true
    wire twotrue;
    `XOR twotrue(twotrue, ab, acin, bcin);

    `OR coutout(carryout, alltrue, twotrue);

endmodule
