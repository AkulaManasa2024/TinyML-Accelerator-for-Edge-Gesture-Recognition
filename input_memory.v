module input_memory(
    input clk,
    input we,
    input [3:0] addr,
    input [7:0] data_in,
    output reg [7:0] data_out
);

reg [7:0] memory [0:15];

always @(posedge clk)
begin

    if(we)
        memory[addr] <= data_in;

    data_out <= memory[addr];

end

endmodule
