module fir_filter #(
    parameter N = 50,            
    parameter WIDTH = 16         
)(
    input clk,                   
    input reset,                 
    input signed [WIDTH-1:0] x,  
    output reg signed [WIDTH-1:0] y 
);

    reg signed [WIDTH-1:0] coeff [0:N-1]; 
    reg signed [WIDTH-1:0] buffer [0:N-1]; 
    reg signed [2*WIDTH-1:0] acc; 

    integer i;

    initial begin
        $readmemb("coeff_fir.txt", coeff);
    end

always @(posedge clk or posedge reset) begin
    if (reset) begin
        y <= 0;
        acc <= 0;
        for (i = 0; i < N; i = i + 1) begin
            buffer[i] <= 0;
        end
    end else begin
        buffer[0] <= x;
        for (i = 1; i < N; i = i + 1) begin
            $display("i = %d, buffer[%d] = %d", i, i, buffer[i]);
            buffer[i] <= buffer[i-1];
        end

        acc = 0;
        for (i = 0; i < N; i = i + 1) begin
            acc = acc + buffer[i] * coeff[i];
        end
        y <= acc[WIDTH-1:0]; 


        $display("At time %t: x = %d, y = %d, acc = %d", $time, x, y, acc);
    end
end

endmodule
