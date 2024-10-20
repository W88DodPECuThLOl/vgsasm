; vgsasm msx.asm -o msx.rom
org $4000

CartridgeHeader:
    DB "AB"
    DW Start

org $4010
.Start
    ; スタックポインタを初期化
    ; 参考: https://qiita.com/suzukiplan/items/9d4b814d53ce96e4ea35
    ld sp, $F380

    ; VRAM の アクセスアドレス を NameTable の先頭 ($1800) に書き込みモードで設定
    ; ※VDP アドレスポート を書き込む時は di ~ ei で割り込みを禁止
    ld a, ($0007)
    inc a
    ld c, a
    di
    ld a, $00
    out (c), a
    ld a, $18 + $40
    out (c), a
    ei

    ; 画面をクリア
    call ClearScreen

    ; VRAM の アクセスアドレス を NameTable の $1989 に書き込みモードで設定
    ; (ココから Hello, World! を書き込めばだいたい中心に描画される)
    inc c
    di
    ld a, $89
    out (c), a
    ld a, $19 + $40
    out (c), a
    ei

    ; NameTable に Hello, World! を書き込む
    dec c
    ld hl, Hello
    ld b, 13
    otir    ; ※実機だとこれでは動かないので注意

    ; プログラム終了 (無限ループしておく)
@End
    jr @End

.ClearScreen
    ; 画面を空白で埋める
    dec c
    ld a, $20
    ld b, $00
    ld d, $03
@Loop
    out (c), a
    djnz @Loop
    dec d
    jr nz, @Loop
    ret

.Data

Hello:
    DB "Hello, World!"

org $7FF0
.Footer
    DB 0, 0, 0, 0, 0, 0, 0, 0
    DB 0, 0, 0, 0, 0, 0, 0, 0
