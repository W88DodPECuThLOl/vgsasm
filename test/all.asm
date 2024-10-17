org $0000

.Main

@Interrupt
    IM 0
    IM 1
    IM 2
    DI
    EI
    HALT

@Stack
    PUSH AF
    PUSH BC
    PUSH DE
    PUSH HL
    PUSH IX
    PUSH IY
    POP AF
    POP BC
    POP DE
    POP HL
    POP IX
    POP IY

@Exchange
    EX DE, HL
    EX AF, AF'
    EX (SP), HL
    EX (SP), IX
    EX (SP), IY
    EXX

@Repeart
    LDI
    LDIR
    LDD
    LDDR
    CPI
    CPIR
    CPD
    CPDR
    OUTI
    OTIR
    OUTIR
    OUTD
    OTDR
    OUTDR

@Other
    NOP
    DAA
    CPL
    CCF
    SCF
    NEG

Calc8:
@And
    AND A
    AND B
    AND C
    AND D
    AND E
    AND H
    AND L
    AND IXH
    AND IXL
    AND IYH
    AND IYL
    AND $FF
    AND (HL)
    AND (IX)
    AND (IX-128)
    AND (IX+127*1)
    AND (IY)
    AND (IY-128)
    AND (IY+127*1)

@And_with_A
    AND A, A
    AND A, B
    AND A, C
    AND A, D
    AND A, E
    AND A, H
    AND A, L
    AND A, IXH
    AND A, IXL
    AND A, IYH
    AND A, IYL
    AND A, $FF
    AND A, (HL)
    AND A, (IX)
    AND A, (IX-128)
    AND A, (IX+127*1)
    AND A, (IY)
    AND A, (IY-128)
    AND A, (IY+127*1)

@Or
    OR A
    OR B
    OR C
    OR D
    OR E
    OR H
    OR L
    OR IXH
    OR IXL
    OR IYH
    OR IYL
    OR $FF
    OR (HL)
    OR (IX)
    OR (IX-128)
    OR (IX+127*1)
    OR (IY)
    OR (IY-128)
    OR (IY+127*1)

@Or_with_A
    OR A, A
    OR A, B
    OR A, C
    OR A, D
    OR A, E
    OR A, H
    OR A, L
    OR A, IXH
    OR A, IXL
    OR A, IYH
    OR A, IYL
    OR A, $FF
    OR A, (HL)
    OR A, (IX)
    OR A, (IX-128)
    OR A, (IX+127*1)
    OR A, (IY)
    OR A, (IY-128)
    OR A, (IY+127*1)

@Xor
    XOR A
    XOR B
    XOR C
    XOR D
    XOR E
    XOR H
    XOR L
    XOR IXH
    XOR IXL
    XOR IYH
    XOR IYL
    XOR $FF
    XOR (HL)
    XOR (IX)
    XOR (IX-128)
    XOR (IX+127*1)
    XOR (IY)
    XOR (IY-128)
    XOR (IY+127*1)

@Xor_with_A
    XOR A, A
    XOR A, B
    XOR A, C
    XOR A, D
    XOR A, E
    XOR A, H
    XOR A, L
    XOR A, IXH
    XOR A, IXL
    XOR A, IYH
    XOR A, IYL
    XOR A, $FF
    XOR A, (HL)
    XOR A, (IX)
    XOR A, (IX-128)
    XOR A, (IX+127*1)
    XOR A, (IY)
    XOR A, (IY-128)
    XOR A, (IY+127*1)

@Compare
    CP A
    CP B
    CP C
    CP D
    CP E
    CP H
    CP L
    CP IXH
    CP IXL
    CP IYH
    CP IYL
    CP $FF
    CP (HL)
    CP (IX)
    CP (IX-128)
    CP (IX+127*1)
    CP (IY)
    CP (IY-128)
    CP (IY+127*1)

@Compare_with_A
    CP A, A
    CP A, B
    CP A, C
    CP A, D
    CP A, E
    CP A, H
    CP A, L
    CP A, IXH
    CP A, IXL
    CP A, IYH
    CP A, IYL
    CP A, $FF
    CP A, (HL)
    CP A, (IX)
    CP A, (IX-128)
    CP A, (IX+127*1)
    CP A, (IY)
    CP A, (IY-128)
    CP A, (IY+127*1)

@Add
    ADD A, A
    ADD A, B
    ADD A, C
    ADD A, D
    ADD A, E
    ADD A, H
    ADD A, L
    ADD A, IXH
    ADD A, IXL
    ADD A, IYH
    ADD A, IYL
    ADD A, $FF
    ADD A, (HL)
    ADD A, (IX)
    ADD A, (IX-128)
    ADD A, (IX+127*1)
    ADD A, (IY)
    ADD A, (IY-128)
    ADD A, (IY+127*1)

