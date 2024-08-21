// shift register testbench
// shift_register_tb.v
// author: Bian Paraguya
// date: 8/4/2024
// version 1
// tested

module shift_register_tb;

reg clk;
reg nrst;
reg data_in;
reg en;
reg dir;
wire [4:0] sreg;

shift_register srt (
    .clk(clk),
    .nrst(nrst),
    .data_in(data_in),
    .en(en),
    .dir(dir),
    .sreg(sreg)
);

always #5 clk = !clk;

initial begin
    clk = 0;
    nrst = 0;
    data_in = 0;
    en = 1;
    dir = 0;

    #15 nrst = 1;
    #40 data_in = 1;
    #40 data_in = 1;
    #40 data_in = 1;
    #40 data_in = 1;
    #40 data_in = 1;

    #50 en = 1;
    data_in = 0;
    dir = 1;
    #50 en = 0;
    dir = 1;
    #50 en = 1;
    dir = 1;

    $finish;
end

always @(negedge clk) begin
    $display("nrst: %b | data_in: %b | en: %b | dir: %b | sreg: %b", nrst, data_in, en, dir, sreg);
end

endmodule
