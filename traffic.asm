
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt0
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
	MOVF       _manual+0, 0
	IORWF      _manual+1, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      _manual+0
	MOVWF      _manual+1
	MOVLW      0
	MOVWF      _manual+1
L_interrupt0:
L_end_interrupt:
L__interrupt52:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_show_west:

	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_show_west_number+0, 0
	MOVWF      R0+0
	MOVF       FARG_show_west_number+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__show_west+0
	MOVF       R0+1, 0
	MOVWF      FLOC__show_west+1
	MOVF       FLOC__show_west+0, 0
	MOVWF      _tens+0
	MOVF       FLOC__show_west+1, 0
	MOVWF      _tens+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_show_west_number+0, 0
	MOVWF      R0+0
	MOVF       FARG_show_west_number+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _units+0
	MOVF       R0+1, 0
	MOVWF      _units+1
	MOVLW      240
	ANDWF      PORTB+0, 0
	MOVWF      R5+0
	MOVLW      15
	ANDWF      FLOC__show_west+0, 0
	MOVWF      R4+0
	MOVF       R4+0, 0
	MOVWF      R2+0
	RLF        R2+0, 1
	BCF        R2+0, 0
	MOVF       R2+0, 0
	IORWF      R5+0, 0
	MOVWF      PORTB+0
	MOVLW      240
	ANDWF      PORTC+0, 0
	MOVWF      R2+0
	MOVLW      15
	ANDWF      R0+0, 1
	MOVF       R0+0, 0
	IORWF      R2+0, 0
	MOVWF      PORTC+0
L_end_show_west:
	RETURN
; end of _show_west

_show_south:

	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_show_south_number+0, 0
	MOVWF      R0+0
	MOVF       FARG_show_south_number+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__show_south+0
	MOVF       R0+1, 0
	MOVWF      FLOC__show_south+1
	MOVF       FLOC__show_south+0, 0
	MOVWF      _tens+0
	MOVF       FLOC__show_south+1, 0
	MOVWF      _tens+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_show_south_number+0, 0
	MOVWF      R0+0
	MOVF       FARG_show_south_number+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _units+0
	MOVF       R0+1, 0
	MOVWF      _units+1
	MOVLW      15
	ANDWF      FLOC__show_south+0, 0
	MOVWF      R3+0
	MOVLW      15
	ANDWF      R0+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	IORWF      R3+0, 0
	MOVWF      PORTD+0
L_end_show_south:
	RETURN
; end of _show_south

_west_green:

	BCF        PORTD+0, 4
	BCF        PORTD+0, 5
	BSF        PORTD+0, 6
	BSF        PORTD+0, 0
	BCF        PORTD+0, 1
	BCF        PORTD+0, 2
L_end_west_green:
	RETURN
; end of _west_green

_west_yellow:

	BCF        PORTD+0, 4
	BSF        PORTD+0, 5
	BCF        PORTD+0, 6
	BSF        PORTD+0, 0
	BCF        PORTD+0, 1
	BCF        PORTD+0, 2
L_end_west_yellow:
	RETURN
; end of _west_yellow

_south_green:

	BSF        PORTD+0, 4
	BCF        PORTD+0, 5
	BCF        PORTD+0, 6
	BCF        PORTD+0, 0
	BCF        PORTD+0, 1
	BSF        PORTD+0, 2
L_end_south_green:
	RETURN
; end of _south_green

_south_yellow:

	BSF        PORTD+0, 4
	BCF        PORTD+0, 5
	BCF        PORTD+0, 6
	BCF        PORTD+0, 0
	BSF        PORTD+0, 1
	BCF        PORTD+0, 2
L_end_south_yellow:
	RETURN
; end of _south_yellow

