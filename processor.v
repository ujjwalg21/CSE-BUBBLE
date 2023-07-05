
`include "veda_memory.v"
`include "data_mem.v"
`include "ALU.v"
`include "control_unit.v"
`include "reg_mem.v"


module global;
reg [25:0] PC; 
reg [31:0] Imem [0:31]; 
reg [31:0] Rmem[0:31];
reg [31:0] Dmem[0:31];
endmodule
module processor();
    
    wire [31:0] IR  ;
    wire [31:0] r1, r2, alu_result, write_data;
    reg [25:0] jump_addr, branch_addr;
    wire RegDst, jump,branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;  
    wire zero, and_branch;  
    wire [25:0] pc,b_out;

    
    veda_memory v1(clk,0, 0, 0, 1, IR );
    always @(IR) begin
        jump_addr <= IR[25:0];
        branch_addr <={ 10'b0,IR[15:0]};
    end

    control_unit c(IR[31:26],RegDst,jump,branch,MemRead, MemtoReg , MemWrite ,ALUSrc, RegWrite);
    reg_mem r(IR[25:21], IR[20:16], r1 , r2 ,WriteReg, RegWrite , write_data);
    
    wire [31:0] immediate_32 ={16'd0, IR[15:0]};

    wire[31:0] rd2 ;
    multiplexer_32 m1(r2,immediate_32,ALUSrc,rd2);


    ALU f8(r1, rd2 , IR[31:26] , alu_result ,zero);
    wire [4:0] WriteReg; 
    multiplexer_5 m2(IR[20:16],IR[15:11],RegDst , WriteReg); 

    and a1 (and_branch,branch,zero);
    multiplexer_26 m3(global.PC ,branch_addr, and_branch, b_out );
    multiplexer_26 m4(b_out , jump_addr, jump ,pc);
    always @(pc) begin
       global.PC <= pc; 
    end 

    wire [31:0]mux_in1 ;
    data_mem d1(alu_result,r2,mux_in1,MemWrite,MemRead);

    multiplexer_32 m5(alu_result, mux_in1 ,MemtoReg, write_data);

endmodule

module multiplexer_5 (a,b,S,out);
    input [4:0]a,b;
    input S;
    output reg[4:0]out ;
    always @(*) begin
        case(S)
      0: out = a;
      1: out = b;
    endcase
    end


endmodule


module multiplexer_26 (a,b,S,out);
    input [25:0]a,b;
    input S;
    output reg[25:0]out ;
    always @(*) begin
        case(S)
      0: out = a;
      1: out = b;
    endcase
    end


endmodule

module multiplexer_32 (a,b,S,out);
    input [31:0]a,b;
    input S;
    output reg[31:0]out ;
    always @(*) begin
        case(S)
      0: out <= a;
      1: out <= b;
    endcase
    end
endmodule

module tb_processor;
processor uut();

initial global.PC = 0;

always #4 global.PC = global.PC + 26'd1;

initial $monitor(global.Dmem[0],global.Dmem[1],global.Dmem[2],global.Dmem[3],global.Dmem[4],global.Dmem[5],global.Dmem[6],global.Dmem[7],global.Dmem[8],global.Dmem[9]);


initial #1500 $finish;




    
endmodule

