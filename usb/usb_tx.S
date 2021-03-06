	xref	_ll_usb_tx_count, _ll_usb_tx_buffer_pointer

	xdef	_ll_usb_tx
;;; 16 MHz ;;;
L_Bit0_Idle:
	dec		a		; a--
	jrne	L_Bit1_Begin	; Jump if Z == 0; if a != 0
	nop
	nop
	nop
	nop	
	cpl		20490				; GPIOC+ODR ; �������� �������� ��������; ��������� ���
	ld		a, #$06		; ����� ��������
	nop
	jra		L_Bit1_Begin

L_Bit1_Idle:
	dec		a
	jrne	L_Bit2_Begin
	nop
	nop
	nop
	nop	
	cpl		20490				; GPIOC+ODR ; �������� �������� ��������
	ld		a, #$06
	nop
	jra		L_Bit2_Begin

L_Bit2_Idle:
	dec		a
	jrne	L_Bit3_Begin
	nop
	nop
	nop
	nop	
	cpl		20490				; GPIOC+ODR ; �������� �������� ��������
	ld		a, #$06
	nop
	jra		L_Bit3_Begin

L_Bit3_Idle:
	dec		a
	jrne	L_Bit4_Begin
	nop
	nop
	nop
	nop	
	cpl		20490				; GPIOC+ODR ; �������� �������� ��������
	ld		a, #$06
	nop
	jra		L_Bit4_Begin

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L_Bit0_Begin:
	;;nop
	;;nop
	;;nop
	;;nop
	;;nop
	rrc		(x)						; ��� 0 -> �C.C		; rotate right, C = 1 if LSB of register was set
	jrc		L_Bit0_Idle		; �������, ���� ����� C�.C = 1		; Jump if C = 1
	cpl		20490					; �������� �������� �������� [N,Z,C=1]
	ld		a, #$06				; ���� ���� ��������, ���������� ; a = 6
	nop

L_Bit1_Begin:
	nop
	nop
	nop
	nop
	nop
	rrc		(x)						; ��� 0 -> �C.C
	jrc		L_Bit1_Idle		; �������, ���� ����� C�.C = 1
	cpl		20490					; �������� �������� �������� [N,Z,C=1]
	ld		a, #$06       
	nop

L_Bit2_Begin:
	nop
	nop
	nop
	nop
	nop
	rrc		(x)						; ��� 0 -> �C.C
	jrc		L_Bit2_Idle		; �������, ���� ����� C�.C = 1
	cpl		20490					; �������� �������� �������� [N,Z,C=1]
	ld		a, #$06       
	nop

L_Bit3_Begin:
	nop
	nop
	nop
	nop
	nop
	rrc		(x)						; ��� 0 -> �C.C
	jrc		L_Bit3_Idle		; �������, ���� ����� C�.C = 1
	cpl		20490					; �������� �������� �������� [N,Z,C=1]
	ld		a, #$06       
	nop

L_Bit4_Begin:
	nop
	nop
	nop
	nop
	nop
	rrc		(x)						; ��� 0 -> �C.C
	jrc		L_Bit4_Idle		; �������, ���� ����� C�.C = 1
	cpl		20490					; �������� �������� �������� [N,Z,C=1]
	ld		a, #$06       
	nop

L_Bit5_Begin:
	nop
	nop
	nop
	nop
	nop
	rrc		(x)						; ��� 0 -> �C.C
	jrc		L_Bit5_Idle		; �������, ���� ����� C�.C = 1
	cpl		20490					; �������� �������� �������� [N,Z,C=1]
	ld		a, #$06       
	nop

L_Bit6_Begin:
	nop
	nop
	nop
	nop
	nop
	rrc		(x)						; ��� 0 -> �C.C
	jrc		L_Bit6_Idle		; �������, ���� ����� C�.C = 1
	cpl		20490					; �������� �������� �������� [N,Z,C=1]
	ld		a, #$06       
	nop

L_Bit7_Begin:
	nop
	nop
	nop
	nop
	nop
	rrc		(x)						; ��� 0 -> �C.C
	jrc		L_Bit7_Idle		; �������, ���� ����� C�.C = 1
	cpl		20490					; �������� �������� �������� [N,Z,C=1]
	ld		a, #$06
	nop
	nop	

L_Check_End:

	incw	x
	dec		_ll_usb_tx_count
	jrne	L_Bit0_Begin
	nop
	
L_Tx_End:
	;;nop                
	nop
	nop
	
	clr		20490			 ; ����� �������� ��������

	nop
	nop
	nop
	nop

	nop	;
	nop	;
	nop	;
	nop	;
	nop	;
	
	ret

	nop
	nop
	nop
	nop

;
;
;
	nop

L_Bit4_Idle:
	dec		a
	jrne	L_Bit5_Begin
	nop
	nop
	nop
	nop	
	cpl		20490		; GPIOC+ODR ; �������� �������� ��������
	ld		a, #$06
	nop
	jra		L_Bit5_Begin

L_Bit5_Idle:
	dec		a
	jrne	L_Bit6_Begin
	nop
	nop
	nop
	nop
	cpl		20490		; GPIOC+ODR ; �������� �������� ��������
	ld		a, #$06
	nop
	jra		L_Bit6_Begin

L_Bit6_Idle:
	dec		a
	jrne	L_Bit7_Begin
	nop
	nop
	nop
	nop
	cpl		20490		; GPIOC+ODR ; �������� �������� ��������
	ld		a, #$06
	nop
	jra		L_Bit7_Begin

L_Bit7_Idle:
	dec		a
	jrne	L_Check_End
	nop
	nop
	dec		_ll_usb_tx_count
	incw	x
	ld		a, #$06
	cpl		20490		; GPIOC+ODR ; �������� �������� ��������
	tnz		_ll_usb_tx_count
	jrne	L_Bit0_Begin
	
	;;cpl		20490		; GPIOC+ODR ; �������� �������� ��������
	;;ld		a, #$06
	;;incw	x
	;;dec		_ll_usb_tx_count
	;;jrne	L_Bit0_Begin
	jra		L_Tx_End

;
;	����� �����
;
_ll_usb_tx:

	ldw		x, _ll_usb_tx_buffer_pointer
	
	ld		a,#$40		; a = 0x40 (bit 6)
	ld		20490,a		; GPIOC->ODR = a (set bit 6)
	ld		a, #$06						; ������� ����������� ������
	jra		L_Bit0_Begin