_west_to_south:

	CALL       _west_yellow+0
	MOVLW      3
	MOVWF      FARG_show_west_number+0
	MOVLW      0
	MOVWF      FARG_show_west_number+1
	CALL       _show_west+0
	MOVLW      3
	MOVWF      FARG_show_south_number+0
	MOVLW      0
	MOVWF      FARG_show_south_number+1
	CALL       _show_south+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_west_to_south1:
	DECFSZ     R13+0, 1
	GOTO       L_west_to_south1
	DECFSZ     R12+0, 1
	GOTO       L_west_to_south1
	DECFSZ     R11+0, 1
	GOTO       L_west_to_south1
	NOP
	NOP
	MOVLW      0
	XORWF      _manual+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__west_to_south60
	MOVLW      0
	XORWF      _manual+0, 0
L__west_to_south60:
	BTFSS      STATUS+0, 2
	GOTO       L_west_to_south2
	GOTO       L_end_west_to_south
L_west_to_south2:
	CALL       _west_yellow+0
	MOVLW      2
	MOVWF      FARG_show_west_number+0
	MOVLW      0
	MOVWF      FARG_show_west_number+1
	CALL       _show_west+0
	MOVLW      2
	MOVWF      FARG_show_south_number+0
	MOVLW      0
	MOVWF      FARG_show_south_number+1
	CALL       _show_south+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_west_to_south3:
	DECFSZ     R13+0, 1
	GOTO       L_west_to_south3
	DECFSZ     R12+0, 1
	GOTO       L_west_to_south3
	DECFSZ     R11+0, 1
	GOTO       L_west_to_south3
	NOP
	NOP
	MOVLW      0
	XORWF      _manual+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__west_to_south61
	MOVLW      0
	XORWF      _manual+0, 0
L__west_to_south61:
	BTFSS      STATUS+0, 2
	GOTO       L_west_to_south4
	GOTO       L_end_west_to_south
L_west_to_south4:
	CALL       _west_yellow+0
	MOVLW      1
	MOVWF      FARG_show_west_number+0
	MOVLW      0
	MOVWF      FARG_show_west_number+1
	CALL       _show_west+0
	MOVLW      1
	MOVWF      FARG_show_south_number+0
	MOVLW      0
	MOVWF      FARG_show_south_number+1
	CALL       _show_south+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_west_to_south5:
	DECFSZ     R13+0, 1
	GOTO       L_west_to_south5
	DECFSZ     R12+0, 1
	GOTO       L_west_to_south5
	DECFSZ     R11+0, 1
	GOTO       L_west_to_south5
	NOP
	NOP
	MOVLW      0
	XORWF      _manual+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__west_to_south62
	MOVLW      0
	XORWF      _manual+0, 0
L__west_to_south62:
	BTFSS      STATUS+0, 2
	GOTO       L_west_to_south6
	GOTO       L_end_west_to_south
L_west_to_south6:
	CLRF       FARG_show_west_number+0
	CLRF       FARG_show_west_number+1
	CALL       _show_west+0
	CLRF       FARG_show_south_number+0
	CLRF       FARG_show_south_number+1
	CALL       _show_south+0
	CALL       _south_green+0
	CLRF       _currentStreet+0
	CLRF       _currentStreet+1
L_end_west_to_south:
	RETURN
; end of _west_to_south

_south_to_west:

	CALL       _south_yellow+0
	MOVLW      3
	MOVWF      FARG_show_west_number+0
	MOVLW      0
	MOVWF      FARG_show_west_number+1
	CALL       _show_west+0
	MOVLW      3
	MOVWF      FARG_show_south_number+0
	MOVLW      0
	MOVWF      FARG_show_south_number+1
	CALL       _show_south+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_south_to_west7:
	DECFSZ     R13+0, 1
	GOTO       L_south_to_west7
	DECFSZ     R12+0, 1
	GOTO       L_south_to_west7
	DECFSZ     R11+0, 1
	GOTO       L_south_to_west7
	NOP
	NOP
	MOVLW      0
	XORWF      _manual+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__south_to_west64
	MOVLW      0
	XORWF      _manual+0, 0
L__south_to_west64:
	BTFSS      STATUS+0, 2
	GOTO       L_south_to_west8
	GOTO       L_end_south_to_west
