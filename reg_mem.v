module reg_mem(addr_1,addr_2,data_1,data_2, write_address, RegWrite, write_data );
    input [4:0] addr_1;
    input [4:0] addr_2;
    output reg [31:0] data_1;
    output reg [31:0] data_2;
    input [31:0] write_data;
    input RegWrite;
    input [4:0] write_address;


    initial begin
        global.Rmem[1]=10;
        global.Rmem[2]=0;
        global.Rmem[0]=0;


    end

    always @(write_data) begin
    if(RegWrite) begin
        global.Rmem[write_address] <= write_data ;
    end 
    end

    always@( addr_2 or addr_1) begin
        data_2 = global.Rmem[addr_2];
        data_1 = global.Rmem[addr_1];
    end

endmodule