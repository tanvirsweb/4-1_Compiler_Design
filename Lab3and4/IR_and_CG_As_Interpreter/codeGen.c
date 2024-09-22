#include "codeGen.h"

void gen_code(enum code_ops op, int arg)
{
    code[code_offset].op = op;
    code[code_offset].arg = arg;

    code_offset++;
}

void print_code()
{
    int i = 0;

    for(i=0; i<code_offset; i++)
    {
        printf("%3d: %-15s  %4d\n", i, op_name[code[i].op], code[i].arg);
    }
}


void vm()
{
    int pc = 0;
    struct instruction ir;
    int ar = 7;
    int top = 0;
    char ch;

    do
    {
        ir = code[pc];
        printf("\n;%s %d\n", op_name[ir.op], ir.arg);
        printf( "PC = %3d IR.arg = %8d AR = %3d Top = %3d,%8d\n", pc, ir.arg, ar, top, stack[top]);

        switch(ir.op)
        {
            case START:
                            break;

            case HALT:
                            printf("halt\n");
                            break;

            case STORE:
                            stack[ar+ir.arg] = stack[top-1];
                            top--;
                            break;

            case SCAN_INT_VALUE: 
                            scanf( "%d", &stack[ar+ir.arg]);
                            break;

            case PRINT_INT_VALUE:              
                            printf( "%d\n", stack[ar+ir.arg] );
                            top--;
                            break;

            case LD_VAR: 
                            stack[top] = stack[ar+ir.arg];
                            top++;
                            break;

            case LD_INT:
                            stack[top] = ir.arg;
                            top++;
                            break;

            case ADD:
                            top--;
                            stack[top-1] = stack[top-1] + stack[top];            
                            break;
            case SUB:
                            top--;
                            stack[top-1] = stack[top-1] - stack[top];            
                            break;
            default:
                            break;
        }
        pc = pc + 1;

        int j = 0;
        for(j = 0; j<10; j++)
        {
            printf("\tstack[%d] = %d ", j, stack[j]);
        }
        printf("\n");

    }while(ir.op!=HALT);
}