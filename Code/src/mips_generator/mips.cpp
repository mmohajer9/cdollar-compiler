#include "mips.hpp"


    void MIPSCodeGenerator::add(string dst_reg , string left_src_reg , string right_src_reg)
    {
        *(this->fp) << "    add " << dst_reg << "," << left_src_reg << "," << right_src_reg << endl;
    }
    void MIPSCodeGenerator::subtract(string dst_reg , string left_src_reg , string right_src_reg)
    {
        *(this->fp) << "    sub " << dst_reg << "," << left_src_reg << "," << right_src_reg << endl;
    }
    void MIPSCodeGenerator::addi(string dst_reg , string left_src_reg , int immediate)
    {
        *(this->fp) << "    addi " << dst_reg << "," << left_src_reg << "," << immediate << endl;
    }
    void MIPSCodeGenerator::mul(string dst_reg , string left_src_reg , string right_src_reg)
    {
        *(this->fp) << "    mul " << dst_reg << "," << left_src_reg << "," << right_src_reg << endl;
    }
    void MIPSCodeGenerator::div(string left_src_reg , string right_src_reg)
    {
        *(this->fp) << "    div " << left_src_reg << "," << right_src_reg << endl;
    }
    void MIPSCodeGenerator::divQ(string dst_reg)
    {
        *(this->fp) << "    move " << dst_reg << "," << "$lo" << endl;
    }
    void MIPSCodeGenerator::divR(string dst_reg)
    {
        *(this->fp) << "    move " << dst_reg << "," << "$hi" << endl;
    }
    void MIPSCodeGenerator::_and(string dst_reg , string left_src_reg , string right_src_reg)
    {
        *(this->fp) << "    and " << dst_reg << "," << left_src_reg << "," << right_src_reg << endl;
    }
    void MIPSCodeGenerator::_or(string dst_reg , string left_src_reg , string right_src_reg)
    {
        *(this->fp) << "    or " << dst_reg << "," << left_src_reg << "," << right_src_reg << endl;
    }
    void MIPSCodeGenerator::andi(string dst_reg , string left_src_reg , int immediate)
    {
        *(this->fp) << "    andi " << dst_reg << "," << left_src_reg << "," << immediate << endl;
    }
    void MIPSCodeGenerator::ori(string dst_reg , string left_src_reg , int immediate)
    {
        *(this->fp) << "    ori " << dst_reg << "," << left_src_reg << "," << immediate << endl;
    }
    void MIPSCodeGenerator::lw(string dst_reg , string src_base_reg , int offset)
    {
        *(this->fp) << "    lw " << dst_reg << "," << offset << "(" << src_base_reg << ")" << endl;
    }
    void MIPSCodeGenerator::sw(string src_base_reg , string dst_reg , int offset)
    {
        *(this->fp) << "    sw " << dst_reg << "," << offset << "(" << src_base_reg << ")" << endl;
    }
    void MIPSCodeGenerator::la(string dst_reg , string label)
    {
        *(this->fp) << "    la " << dst_reg << "," << label << endl;
    }
    void MIPSCodeGenerator::li(string dst_reg , int immediate)
    {
        *(this->fp) << "    li " << dst_reg << "," << immediate << endl;
    }
    void MIPSCodeGenerator::move(string dst_reg , string src_reg)
    {
        *(this->fp) << "    move " << dst_reg << "," << src_reg << endl;
    }
    void MIPSCodeGenerator::beq(string left_reg , string right_reg , int label)
    {
        *(this->fp) << "    beq " << left_reg << "," << right_reg << "," << label << endl;
    }
    void MIPSCodeGenerator::bne(string left_reg , string right_reg , int label)
    {
        *(this->fp) << "    bne " << left_reg << "," << right_reg << "," << label << endl;
    }
    void MIPSCodeGenerator::bgt(string left_reg , string right_reg , int label)
    {
        *(this->fp) << "    bgt " << left_reg << "," << right_reg << "," << label << endl;
    }
    void MIPSCodeGenerator::bge(string left_reg , string right_reg , int label)
    {
        *(this->fp) << "    bge " << left_reg << "," << right_reg << "," << label << endl;
    }
    void MIPSCodeGenerator::blt(string left_reg , string right_reg , int label)
    {
        *(this->fp) << "    blt " << left_reg << "," << right_reg << "," << label << endl;
    }
    void MIPSCodeGenerator::ble(string left_reg , string right_reg , int label)
    {
        *(this->fp) << "    ble " << left_reg << "," << right_reg << "," << label << endl;
    }
    void MIPSCodeGenerator::slt(string dst_reg , string left_src_reg , string right_src_reg)
    {
        *(this->fp) << "    slt " << dst_reg << "," << left_src_reg << "," << right_src_reg << endl;
    }
    void MIPSCodeGenerator::slti(string dst_reg , string left_src_reg , int immediate)
    {
        *(this->fp) << "    slti " << dst_reg << "," << left_src_reg << "," << immediate << endl;
    }
    void MIPSCodeGenerator::j(int address)
    {
        *(this->fp) << "    j " << address << endl;
    }
    void MIPSCodeGenerator::j(string label)
    {
        *(this->fp) << "    j " << label << endl;
    }
    void MIPSCodeGenerator::jr(string reg)
    {
        *(this->fp) << "    jr " << reg << endl;
    }
    void MIPSCodeGenerator::jal(int address)
    {
        *(this->fp) << "    jal " << address << endl;
    }
    void MIPSCodeGenerator::jal(string label)
    {
        *(this->fp) << "    jal " << label << endl;
    }
    void MIPSCodeGenerator::add_label(string label)
    {
        *(this->fp) << label << ":" << endl;
    }