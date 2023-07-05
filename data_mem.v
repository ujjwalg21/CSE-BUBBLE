
module data_mem (address_d ,write_data,read_data,memwrite,memread);
input [31:0]address_d;
input [31:0] write_data;
input memwrite,memread;

output reg [31:0] read_data;


initial begin
  global.Dmem[0]= 32'd25;
  global.Dmem[1]= 32'd17;
  global.Dmem[2]= 32'd20;
  global.Dmem[3]= 32'd78;
  global.Dmem[4]= 32'd10;
  global.Dmem[5]= 32'd63;
  global.Dmem[6]= 32'd100;
  global.Dmem[7]= 32'd39;
  global.Dmem[8]= 32'd113;
  global.Dmem[9]= 32'd13;
end

always @(address_d)begin 
       if(memwrite) begin
            global.Dmem[address_d]= write_data;
        end

        if(memread) begin
            read_data = global.Dmem[address_d];
        end
end

endmodule