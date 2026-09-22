module cnn_accelerator(
    input clk,
    input [1:0] mode,
    input [7:0] pixel,
    input [7:0] weight,
    output reg [15:0] final_output
);

wire [7:0] precision;
reg [3:0] addr = 0;
wire [7:0] mem_out;
wire [71:0] window;
wire [15:0] mac_result;
wire [15:0] relu_result;
wire [15:0] pool_result;

reg [7:0] pixel_reg;
reg [15:0] mac_reg;
reg [15:0] relu_reg;

// Address counter
always @(posedge clk)
    addr <= addr + 1;

// Precision controller
precision_controller pc(
    .mode(mode),
    .precision(precision)
);

// Input memory
input_memory mem(
    .clk(clk),
    .we(1'b1),
    .addr(addr),
    .data_in(pixel),
    .data_out(mem_out)
);

// Register memory output
always @(posedge clk)
    pixel_reg <= mem_out;

// Window generator
window_generator wg(
    .p0(pixel_reg),
    .p1(pixel_reg),
    .p2(pixel_reg),
    .p3(pixel_reg),
    .p4(pixel_reg),
    .p5(pixel_reg),
    .p6(pixel_reg),
    .p7(pixel_reg),
    .p8(pixel_reg),
    .window(window)
);

// MAC unit
mac_unit mac(
    .pixel(window[7:0]),
    .weight(weight),
    .mode(mode),
    .result(mac_result)
);

// MAC register
always @(posedge clk)
    mac_reg <= mac_result;

// ReLU
relu r1(
    .data_in(mac_reg),
    .data_out(relu_result)
);

// ReLU register
always @(posedge clk)
    relu_reg <= relu_result;

// Max pooling
pooling pool(
    .a(relu_reg),
    .b(relu_reg + 1),
    .c(relu_reg + 2),
    .d(relu_reg + 3),
    .max_out(pool_result)
);

// Final output
always @(posedge clk)
    final_output <= pool_result;

endmodule
