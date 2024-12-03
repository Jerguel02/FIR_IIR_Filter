module iir_filter (
    input clk,
    input rst,
    input signed [15:0] x,    // Tín hiệu đầu vào
    output reg signed [15:0] y // Tín hiệu đầu ra
);

    // Hệ số a và b
    reg signed [15:0] b[0:2]; // Hệ số feedforward
    reg signed [15:0] a[1:2]; // Hệ số feedback

    // Bộ nhớ tín hiệu
    reg signed [15:0] x_mem[0:2];
    reg signed [15:0] y_mem[1:2];

    integer i;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            y <= 0;
            for (i = 0; i < 3; i = i + 1) x_mem[i] <= 0;
            for (i = 1; i < 3; i = i + 1) y_mem[i] <= 0;
        end else begin
            // Dịch tín hiệu trong bộ nhớ
            for (i = 2; i > 0; i = i - 1) begin
                x_mem[i] <= x_mem[i-1];
                y_mem[i] <= y_mem[i-1];
            end
            x_mem[0] <= x;

            // Tính tín hiệu đầu ra
            y <= b[0]*x_mem[0] + b[1]*x_mem[1] + b[2]*x_mem[2]
                 - a[1]*y_mem[1] - a[2]*y_mem[2];
            y_mem[0] <= y;
        end
    end
endmodule