L_south_to_west8:
	CALL       _south_yellow+0
	MOVLW      2
	MOVWF      FARG_show_west_number+0
	MOVLW      0
	MOVWF      FARG_show_west_number+1
	CALL       _show_west+0
	MOVLW      2
	MOVWF      FARG_show_south_number+0
	MOVLW      0
	MOVWF      FARG_show_south_number+1
	CALL       _show_south+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_south_to_west9:
	DECFSZ     R13+0, 1
	GOTO       L_south_to_west9
	DECFSZ     R12+0, 1
	GOTO       L_south_to_west9
	DECFSZ     R11+0, 1
	GOTO       L_south_to_west9
	NOP
	NOP
	MOVLW      0
	XORWF      _manual+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__south_to_west65
	MOVLW      0
	XORWF      _manual+0, 0
L__south_to_west65:
	BTFSS      STATUS+0, 2
	GOTO       L_south_to_west10
	GOTO       L_end_south_to_west
L_south_to_west10:
	CALL       _south_yellow+0
	MOVLW      1
	MOVWF      FARG_show_west_number+0
	MOVLW      0
	MOVWF      FARG_show_west_number+1
	CALL       _show_west+0
	MOVLW      1
	MOVWF      FARG_show_south_number+0
	MOVLW      0
	MOVWF      FARG_show_south_number+1
	CALL       _show_south+0
	CALL       _west_green+0
	MOVLW      1
	MOVWF      _currentStreet+0
	MOVLW      0
	MOVWF      _currentStreet+1
L_end_south_to_west:
	RETURN
; end of _south_to_west

_manual_mode:

	CLRF       FARG_show_west_number+0
	CLRF       FARG_show_west_number+1
	CALL       _show_west+0
	CLRF       FARG_show_south_number+0
	CLRF       FARG_show_south_number+1
	CALL       _show_south+0
	MOVLW      0
	BTFSC      PORTE+0, 0
	MOVLW      1
	MOVWF      _oldStreetButton+0
	CLRF       _oldStreetButton+1
L_manual_mode11:
	MOVLW      0
	XORWF      _manual+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__manual_mode67
	MOVLW      1
	XORWF      _manual+0, 0
L__manual_mode67:
	BTFSS      STATUS+0, 2
	GOTO       L_manual_mode12
	MOVLW      0
	XORWF      _oldStreetButton+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__manual_mode68
	MOVLW      1
	XORWF      _oldStreetButton+0, 0
L__manual_mode68:
	BTFSS      STATUS+0, 2
	GOTO       L_manual_mode15
	BTFSC      PORTE+0, 0
	GOTO       L_manual_mode15
L__manual_mode50:
	MOVLW      0
	XORWF      _currentStreet+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__manual_mode69
	MOVLW      1
	XORWF      _currentStreet+0, 0
L__manual_mode69:
	BTFSS      STATUS+0, 2
	GOTO       L_manual_mode16
	CALL       _west_to_south+0
	GOTO       L_manual_mode17
L_manual_mode16:
	CALL       _south_to_west+0
L_manual_mode17:
L_manual_mode18:
	BTFSC      PORTE+0, 0
	GOTO       L_manual_mode19
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_manual_mode20:
	DECFSZ     R13+0, 1
	GOTO       L_manual_mode20
	DECFSZ     R12+0, 1
	GOTO       L_manual_mode20
	NOP
	MOVLW      0
	XORWF      _manual+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__manual_mode70
	MOVLW      0
	XORWF      _manual+0, 0
L__manual_mode70:
	BTFSS      STATUS+0, 2
	GOTO       L_manual_mode21
	GOTO       L_end_manual_mode
L_manual_mode21:
	GOTO       L_manual_mode18
L_manual_mode19:
	MOVLW      1
	MOVWF      _oldStreetButton+0
	MOVLW      0
	MOVWF      _oldStreetButton+1
