module control_unit (opcode,RegDst,jump,branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite);
    input [5:0] opcode;
    output reg RegDst,jump,branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite;
    
    always @(opcode)begin
  case(opcode)
  6'd1,6'd2:begin       //add and sub
    RegDst<=1'b1;
    jump<=1'b0;
    branch<=1'b0;
    MemRead<=1'b0;
    MemtoReg<=1'b0;
    MemWrite<=1'b0;
    ALUSrc<=1'b0;
    RegWrite<=1'b1;

  end
  6'd13:begin            // load word
    RegDst<=1'b0;
    jump<=1'b0;
    branch<=1'b0;
    MemRead<=1'b1;
    MemtoReg<=1'b1;
    MemWrite<=1'b0;
    ALUSrc<=1'b1;
    RegWrite<=1'b1;

  end 
  6'd5:begin            // addi
    RegDst<=1'b0;
    jump<=1'b0;
    branch<=1'b0;
    MemRead<=1'b0;
    MemtoReg<=1'b0;
    MemWrite<=1'b0;
    ALUSrc<=1'b1;
    RegWrite<=1'b1;

  end 
  6'd14:begin          // store word
    RegDst<=1'b0;
    jump<=1'b0;
    branch<=1'b0;
    MemRead<=1'b0;
    MemtoReg<=1'b0;
    MemWrite<=1'b1;
    ALUSrc<=1'b1;
    RegWrite<=1'b0;

  end 
  6'd15:begin          // branch equal
    RegDst<=1'b0;
    jump<=1'b0;
    branch<=1'b1;
    MemRead<=1'b0;
    MemtoReg<=1'b0;
    MemWrite<=1'b0;
    ALUSrc<=1'b0;
    RegWrite<=1'b0;

  end   
  6'd21:begin          // jump
    RegDst<=1'b0;
    jump<=1'b1;
    branch<=1'b0;
    MemRead<=1'b0;
    MemtoReg<=1'b0;
    MemWrite<=1'b0;
    ALUSrc<=1'b0;
    RegWrite<=1'b0;

  end 
  6'd19:begin          // branch less than
    RegDst<=1'b0;
    jump<=1'b0;
    branch<=1'b1;
    MemRead<=1'b0;
    MemtoReg<=1'b0;
    MemWrite<=1'b0;
    ALUSrc<=1'b0;
    RegWrite<=1'b0;

  end     
  6'd3 : begin
      RegDst<=1'b1;
      RegWrite<=1'b1;
      ALUSrc<=1'b0;
      MemRead<=1'b0;
      MemWrite<=1'b0;
      MemtoReg<=1'b0;
      branch<=1'b0;
      jump<=1'b0;
  end
  6'd4 : begin
      RegDst<=1'b1;
      RegWrite<=1'b1;
      ALUSrc<=1'b0;
      MemRead<=1'b0;
      MemWrite<=1'b0;
      MemtoReg<=1'b0;
      branch<=1'b0;
      jump<=1'b0;
  end

  6'd6 : begin
      RegDst<=1'b0;
      RegWrite<=1'b1;
      ALUSrc<=1'b0;
      MemRead<=1'b0;
      MemWrite<=1'b0;
      MemtoReg<=1'b0;
      branch<=1'b0;
      jump<=1'b0;
  end
  6'd7 : begin
      RegDst<=1'b1;
      RegWrite<=1'b1;
      ALUSrc<=1'b0;
      MemRead<=1'b0;
      MemWrite<=1'b0;
      MemtoReg<=1'b0;
      branch<=1'b0;
      jump<=1'b0;
  end
  6'd8 : begin
      RegDst<=1'b1;
      RegWrite<=1'b1;
      ALUSrc<=1'b0;
      MemRead<=1'b0;
      MemWrite<=1'b0;
      MemtoReg<=1'b0;
      branch<=1'b0;
      jump<=1'b0;
  end
  6'd9 : begin
      RegDst<=1'b0;
      RegWrite<=1'b1;
      ALUSrc<=1'b1;
      MemRead<=1'b0;
      MemWrite<=1'b0;
      MemtoReg<=1'b0;
      branch<=1'b0;
      jump<=1'b0;
  end
  6'd10 : begin
      RegDst<=1'b0;
      RegWrite<=1'b1;
      ALUSrc<=1'b1;
      MemRead<=1'b0;
      MemWrite<=1'b0;
      MemtoReg<=1'b0;
      branch<=1'b0;
      jump<=1'b0;
  end
  6'd11 : begin
      RegDst<=1'b0;
      RegWrite<=1'b1;
      ALUSrc<=1'b1;
      MemRead<=1'b0;
      MemWrite<=1'b0;
      MemtoReg<=1'b0;
      branch<=1'b0;
      jump<=1'b0;
  end
  6'd12 : begin
      RegDst<=1'b0;
      RegWrite<=1'b1;
      ALUSrc<=1'b1;
      MemRead<=1'b0;
      MemWrite<=1'b0;
      MemtoReg<=1'b0;
      branch<=1'b0;
      jump<=1'b0;
  end

  6'd16 : begin
      RegDst<=1'b1;
      RegWrite<=1'b0;
      ALUSrc<=1'b0;
      MemRead<=1'b0;
      MemWrite<=1'b0;
      MemtoReg<=1'b0;
      branch<=1'b1;
      jump<=1'b0;
  end
  6'd17 : begin
      RegDst<=1'b1;
      RegWrite<=1'b0;
      ALUSrc<=1'b0;
      MemRead<=1'b0;
      MemWrite<=1'b0;
      MemtoReg<=1'b1;
      branch<=1'b1;
      jump<=1'b0;
  end
  6'd18 : begin
      RegDst<=1'b1;
      RegWrite<=1'b0;
      ALUSrc<=1'b0;
      MemRead<=1'b0;
      MemWrite<=1'b0;
      MemtoReg<=1'b1;
      branch<=1'b1;
      jump<=1'b0;
  end
  
  6'd20 : begin
      RegDst<=1'b1;
      RegWrite<=1'b0;
      ALUSrc<=1'b0;
      MemRead<=1'b0;
      MemWrite<=1'b0;
      MemtoReg<=1'b1;
      branch<=1'b1;
      jump<=1'b0;
  end

  6'd22 : begin
      RegDst<=1'b0;
      RegWrite<=1'b0;
      ALUSrc<=1'b0;
      MemRead<=1'b0;
      MemWrite<=1'b0;
      MemtoReg<=1'b1;
      branch<=1'b0;
      jump<=1'b1;
  end
  6'd23 : begin
      RegDst<=1'b0;
      RegWrite<=1'b0;
      ALUSrc<=1'b0;
      MemRead<=1'b0;
      MemWrite<=1'b0;
      MemtoReg<=1'b1;
      branch<=1'b0;
      jump<=1'b1;
  end
  6'd24 : begin
      RegDst<=1'b1;
      RegWrite<=1'b1;
      ALUSrc<=1'b0;
      MemRead<=1'b0;
      MemWrite<=1'b0;
      MemtoReg<=1'b0;
      branch<=1'b0;
      jump<=1'b0;
  end
  6'd25 : begin
      RegDst<=1'b0;
      RegWrite<=1'b1;
      ALUSrc<=1'b1;
      MemRead<=1'b0;
      MemWrite<=1'b0;
      MemtoReg<=1'b0;
      branch<=1'b0;
      jump<=1'b0;
  end  

  
  endcase
end


endmodule