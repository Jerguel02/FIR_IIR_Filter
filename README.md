# Ghi chú thiết kế FIR/IIR Filter

## 1. Mô tả hệ thống

**FIR**

- Loại bộ lọc: Thông thấp (Low-pass)
- Tần số cắt: 100 Hz
- Tần số lấy mẫu: 1 kHz
- Bậc: 50

## 2. Công nghệ sử dụng

- **MATLAB**: Thiết kế và phân tích tín hiệu.
- **Verilog**: Mô tả phần cứng bộ lọc.
- **Vivado**: Mô phỏng và kiểm tra.
- **GOWIN**: Nạp vào FPGA.

## 3. Quy trình thiết kế

1. Tính toán hệ số FIR/IIR trong MATLAB.
2. Triển khai FIR/IIR trên FPGA TangNano9k bằng Verilog.
3. Mô phỏng tín hiệu đầu vào/đầu ra.
4. Đánh giá hiệu năng hệ thống.
