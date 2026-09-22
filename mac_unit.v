module mac_unit(
    input [7:0] pixel,
    input [7:0] weight,
    input [1:0] mode,
    output reg [15:0] result
);

always @(*)
begin

    case(mode)

        // 1-bit precision
        2'b00:
            result = pixel[0] * weight[0];

        // 4-bit precision
        2'b01:
            result = pixel[3:0] * weight[3:0];

        // 8-bit precision
        2'b10:
            result = pixel * weight;

        // Default
        default:
            result = pixel * weight;

    endcase

end

endmodule
