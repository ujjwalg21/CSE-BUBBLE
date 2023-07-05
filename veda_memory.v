module veda_memory (clk,reset,d_in,write_en,mode,d_out);
    input clk,reset;
    input mode;
    input [31:0] d_in;
    input write_en;
    output reg [31:0] d_out;

    integer i;
    always @(global.PC) begin
         if(reset) begin
            for (i = 0; i < 32; i = i + 1) begin 
                global.Imem[i] <= 0;
            end
        end

        else if (mode == 0 && write_en) begin
            global.Imem[global.PC]<= d_in;
            d_out<=d_in;  
        end 
        else if (mode == 1) begin
            d_out <= global.Imem[global.PC];
        end
    end

    initial begin
    global.Imem[0] = {6'd15,5'd1,5'd2,16'd14};    
    global.Imem[1] = {6'd5,5'd2,5'd3,16'd1 };
    global.Imem[2] = {6'd15,5'd1,5'd3,16'd12};   
    global.Imem[3] = {6'd1,5'd0,5'd2,5'd4,11'd0};
    global.Imem[4] = {6'd13,5'd4,5'd6,16'd0 };
    global.Imem[5] = {6'd1,5'd0,5'd3,5'd5,11'd0};
    global.Imem[6] = {6'd13,5'd5,5'd7,16'd0 };
    global.Imem[7] = {6'd19,5'd6,5'd7,16'd10 };
    global.Imem[8] = {6'd14,5'd4,5'd7,16'd0 };
    global.Imem[9] = {6'd14,5'd5,5'd6,16'd0 };
    global.Imem[10] = {6'd5,5'd3,5'd3,16'd1 };
    global.Imem[11] = {6'd21,26'd2 };
    global.Imem[12] = {6'd5,5'd2,5'd2,16'd1 };
    global.Imem[13] = {6'd21,26'd0}; 
    
    end

endmodule

