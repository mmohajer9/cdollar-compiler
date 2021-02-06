#ifndef MIPS_H
#define MIPS_H

#include <stdio.h>
#include <iostream>
#include <string>
#include <fstream>

using namespace std;

class MIPSCodeGenerator
{

public:

    ofstream *fp;

    MIPSCodeGenerator()
    {
        fp = NULL;
    }
    ~MIPSCodeGenerator()
    {
        (*fp).close();
    }
	MIPSCodeGenerator(ofstream *fp)
	{
        this->fp = fp;
	}

    //* initialize
    void init(ofstream *fp)
    {
        this->fp = fp;
        *(this->fp) << ".data" << endl << "backn: .asciiz \"\\n\"" << endl << ".text" << endl << ".globl main" << endl;
    }


    //* arithmetics
    void add(string dst_reg , string left_src_reg , string right_src_reg);
    void subtract(string dst_reg , string left_src_reg , string right_src_reg);
    void addi(string dst_reg , string left_src_reg , int immediate);
    void mul(string dst_reg , string left_src_reg , string right_src_reg);
    void div(string left_src_reg , string right_src_reg);
    void divQ(string dst_reg);
    void divR(string dst_reg);

    //* logical
    void _and(string dst_reg , string left_src_reg , string right_src_reg);
    void _or(string dst_reg , string left_src_reg , string right_src_reg);
    void andi(string dst_reg , string left_src_reg , int immediate);
    void ori(string dst_reg , string left_src_reg , int immediate);

    //* data transfer
    void lw(string dst_reg , string src_base_reg , int offset);
    void sw(string src_base_reg , string dst_reg , int offset);
    void la(string dst_reg , string label);
    void li(string dst_reg , int immediate);
    void move(string dst_reg , string src_reg);

    //* branch
    void beq(string left_reg , string right_reg , int offset_to_next_address);
    void bne(string left_reg , string right_reg , int offset_to_next_address);
    void bgt(string left_reg , string right_reg , int offset_to_next_address);
    void bge(string left_reg , string right_reg , int offset_to_next_address);
    void blt(string left_reg , string right_reg , int offset_to_next_address);
    void ble(string left_reg , string right_reg , int offset_to_next_address);

    //* comparison
    void slt(string dst_reg , string left_src_reg , string right_src_reg);
    void slti(string dst_reg , string left_src_reg , int immediate);

    //* unconditional jump
    void j(int address);
    void j(string label);

    void jr(string reg);

    void jal(int address);
    void jal(string label);

    //* utility
    void add_label(string label);



};


#endif