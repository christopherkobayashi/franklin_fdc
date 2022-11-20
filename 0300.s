; Micro-SCI Floppy Drive Controller info disassembly

PRINTVEC	= $08
PRBL2		= $F94A
HOME		= $FC58
COUT		= $FDED

* =	$c600

        ldx     #$20	; controller signature
        ldy     #$00
        ldx     #$03
        stx     $3C

        jsr     HOME	; clear display, home cursor
        tsx
        lda     $0100,x	; current address (#$c6 for slot 6)
        sta     PRINTVEC+1
        lda     #0
        sta     PRINTVEC
        ldy     #<info	; offset of data begin
LC617	lda     (PRINTVEC),y
LC619	bmi     doit
        tax
        jsr     PRBL2
        beq     loop1
doit	jsr     COUT
loop1	iny
        bne     LC617
LC627	beq     LC627

info	.byte $8d, $bc, $ad, $ad, $cb, $c5, $d9, $c2
	.byte $cf, $c1, $d2, $c4

#ifdef USCI
; ROM checksum 5ddcbbf1
;	<--KEYBOARD        U-SCI        REAR-->
;
;               ---------JUMPER--------
;              !           !           !
;              V           V           V
;
;             ### ! !   ! ### !   ! ! ### 
;             ### ! !   ! ### !   ! ! ### 
;             ### ! !   ! ### !   ! ! ### 
;             ### ! !   ! ### !   ! ! ### 
;             XXXXXXX   XXXXXXX   XXXXXXX
;               3.2      INFO    3.3&PASCAL

	.byte $08, $d5, $ad, $d3
	.byte $c3, $c9, $08, $d2, $c5, $c1, $d2, $ad
	.byte $ad, $be, $8d, $8d, $08, $ad, $ad, $ad
	.byte $ad, $ad, $ad, $ad, $ad, $ad, $ca, $d5
	.byte $cd, $d0, $c5, $d2, $ad, $ad
#else
; ROM checksum 5dfc32ca
;	<--KEYBOARD      ACE 1000      REAR-->
;
;                 ------JUMPER------
;              !           !           !
;              V           V           V
;
;             ### ! !   ! ### !   ! ! ### 
;             ### ! !   ! ### !   ! ! ### 
;             ### ! !   ! ### !   ! ! ### 
;             ### ! !   ! ### !   ! ! ### 
;             XXXXXXX   XXXXXXX   XXXXXXX
;               3.2      INFO    3.3&PASCAL

	.byte $06, $c1, $c3, $c5
	.byte $a0, $b1, $b0, $b0, $b0, $06, $d2, $c5
	.byte $c1, $d2, $ad, $ad, $be, $8d, $8d, $07
	.byte $a0, $02, $ad, $ad, $ad, $ad, $ad, $ad
	.byte $ca, $d5, $cd, $d0, $c5, $d2
#endif
	.byte $ad, $ad
	.byte $ad, $ad, $ad, $ad, $8d, $07, $a1, $0b
	.byte $a1, $0b, $a1, $8d, $07, $d6, $0b, $d6
	.byte $0b, $d6, $8d, $8d, $06, $a3, $a3, $a3
	.byte $a0, $a1, $a0, $a1, $03, $a1, $a0, $a3
	.byte $a3, $a3, $a0, $a1, $03, $a1, $a0, $a1
	.byte $a0, $a3, $a3, $a3, $8d, $06, $a3, $a3
	.byte $a3, $a0, $a1, $a0, $a1, $03, $a1, $a0
	.byte $a3, $a3, $a3, $a0, $a1, $03, $a1, $a0
	.byte $a1, $a0, $a3, $a3, $a3, $8d, $06, $a3
	.byte $a3, $a3, $a0, $a1, $a0, $a1, $03, $a1
	.byte $a0, $a3, $a3, $a3, $a0, $a1, $03, $a1
	.byte $a0, $a1, $a0, $a3, $a3, $a3, $8d, $06
	.byte $a3, $a3, $a3, $a0, $a1, $a0, $a1, $03
	.byte $a1, $a0, $a3, $a3, $a3, $a0, $a1, $03
	.byte $a1, $a0, $a1, $a0, $a3, $a3, $a3, $8d
	.byte $06, $d8, $d8, $d8, $d8, $d8, $d8, $d8
	.byte $03, $d8, $d8, $d8, $d8, $d8, $d8, $d8
	.byte $03, $d8, $d8, $d8, $d8, $d8, $d8, $d8
	.byte $8d, $08, $b3, $ae, $b2, $06, $c9, $ce
	.byte $c6, $cf, $04, $b3, $ae, $b3, $a6, $d0
	.byte $c1, $d3, $c3, $c1, $cc, $8d, $8d
