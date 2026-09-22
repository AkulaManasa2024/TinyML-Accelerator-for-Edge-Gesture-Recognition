module pooling(
    input [15:0] a,
    input [15:0] b,
    input [15:0] c,
    input [15:0] d,

    output reg [15:0] max_out
);

always @(*)
begin

    max_out = a;

    if(b > max_out)
        max_out = b;

    if(c > max_out)
        max_out = c;

    if(d > max_out)
        max_out = d;

end

endmodule
