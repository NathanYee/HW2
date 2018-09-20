run: decoder.t
	./decoder.t
decoder.t: decoder.t.v decoder.v
	iverilog -o decoder.t decoder.t.v
