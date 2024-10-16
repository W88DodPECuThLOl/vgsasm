#include "common.h"
#include "mnemonic.h"

std::map<std::string, Mnemonic> mnemonicTable = {
    {"LD", Mnemonic::LD},
    {"LDI", Mnemonic::LDI},
    {"LDIR", Mnemonic::LDIR},
    {"LDD", Mnemonic::LDD},
    {"LDDR", Mnemonic::LDDR},
    {"PUSH", Mnemonic::PUSH},
    {"POP", Mnemonic::POP},
    {"EX", Mnemonic::EX},
    {"EXX", Mnemonic::EXX},
    {"CP", Mnemonic::CP},
    {"CPI", Mnemonic::CPI},
    {"CPIR", Mnemonic::CPIR},
    {"CPD", Mnemonic::CPD},
    {"CPDR", Mnemonic::CPDR},
    {"ADD", Mnemonic::ADD},
    {"ADC", Mnemonic::ADC},
    {"SUB", Mnemonic::SUB},
    {"SBC", Mnemonic::SBC},
    {"AND", Mnemonic::AND},
    {"OR", Mnemonic::OR},
    {"XOR", Mnemonic::XOR},
    {"EOR", Mnemonic::XOR},
    {"INC", Mnemonic::INC},
    {"DEC", Mnemonic::DEC},
    {"DAA", Mnemonic::DAA},
    {"CPL", Mnemonic::CPL},
    {"NEG", Mnemonic::NEG},
    {"CCF", Mnemonic::CCF},
    {"SCF", Mnemonic::SCF},
    {"NOP", Mnemonic::NOP},
    {"HALT", Mnemonic::HALT},
    {"RL", Mnemonic::RL},
    {"RLA", Mnemonic::RLA},
    {"RLC", Mnemonic::RLC},
    {"RLCA", Mnemonic::RLCA},
    {"RR", Mnemonic::RR},
    {"RRA", Mnemonic::RRA},
    {"RRC", Mnemonic::RRC},
    {"RRCA", Mnemonic::RRCA},
    {"SLA", Mnemonic::SLA},
    {"SL", Mnemonic::SLA},
    {"SLL", Mnemonic::SLL},
    {"SRA", Mnemonic::SRA},
    {"SRL", Mnemonic::SRL},
    {"SR", Mnemonic::SRL},
    {"RLD", Mnemonic::RLD},
    {"RRD", Mnemonic::RRD},
    {"BIT", Mnemonic::BIT},
    {"SET", Mnemonic::SET},
    {"RES", Mnemonic::RES},
    {"JP", Mnemonic::JP},
    {"JR", Mnemonic::JR},
    {"JZ", Mnemonic::JZ},
    {"JNZ", Mnemonic::JNZ},
    {"JC", Mnemonic::JC},
    {"JNC", Mnemonic::JNC},
    {"JPO", Mnemonic::JPO},
    {"JPE", Mnemonic::JPE},
    {"JPP", Mnemonic::JPP},
    {"JPM", Mnemonic::JPM},
    {"JPN", Mnemonic::JPM},
    {"DJNZ", Mnemonic::DJNZ},
    {"CALL", Mnemonic::CALL},
    {"RET", Mnemonic::RET},
    {"RETI", Mnemonic::RETI},
    {"RETN", Mnemonic::RETN},
    {"RETN", Mnemonic::RST},
    {"OUT", Mnemonic::OUT},
    {"OUTI", Mnemonic::OUTI},
    {"OUTIR", Mnemonic::OTIR},
    {"OTIR", Mnemonic::OTIR},
    {"OUTD", Mnemonic::OUTD},
    {"OUTDR", Mnemonic::OTDR},
    {"OTDR", Mnemonic::OTDR},
    {"IN", Mnemonic::IN},
    {"INI", Mnemonic::INI},
    {"INIR", Mnemonic::INIR},
    {"IND", Mnemonic::IND},
    {"INDR", Mnemonic::INDR},
    {"DI", Mnemonic::DI},
    {"EI", Mnemonic::EI},
    {"IM", Mnemonic::IM},
    {"DB", Mnemonic::DB},
    {"DEFB", Mnemonic::DB},
    {"DW", Mnemonic::DW},
    {"DEFW", Mnemonic::DW},
    {"BYTE", Mnemonic::DB},
    {"WORD", Mnemonic::DW},
};

static bool parseMneimonicSkipScope = false;

void parse_mneoimonic(LineData* line)
{
    for (auto it = line->token.begin(); it != line->token.end(); it++) {
        // スコープ内ではニーモニック解析をスキップ
        if (parseMneimonicSkipScope) {
            if (it->first == TokenType::ScopeEnd) {
                parseMneimonicSkipScope = false;
            }
            continue;
        }

        // スコープ開始を検出したらスキップ
        if (it->first == TokenType::ScopeBegin) {
            parseMneimonicSkipScope = true;
            continue;
        }

        // Other ならチェック
        if (it->first == TokenType::Other) {
            auto m = mnemonicTable.find(it->second);
            if (m != mnemonicTable.end()) {
                if (it == line->token.begin()) {
                    it->first = TokenType::Mnemonic;
                } else {
                    line->error = true;
                    line->errmsg = "A mnemonic specified position was incorrect.";
                    return;
                }
            }
        }
    }
}

bool mnemonic_format_check(LineData* line, int size, ...)
{
    if (line->token.size() != size) {
        line->error = true;
        line->errmsg = "Excessive or insufficient number of operands.";
        return false;
    }
    if (1 == size) {
        return true;
    }
    va_list arg;
    va_start(arg, size);
    bool error = false;
    for (auto it = line->token.begin() + 1; it != line->token.end(); it++) {
        auto expect = va_arg(arg, TokenType);
        if (!error) {
            error = it->first != expect;
            if (error) {
                line->error = true;
                line->errmsg = "Unexpected operand: " + it->second;
            }
        }
    }
    va_end(arg);
    return !line->error;
}

void mnemonic_NOP(LineData* line)
{
    if (mnemonic_format_check(line, 1)) {
        line->machine.push_back(0x00);
    }
}

void mnemonic_IM(LineData* line)
{
    if (mnemonic_format_check(line, 2, TokenType::Numeric)) {
        line->machine.push_back(0xED);
        switch (atoi(line->token[1].second.c_str())) {
            case 0: line->machine.push_back(0x46); break;
            case 1: line->machine.push_back(0x56); break;
            case 2: line->machine.push_back(0x5E); break;
            default:
                line->error = true;
                line->errmsg = "Unsupported interrupt mode: " + line->token[1].second;
        }
    }
}

void mnemonic_syntax_check(std::vector<LineData*>* lines)
{
    for (auto line : *lines) {
        if (line->token.empty()) {
            continue;
        }
        if (line->token[0].first != TokenType::Mnemonic) {
            continue;
        }
        auto m = mnemonicTable[line->token[0].second];
        switch (m) {
            case Mnemonic::NOP: mnemonic_NOP(line); break;
            case Mnemonic::IM: mnemonic_IM(line); break;
        }
    }
}
