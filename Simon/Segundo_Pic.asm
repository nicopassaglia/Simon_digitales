list p=16f887
INCLUDE "p16f887.inc"
CBLOCK 0x20
AUX
AUX1
AUX2
PUNTAJE
MAYOR_PUNTAJE
UNIDADES
DECENAS
ENDC
DISP_0	EQU b'00111111'
DISP_1	EQU b'00000110'
DISP_2	EQU b'01011011'
DISP_3	EQU b'01001111'
DISP_4	EQU b'01100110'
DISP_5	EQU b'01101101'
DISP_6	EQU b'01111101'
DISP_7	EQU b'00000111'
DISP_8	EQU b'01111111'
DISP_9	EQU b'01101111'
org	0x00
goto	INICIO
org	0x04
goto	INTERRUPCION



INICIO
	call	CFG

MAIN
	goto	$

CFG
	movlw	0x00
	movwf	MAYOR_PUNTAJE
	return

INTERRUPCION
	retfie


CONVERTIR
	movf	PUNTAJE,0
	movwf	AUX
	movlw	.10

DECENAS_BUCLE
	subwf	AUX,1
	btfsc	STATUS,C
	goto	UNIDADES
	incf	DECENAS,1
	goto	DECENAS

UNIDADES_TAG
	movf	AUX,0
	movwf	UNIDADES
	return
	
	
PUNTAJE_MAYOR?
	movf	PUNTAJE,0
	movwf	AUX1
	movf	MAYOR_PUNTAJE,0
	subwf	AUX1,1
	btfss	STATUS,C
	return
	movf	PUNTAJE,0
	movwf	MAYOR_PUNTAJE
	return
	

TABLA
	addwf	PCL,1
	retlw	DISP_0	
	retlw	DISP_1
	retlw	DISP_2	
	retlw	DISP_3	
	retlw	DISP_4	
	retlw	DISP_5	
	retlw	DISP_6	
	retlw	DISP_7	
	retlw	DISP_8	
	retlw	DISP_9	
end