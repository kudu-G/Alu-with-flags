module Alu(
    input clk,
    input [7:0] A ,B,
    input [3:0] ALU_FUN,
    output reg [7:0] ALU_OUT,
    output reg Arith_Flag,Logic_Flag,CMP_Flag,Shift_Flag
);
always@(*)begin
    Arith_Flag=0;
    Logic_Flag=0;
    CMP_Flag=0;
    Shift_Flag=0;
    case(ALU_FUN)
        4'b0000:begin
             ALU_OUT=A+B;
             Arith_Flag=1;
        end
        4'b0001:begin 
            ALU_OUT=A-B;
            Arith_Flag=1;
        end
        4'b0010:begin 
            ALU_OUT=A*B;
            Arith_Flag=1;
        end
        4'b0011:begin 
            ALU_OUT=A/B;
            Arith_Flag=1;
        end
        4'b0100:begin 
            ALU_OUT=A&B;
            Logic_Flag=1;
        end
        4'b0101:begin 
            ALU_OUT=A|B;
            Logic_Flag=1;
        end
        4'b0110:begin 
            ALU_OUT=~(A&B);
            Logic_Flag=1;
        end
        4'b0111:begin
             ALU_OUT=~(A|B);
             Logic_Flag=1;
        end
        4'b1000:begin 
            ALU_OUT=A^B;
            Logic_Flag=1;
        end
        4'b1001:begin 
            ALU_OUT=~(A^B);
            Logic_Flag=1;
            end
        4'b1010:begin 
            if(A==B)begin
                ALU_OUT=1;
                Logic_Flag=1;
            end
            else begin
                ALU_OUT=0;
                Logic_Flag=0;
            end
        end
        4'b1011:begin 
            if(A>B)begin
                ALU_OUT=2;
                Logic_Flag=1;
            end
            else begin
                ALU_OUT=0;
                Logic_Flag=1;
            end
        end
        4'b1100:begin 
            if(A<B)begin
                ALU_OUT=3;
                Logic_Flag=1;
            end
            else begin
                ALU_OUT=0;
                Logic_Flag=0;
            end
        end
        4'b1101:begin 
            ALU_OUT=A>>1;
            Logic_Flag=1;
        end
        4'b1110:begin 
            ALU_OUT=A<<1;
            Shift_Flag=1;
        end
        default:ALU_OUT=0; 
            
    
    endcase
end

endmodule