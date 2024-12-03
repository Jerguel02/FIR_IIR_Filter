module tb_fir_filter;

    reg clk;
    reg reset;
    reg signed [15:0] x;       // Tín hiệu đầu vào
    wire signed [15:0] y;      // Tín hiệu đầu ra

    // Clock 10ns (100MHz)
    initial clk = 0;
    always #5 clk = ~clk;

    fir_filter dut (
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y)
    );

    initial begin
        // Reset hệ thống
        reset = 1;
        #20;
        reset = 0;

        // Cấp tín hiệu đầu vào
        x = 16'd0;    #10;
        x = 16'd100;  #10;
        x = 16'd50;   #10;
        x = 16'd100; #10;

        // Kết thúc mô phỏng
        #100 $stop;
    end
endmodule
