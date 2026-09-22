`timescale 1ns/1ps

module cnn_accelerator_tb;

reg clk;
reg [1:0] mode;
reg [7:0] pixel;
reg [7:0] weight;

wire [15:0] final_output;

// Instantiate CNN accelerator
cnn_accelerator uut(
    .clk(clk),
    .mode(mode),
    .pixel(pixel),
    .weight(weight),
    .final_output(final_output)
);

// Clock generation
initial begin
    clk = 0;

    forever
        #5 clk = ~clk;
end

integer i;

// Test cases
initial begin

    mode = 0;
    pixel = 0;
    weight = 0;

    #20;

    for(i = 0; i < 10000; i = i + 1)
    begin

        mode   = $random % 4;
        pixel  = $random;
        weight = $random;

        #10;

    end

    $display("Completed %0d test cases", i);

    $finish;

end

endmodule
