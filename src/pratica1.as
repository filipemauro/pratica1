opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 10920"

opt pagewidth 120

	opt lm

	processor	16F874A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,__delay_ms
	FNCALL	_main,_delay
	FNROOT	_main
	global	_PORTC
psect	text141,local,class=CODE,delta=2
global __ptext141
__ptext141:
_PORTC	set	7
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_TRISC
_TRISC	set	135
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	file	"pratica1.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	??__delay_ms
??__delay_ms:	; 0 bytes @ 0x0
	global	??_main
??_main:	; 0 bytes @ 0x0
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	?__delay_ms
?__delay_ms:	; 2 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	global	delay@x
delay@x:	; 4 bytes @ 0x0
	ds	4
	global	??_delay
??_delay:	; 0 bytes @ 0x4
	ds	4
	global	delay@i
delay@i:	; 4 bytes @ 0x8
	ds	4
	global	main@ch
main@ch:	; 2 bytes @ 0xC
	ds	2
	global	main@n
main@n:	; 2 bytes @ 0xE
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON           0      0       0
;; BANK0           94     16      16
;; BANK1           94      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_delay
;;
;; Critical Paths under _main in BANK1
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 4     4      0     186
;;                                             12 BANK0      4     4      0
;;                          __delay_ms
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) __delay_ms                                            2     0      2       0
;;                                              0 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _delay                                               12     8      4      91
;;                                              0 BANK0     12     8      4
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   __delay_ms
;;   _delay
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            0      0       0       0        0.0%
;;EEDATA              80      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;COMMON               0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;BITBANK0            5E      0       0       3        0.0%
;;BANK0               5E     10      10       4       17.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITBANK1            5E      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BANK1               5E      0       0       6        0.0%
;;ABS                  0      0       0       7        0.0%
;;DATA                 0      0       0       8        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 13 in file "C:\projetos\pratica1\src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  n               2   14[BANK0 ] int 
;;  ch              2   12[BANK0 ] int 
;; Return value:  Size  Location     Type
;;                  2  693[BANK0 ] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       4       0
;;      Temps:          0       0       0
;;      Totals:         0       4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		__delay_ms
;;		_delay
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\projetos\pratica1\src\main.c"
	line	13
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [allreg]
	line	15
	
l2694:	
;main.c: 14: int ch,n;
;main.c: 15: TRISC = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	16
;main.c: 16: PORTC = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	17
;main.c: 17: PORTC = 0b00000000;
	clrf	(7)	;volatile
	line	18
	
l2696:	
;main.c: 18: ch=1;
	movlw	low(01h)
	movwf	(main@ch)
	movlw	high(01h)
	movwf	((main@ch))+1
	line	20
	
l2698:	
;main.c: 20: _delay_ms(100);
	movlw	low(064h)
	movwf	(?__delay_ms)
	movlw	high(064h)
	movwf	((?__delay_ms))+1
	fcall	__delay_ms
	goto	l2726
	line	22
;main.c: 22: while(1)
	
l694:	
	line	24
;main.c: 23: {
;main.c: 24: switch(ch){
	goto	l2726
	line	26
;main.c: 26: case 1:
	
l696:	
	line	28
	
l2700:	
;main.c: 28: if( ++n > 30 )
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@n),f
	skipnc
	incf	(main@n+1),f
	movlw	high(01h)
	addwf	(main@n+1),f
	movf	((main@n+1)),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01Fh))^80h
	subwf	btemp+1,w
	skipz
	goto	u2355
	movlw	low(01Fh)
	subwf	((main@n)),w
u2355:

	skipc
	goto	u2351
	goto	u2350
u2351:
	goto	l2728
u2350:
	line	30
	
