// shift register
// shift_register.v
// author: Bian Paraguya
// date: 8/4/2024
// version 1
// tested

module shift_register (
    input clk,
    input nrst,
    input data_in,
    input en,
    input dir,
    output reg [4:0] sreg
);

always @(posedge clk or negedge nrst) begin
    if (!nrst)
        sreg <= 5'b00000;
    else if (en) begin
        if (dir)
            sreg <= (sreg >> 1) | (data_in << 4);
        else
            sreg <= (sreg << 1) | data_in;
    end
end

endmodule
