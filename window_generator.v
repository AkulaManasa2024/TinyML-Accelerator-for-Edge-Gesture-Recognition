module window_generator(
    input [7:0] p0,
    input [7:0] p1,
    input [7:0] p2,
    input [7:0] p3,
    input [7:0] p4,
    input [7:0] p5,
    input [7:0] p6,
    input [7:0] p7,
    input [7:0] p8,

    output [71:0] window
);

assign window = {
    p0,
    p1,
    p2,
    p3,
    p4,
    p5,
    p6,
    p7,
    p8
};

endmodule
