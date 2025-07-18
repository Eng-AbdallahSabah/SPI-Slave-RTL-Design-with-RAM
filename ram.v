module RAM(
input clk,
input rst_n,
output reg [7:0] dout,
output reg tx_valid,
input[9:0] din,
input rx_valid
);

parameter MEM_DEPTH = 256;
parameter ADDR_SIZE = 8;

reg [7:0] mem[MEM_DEPTH-1:0];
reg [ADDR_SIZE-1:0] data;
  
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        dout<=0;
        tx_valid<=0;
    end
     else begin
        if (din[9:8] == 2'b00) begin // Hold Write Address
            if (rx_valid) begin
                data <= din[7:0];
                tx_valid <= 0;
            end
        end else if (din[9:8] == 2'b01) begin // Write Operation
            if (rx_valid) begin
                mem[data] <= din[7:0];
                tx_valid <= 0;
            end
        end else if (din[9:8] == 2'b10) begin // Hold Read Address
            if (rx_valid) begin
                data <= din[7:0];
                tx_valid <= 0;
            end
        end else if (din[9:8] == 2'b11) begin // Read Operation
            if (rx_valid) begin
                dout <= mem[data];
                tx_valid<= 1;
            end 
        end
    end
end
endmodule