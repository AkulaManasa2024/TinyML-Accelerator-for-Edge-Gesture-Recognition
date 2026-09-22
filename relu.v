module relu(
    input signed [15:0] data_in,
    output reg [15:0] data_out
);

always @(*)
begin

    if(data_in < 0)
        data_out = 0;
    else
        data_out = data_in;

end

endmodule
