





module ALU(
    input [31:0] operand1,
    input [31:0] operand2,
    input [5:0] opcode,
    output reg [31:0] result,
    output reg zero
);

always @(opcode or operand1 or operand2) begin
    case(opcode)
        6'd1,6'd5,6'd13,6'd14: result <= operand1 + operand2; 
        6'd2: result <= operand1 - operand2; 
        6'd15: zero <= (operand1==operand2);
        6'd19: zero <= operand1<operand2?1:0;
        6'd3 : result<=operand1+operand2;
        6'd4 : result<=operand1-operand2;
        6'd6 : result<=operand1+operand2;
        6'd7: result<=operand1&operand2;
        6'd8 : result<=operand1|operand2;
        6'd9 : result<=operand1&operand2;
        6'd10 : result<=operand1|operand2;
        6'd11 : result<=operand1<<operand2;
        6'd12 : result<=operand1>>operand2;
        6'd16 : result<=(operand1==operand2 ? 32'd1:32'd0);
        6'd17 : result<=(operand1<=operand2  ? 32'd1:32'd0);
        6'd18 : result<=(operand1<operand2  ? 32'd1:32'd0);
        6'd20 : result<=(operand1>operand2 ? 32'd1:32'd0);
        6'd24 : result<=(operand1<operand2 ? 32'd1:32'd0);
        6'd25 : result<=(operand1<operand2 ? 32'd1:32'd0);

    endcase
end



endmodule