@Add_omit_A
    ADD A
    ADD B
    ADD C
    ADD D
    ADD E
    ADD H
    ADD L
    ADD IXH
    ADD IXL
    ADD IYH
    ADD IYL
    ADD $FF
    ADD (HL)
    ADD (IX)
    ADD (IX-128)
    ADD (IX+127*1)
    ADD (IY)
    ADD (IY-128)
    ADD (IY+127*1)

@Add16
    ADD HL, BC
    ADD HL, DE
    ADD HL, HL
    ADD HL, SP
    ADD IX, BC
    ADD IX, DE
    ADD IX, IX
    ADD IX, SP
    ADD IY, BC
    ADD IY, DE
    ADD IY, IY
    ADD IY, SP

@Add16_nn
    ADD HL, $1234
    ADD IX, $5678
    ADD IY, $9ABC

@Adc
    ADC A, A
    ADC A, B
    ADC A, C
    ADC A, D
    ADC A, E
    ADC A, H
    ADC A, L
    ADC A, IXH
    ADC A, IXL
    ADC A, IYH
    ADC A, IYL
    ADC A, $FF
    ADC A, (HL)
    ADC A, (IX)
    ADC A, (IX-128)
    ADC A, (IX+127*1)
    ADC A, (IY)
    ADC A, (IY-128)
    ADC A, (IY+127*1)

@Adc_omit_A
    ADC A
    ADC B
    ADC C
    ADC D
    ADC E
    ADC H
    ADC L
    ADC IXH
    ADC IXL
    ADC IYH
    ADC IYL
    ADC $FF
    ADC (HL)
    ADC (IX)
    ADC (IX-128)
    ADC (IX+127*1)
    ADC (IY)
    ADC (IY-128)
    ADC (IY+127*1)

@Adc16
    ADC HL, BC
    ADC HL, DE
    ADC HL, HL
    ADC HL, SP
    ; ADC IX, BC // unsupported
    ; ADC IX, DE // unsupported
    ; ADC IX, IX // unsupported
    ; ADC IX, SP // unsupported
    ; ADC IY, BC // unsupported
    ; ADC IY, DE // unsupported
    ; ADC IY, IY // unsupported
    ; ADC IY, SP // unsupported

@Adc16_nn
    ; ADC HL, $1234 // unsupported
    ; ADC IX, $5678 // unsupported
    ; ADC IY, $9ABC // unsupported

@Sub
    SUB A
    SUB B
    SUB C
    SUB D
    SUB E
    SUB H
    SUB L
    SUB IXH
    SUB IXL
    SUB IYH
    SUB IYL
    SUB $FF
    SUB (HL)
    SUB (IX)
    SUB (IX-128)
    SUB (IX+127*1)
    SUB (IY)
    SUB (IY-128)
    SUB (IY+127*1)

@Sub_with_A
    SUB A, A
    SUB A, B
    SUB A, C
    SUB A, D
    SUB A, E
    SUB A, H
    SUB A, L
    SUB A, IXH
    SUB A, IXL
    SUB A, IYH
    SUB A, IYL
    SUB A, $FF
    SUB A, (HL)
    SUB A, (IX)
    SUB A, (IX-128)
    SUB A, (IX+127*1)
    SUB A, (IY)
    SUB A, (IY-128)
    SUB A, (IY+127*1)

@Sbc
    SBC A, A
    SBC A, B
    SBC A, C
    SBC A, D
    SBC A, E
    SBC A, H
    SBC A, L
    SBC A, IXH
    SBC A, IXL
    SBC A, IYH
    SBC A, IYL
    SBC A, $FF
    SBC A, (HL)
    SBC A, (IX)
    SBC A, (IX-128)
    SBC A, (IX+127*1)
    SBC A, (IY)
    SBC A, (IY-128)
    SBC A, (IY+127*1)

@Sbc_omit_A
    SBC A
    SBC B
    SBC C
    SBC D
    SBC E
    SBC H
    SBC L
    SBC IXH
    SBC IXL
    SBC IYH
    SBC IYL
    SBC $FF
    SBC (HL)
    SBC (IX)
    SBC (IX-128)
    SBC (IX+127*1)
    SBC (IY)
    SBC (IY-128)
    SBC (IY+127*1)

@Sbc16
    SBC HL, BC
    SBC HL, DE
    SBC HL, HL
    SBC HL, SP
    ; SBC IX, BC // unsupported
    ; SBC IX, DE // unsupported
    ; SBC IX, IX // unsupported
    ; SBC IX, SP // unsupported
    ; SBC IY, BC // unsupported
    ; SBC IY, DE // unsupported
    ; SBC IY, IY // unsupported
    ; SBC IY, SP // unsupported

@Sbc16_nn
    ; SBC HL, $1234 // unsupported
    ; SBC IX, $5678 // unsupported
    ; SBC IY, $9ABC // unsupported