L_manual_mode15:
	MOVLW      0
	BTFSC      PORTE+0, 0
	MOVLW      1
	MOVWF      _oldStreetButton+0
	CLRF       _oldStreetButton+1
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_manual_mode22:
	DECFSZ     R13+0, 1
	GOTO       L_manual_mode22
	DECFSZ     R12+0, 1
	GOTO       L_manual_mode22
	NOP
	GOTO       L_manual_mode11
L_manual_mode12:
L_end_manual_mode:
	RETURN
; end of _manual_mode

_main:

	MOVLW      6
	MOVWF      ADCON1+0
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
	BSF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
	CLRF       TRISA+0
	MOVLW      1
	MOVWF      TRISB+0
	CLRF       TRISC+0
	CLRF       TRISD+0
	MOVLW      1
	MOVWF      TRISE+0
	CLRF       PORTA+0
	CLRF       PORTB+0
	CLRF       PORTC+0
	CLRF       PORTD+0
	CLRF       PORTE+0
	BSF        PORTA+0, 3
	BSF        PORTB+0, 5
	BSF        PORTB+0, 6
	BSF        PORTB+0, 7
	CLRF       _manual+0
	CLRF       _manual+1
	MOVLW      1
	MOVWF      _currentStreet+0
	MOVLW      0
	MOVWF      _currentStreet+1
L_main23:
	MOVLW      0
	XORWF      _manual+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main72
	MOVLW      0
	XORWF      _manual+0, 0
L__main72:
	BTFSS      STATUS+0, 2
	GOTO       L_main25
	MOVLW      1
	MOVWF      _currentStreet+0
	MOVLW      0
	MOVWF      _currentStreet+1
	MOVLW      20
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
L_main26:
	MOVLW      128
	XORWF      _counter+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main73
	MOVLW      1
	SUBWF      _counter+0, 0
L__main73:
	BTFSS      STATUS+0, 0
	GOTO       L_main27
	CALL       _west_green+0
	MOVF       _counter+0, 0
	MOVWF      FARG_show_west_number+0
	MOVF       _counter+1, 0
	MOVWF      FARG_show_west_number+1
	CALL       _show_west+0
	MOVLW      3
	ADDWF      _counter+0, 0
	MOVWF      FARG_show_south_number+0
	MOVF       _counter+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      FARG_show_south_number+1
	CALL       _show_south+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main29:
	DECFSZ     R13+0, 1
	GOTO       L_main29
	DECFSZ     R12+0, 1
	GOTO       L_main29
	DECFSZ     R11+0, 1
	GOTO       L_main29
	NOP
	NOP
	MOVLW      0
	XORWF      _manual+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main74
	MOVLW      1
	XORWF      _manual+0, 0
L__main74:
	BTFSS      STATUS+0, 2
	GOTO       L_main30
	GOTO       L_main27
L_main30:
	MOVLW      1
	SUBWF      _counter+0, 1
	BTFSS      STATUS+0, 0
	DECF       _counter+1, 1
	GOTO       L_main26
L_main27:
L_main25:
	MOVLW      0
	XORWF      _manual+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main75
	MOVLW      0
	XORWF      _manual+0, 0
L__main75:
	BTFSS      STATUS+0, 2
	GOTO       L_main31
	MOVLW      1
	MOVWF      _currentStreet+0
	MOVLW      0
	MOVWF      _currentStreet+1
	MOVLW      3
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
L_main32:
	MOVLW      128
	XORWF      _counter+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main76
	MOVLW      1
	SUBWF      _counter+0, 0
L__main76:
	BTFSS      STATUS+0, 0
	GOTO       L_main33
	CALL       _west_yellow+0
	MOVF       _counter+0, 0
	MOVWF      FARG_show_west_number+0
	MOVF       _counter+1, 0
	MOVWF      FARG_show_west_number+1
	CALL       _show_west+0
	MOVF       _counter+0, 0
	MOVWF      FARG_show_south_number+0
	MOVF       _counter+1, 0
	MOVWF      FARG_show_south_number+1
	CALL       _show_south+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main35:
	DECFSZ     R13+0, 1
	GOTO       L_main35
	DECFSZ     R12+0, 1
	GOTO       L_main35
	DECFSZ     R11+0, 1
	GOTO       L_main35
	NOP
	NOP
	MOVLW      0
	XORWF      _manual+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main77
	MOVLW      1
	XORWF      _manual+0, 0
