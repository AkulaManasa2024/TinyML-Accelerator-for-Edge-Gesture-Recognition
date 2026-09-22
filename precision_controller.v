module precision_controller(
    input [1:0] mode,
    output reg [7:0] precision
);

always @(*)
begin
    case(mode)

        2'b00: precision = 1;
        2'b01: precision = 4;
        2'b10: precision = 8;

        default: precision = 8;

    endcase
end

endmodule
