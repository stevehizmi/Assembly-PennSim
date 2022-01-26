; Problem Statement:
;
; Assume that three numbers (2’s complement 16-bit integers) 
; are stored in three consecutive memory locations: x3200, x3201, x3202. 
; Write an LC-3 assembly program (q2.asm) to sort these numbers in 
; ascending order (from the smallest to largest) in memory. 

.ORIG x3000

START:
	LD R0, FIRST	
	LD R1, SECOND
	LD R2, THIRD

	NOT R1, R1 
	ADD R1, R1, #1 ; Make value in R1 opp sign

	ADD R3, R0, R1 ;First and second result
	ADD R4, R2, R1 ;Second and third result
	
	NOT R2, R2
	ADD R2, R2, #1 ; Make value in R2 opp sign

	ADD R5, R0, R2 ;First and third result

	ADD R3, R3, #0
	BRn NEG
	ADD R4, R4, #0
	BRn NEGS
	ADD R5, R5, #0
	BRn NEGSS

NEG	NOT R1, R1 
	ADD R1, R1, #1 ; Make value in R1 opp sign
	ST R1, FIRST
	ST R0, SECOND
NEGS	NOT R2, R2
	ADD R2, R2, #1 ; Make value in R2 opp sign
	ST R2, SECOND
	ST R1, THIRD
NEGSS	NOT R2, R2
	ADD R2, R2, #1 ; Make value in R2 opp sign
	ST R2, FIRST
	ST R0, THIRD

	
STOP:
	HALT;
	
; Variable, string, array declarations (.FILL, .BLKW, ..) are placed at the end.


FIRST	.FILL x3200
SECOND	.FILL x3201
THIRD	.FILL x3202
.END