L__main77:
	BTFSS      STATUS+0, 2
	GOTO       L_main36
	GOTO       L_main33
L_main36:
	MOVLW      1
	SUBWF      _counter+0, 1
	BTFSS      STATUS+0, 0
	DECF       _counter+1, 1
	GOTO       L_main32
L_main33:
L_main31:
	MOVLW      0
	XORWF      _manual+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main78
	MOVLW      0
	XORWF      _manual+0, 0
L__main78:
	BTFSS      STATUS+0, 2
	GOTO       L_main37
	CLRF       _currentStreet+0
	CLRF       _currentStreet+1
	MOVLW      15
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
L_main38:
	MOVLW      128
	XORWF      _counter+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main79
	MOVLW      4
	SUBWF      _counter+0, 0
L__main79:
	BTFSS      STATUS+0, 0
	GOTO       L_main39
	CALL       _south_green+0
	MOVF       _counter+0, 0
	MOVWF      FARG_show_west_number+0
	MOVF       _counter+1, 0
	MOVWF      FARG_show_west_number+1
	CALL       _show_west+0
	MOVLW      3
	SUBWF      _counter+0, 0
	MOVWF      FARG_show_south_number+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _counter+1, 0
	MOVWF      FARG_show_south_number+1
	CALL       _show_south+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main41:
	DECFSZ     R13+0, 1
	GOTO       L_main41
	DECFSZ     R12+0, 1
	GOTO       L_main41
	DECFSZ     R11+0, 1
	GOTO       L_main41
	NOP
	NOP
	MOVLW      0
	XORWF      _manual+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main80
	MOVLW      1
	XORWF      _manual+0, 0
L__main80:
	BTFSS      STATUS+0, 2
	GOTO       L_main42
	GOTO       L_main39
L_main42:
	MOVLW      1
	SUBWF      _counter+0, 1
	BTFSS      STATUS+0, 0
	DECF       _counter+1, 1
	GOTO       L_main38
L_main39:
L_main37:
	MOVLW      0
	XORWF      _manual+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main81
	MOVLW      0
	XORWF      _manual+0, 0
L__main81:
	BTFSS      STATUS+0, 2
	GOTO       L_main43
	CLRF       _currentStreet+0
	CLRF       _currentStreet+1
	MOVLW      3
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
L_main44:
	MOVLW      128
	XORWF      _counter+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main82
	MOVLW      1
	SUBWF      _counter+0, 0
L__main82:
	BTFSS      STATUS+0, 0
	GOTO       L_main45
	CALL       _south_yellow+0
	MOVF       _counter+0, 0
	MOVWF      FARG_show_west_number+0
	MOVF       _counter+1, 0
	MOVWF      FARG_show_west_number+1
	CALL       _show_west+0
	MOVF       _counter+0, 0
	MOVWF      FARG_show_south_number+0
	MOVF       _counter+1, 0
	MOVWF      FARG_show_south_number+1
	CALL       _show_south+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main47:
	DECFSZ     R13+0, 1
	GOTO       L_main47
	DECFSZ     R12+0, 1
	GOTO       L_main47
	DECFSZ     R11+0, 1
	GOTO       L_main47
	NOP
	NOP
	MOVLW      0
	XORWF      _manual+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main83
	MOVLW      1
	XORWF      _manual+0, 0
L__main83:
	BTFSS      STATUS+0, 2
	GOTO       L_main48
	GOTO       L_main45
L_main48:
	MOVLW      1
	SUBWF      _counter+0, 1
	BTFSS      STATUS+0, 0
	DECF       _counter+1, 1
	GOTO       L_main44
L_main45:
	GOTO       L_main49
L_main43:
	CALL       _manual_mode+0
L_main49:
	GOTO       L_main23
L_end_main:
	GOTO       $+0
; end of _main
