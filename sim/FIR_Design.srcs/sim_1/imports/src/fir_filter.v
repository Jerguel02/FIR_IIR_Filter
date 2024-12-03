module fir_filter #(
    parameter N = 50,            // Số bậc của bộ lọc
    parameter WIDTH = 16         // Độ rộng dữ liệu
)(
    input clk,                   // Clock
    input reset,                 // Reset
    input signed [WIDTH-1:0] x,  // Tín hiệu đầu vào
    output reg signed [WIDTH-1:0] y // Tín hiệu đầu ra
);

    reg signed [WIDTH-1:0] coeff [0:N-1]; // Hệ số FIR
    reg signed [WIDTH-1:0] buffer [0:N-1]; // Bộ đệm tín hiệu

    integer i;

    initial begin
        // Load hệ số từ file coeff.txt
        $readmemb("coeff_fir.txt", coeff);
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            y <= 0;
            for (i = 0; i < N; i = i + 1) buffer[i] <= 0;
        end else begin
            // Cập nhật buffer
            buffer[0] <= x;
            for (i = 1; i < N; i = i + 1) buffer[i] <= buffer[i-1];

            // Tính toán đầu ra
            y <= 0;
            for (i = 0; i < N; i = i + 1) begin
                y <= y + buffer[i] * coeff[i];
            end
        end
    end
endmodule
