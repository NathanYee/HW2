all: decoder.t adder.t multiplexer.t
	make decoder
	make adder
	make multiplexer

decoder: decoder.t
	./decoder.t
decoder.t: decoder.t.v decoder.v
	iverilog -o decoder.t decoder.t.v


adder: adder.t
	./adder.t
adder.t: adder.t.v adder.v
	iverilog -o adder.t adder.t.v


multiplexer: multiplexer.t
	./multiplexer.t
multiplexer.t: multiplexer.t.v multiplexer.v
	iverilog -o multiplexer.t multiplexer.t.v
