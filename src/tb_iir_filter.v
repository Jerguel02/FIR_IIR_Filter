module tb_iir_filter;

    reg clk;
    reg reset;
    reg signed [15:0] x;    
    wire signed [15:0] y;      

    // Clock 10ns (100MHz)
    initial clk = 0;
    always #5 clk = ~clk;

    iir_filter dut (
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y)
    );

    initial begin

        reset = 1;
        #20;
        reset = 0;


        x = 16'd0;    #10;
        x = 16'd100;  #10;
        x = 16'd150;   #10;
        x = 16'd200; #10;


        #100 $stop;
    end
endmodule