l2702:	
;main.c: 29: {
;main.c: 30: PORTC = 0b00001001;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	31
	
l2704:	
;main.c: 31: n = 0;
	clrf	(main@n)
	clrf	(main@n+1)
	line	32
	
l2706:	
;main.c: 32: ch=2;
	movlw	low(02h)
	movwf	(main@ch)
	movlw	high(02h)
	movwf	((main@ch))+1
	goto	l2728
	line	33
	
l697:	
	line	35
;main.c: 33: }
;main.c: 35: break;
	goto	l2728
	line	37
;main.c: 37: case 2:
	
l699:	
	line	39
	
l2708:	
;main.c: 39: if( ++n > 30 )
	movlw	low(01h)
	addwf	(main@n),f
	skipnc
	incf	(main@n+1),f
	movlw	high(01h)
	addwf	(main@n+1),f
	movf	((main@n+1)),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01Fh))^80h
	subwf	btemp+1,w
	skipz
	goto	u2365
	movlw	low(01Fh)
	subwf	((main@n)),w
u2365:

	skipc
	goto	u2361
	goto	u2360
u2361:
	goto	l2728
u2360:
	line	41
	
l2710:	
;main.c: 40: {
;main.c: 41: n=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@n)
	clrf	(main@n+1)
	line	42
	
l2712:	
;main.c: 42: PORTC = 0b00100100;
	movlw	(024h)
	movwf	(7)	;volatile
	line	43
	
l2714:	
;main.c: 43: ch=3;
	movlw	low(03h)
	movwf	(main@ch)
	movlw	high(03h)
	movwf	((main@ch))+1
	goto	l2728
	line	44
	
l700:	
	line	46
;main.c: 44: }
;main.c: 46: break;
	goto	l2728
	line	48
;main.c: 48: case 3:
	
l701:	
	line	50
	
l2716:	
;main.c: 50: if( ++n >= 5)
	movlw	low(01h)
	addwf	(main@n),f
	skipnc
	incf	(main@n+1),f
	movlw	high(01h)
	addwf	(main@n+1),f
	movf	((main@n+1)),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2375
	movlw	low(05h)
	subwf	((main@n)),w
u2375:

	skipc
	goto	u2371
	goto	u2370
u2371:
	goto	l2728
u2370:
	line	52
	
l2718:	
;main.c: 51: {
;main.c: 52: n=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@n)
	clrf	(main@n+1)
	line	53
	
l2720:	
;main.c: 53: PORTC = 0b000010010;
	movlw	(012h)
	movwf	(7)	;volatile
	line	54
	
l2722:	
;main.c: 54: ch=1;
	movlw	low(01h)
	movwf	(main@ch)
	movlw	high(01h)
	movwf	((main@ch))+1
	goto	l2728
	line	55
	
l702:	
	line	57
;main.c: 55: }
;main.c: 57: break;
	goto	l2728
	line	58
	
l2724:	
;main.c: 58: }
	goto	l2728
	line	24
	
l695:	
	
l2726:	
	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 1 sub-switches
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte            9     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             5     6 (fixed)
; spacedrange            8     9 (fixed)
; locatedrange           1     3 (fixed)
;	Chosen strategy is simple_byte

	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf (main@ch+1),w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l2754
	goto	l2728
	opt asmopt_on
	
l2754:	
; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 1 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           16    10 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	movf (main@ch),w
	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l2700
	xorlw	2^1	; case 2
	skipnz
	goto	l2708
	xorlw	3^2	; case 3
	skipnz
	goto	l2716
	goto	l2728
	opt asmopt_on

	line	58
	
l698:	
	line	60
	
l2728:	
;main.c: 60: delay(1000);
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	03h
	movwf	(?_delay+1)
	movlw	0E8h
	movwf	(?_delay)

	fcall	_delay
	goto	l2726
	line	62
	
l703:	
	line	22
	goto	l2726
	
l704:	
	line	65
;main.c: 62: }
;main.c: 64: return 0;
;	Return value of _main is never used
	
l705:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	__delay_ms
	global	_delay
psect	text142,local,class=CODE,delta=2
global __ptext142
__ptext142:

;; *************** function _delay *****************
;; Defined at:
;;		line 6 in file "C:\projetos\pratica1\src\main.c"
;; Parameters:    Size  Location     Type
;;  x               4    0[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  i               4    8[BANK0 ] unsigned long 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       4       0
;;      Locals:         0       4       0
;;      Temps:          0       4       0
;;      Totals:         0      12       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text142
	file	"C:\projetos\pratica1\src\main.c"
	line	6
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 7
; Regs used in _delay: [wreg]
	line	8
	
l2682:	
;main.c: 7: unsigned long i;
;main.c: 8: for(i=0;i<50000;i++)
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(delay@i+3)
	movlw	0
	movwf	(delay@i+2)
	movlw	0
	movwf	(delay@i+1)
	movlw	0
	movwf	(delay@i)

	movlw	0
	subwf	(delay@i+3),w
	skipz
	goto	u2305
	movlw	0
	subwf	(delay@i+2),w
	skipz
	goto	u2305
	movlw	0C3h
	subwf	(delay@i+1),w
	skipz
	goto	u2305
	movlw	050h
	subwf	(delay@i),w
u2305:
	skipc
	goto	u2301
	goto	u2300
u2301:
	goto	l2686
u2300:
	goto	l691
	
l2684:	
	goto	l691
	line	9
	
l687:	
	
l2686:	
;main.c: 9: for(;x>0;x--);
	movf	(delay@x+3),w
	iorwf	(delay@x+2),w
	iorwf	(delay@x+1),w
	iorwf	(delay@x),w
	skipz
	goto	u2311
	goto	u2310
u2311:
	goto	l2690
u2310:
	goto	l2692
	
l2688:	
	goto	l2692
	
l689:	
	
l2690:	
	movlw	01h
	movwf	((??_delay+0)+0)
	movlw	0
	movwf	((??_delay+0)+0+1)
	movlw	0
	movwf	((??_delay+0)+0+2)
	movlw	0
	movwf	((??_delay+0)+0+3)
	movf	0+(??_delay+0)+0,w
	subwf	(delay@x),f
	movf	1+(??_delay+0)+0,w
	skipc
	incfsz	1+(??_delay+0)+0,w
	goto	u2325
	goto	u2326
u2325:
	subwf	(delay@x+1),f
u2326:
	movf	2+(??_delay+0)+0,w
	skipc
	incfsz	2+(??_delay+0)+0,w
	goto	u2327
	goto	u2328
u2327:
	subwf	(delay@x+2),f
u2328:
	movf	3+(??_delay+0)+0,w
	skipc
	incfsz	3+(??_delay+0)+0,w
	goto	u2329
	goto	u2320
u2329:
	subwf	(delay@x+3),f
u2320:

	movf	(delay@x+3),w
	iorwf	(delay@x+2),w
	iorwf	(delay@x+1),w
	iorwf	(delay@x),w
	skipz
	goto	u2331
	goto	u2330
u2331:
	goto	l2690
u2330:
	goto	l2692
	
l690:	
	line	8
	
l2692:	
	movlw	01h
	addwf	(delay@i),f
	movlw	0
	skipnc
movlw 1
	addwf	(delay@i+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(delay@i+2),f
	movlw	0
	skipnc
movlw 1
	addwf	(delay@i+3),f
	movlw	0
	subwf	(delay@i+3),w
	skipz
	goto	u2345
	movlw	0
	subwf	(delay@i+2),w
	skipz
	goto	u2345
	movlw	0C3h
	subwf	(delay@i+1),w
	skipz
	goto	u2345
	movlw	050h
	subwf	(delay@i),w
u2345:
	skipc
	goto	u2341
	goto	u2340
u2341:
	goto	l2686
u2340:
	goto	l691
	
l688:	
	line	10
	
l691:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
psect	text143,local,class=CODE,delta=2
global __ptext143
__ptext143:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
