       .ORIG x3000
       LD    R2,TERM   ; Load -97
       LD    R3, DIFF  ; Load ASCII difference
       LD    R7, TERMS ; Load -26
AGAIN  TRAP  x23       ; Request keyboard input
       ADD   R1,R2,R0  ; Test for terminating
       BRn   EXIT      ; End program if not capital letter
       ADD   R6, R1, R7 ; End if not capital letter condition 2
       BRp   EXIT      ; Character not capital letter
       ADD   R0, R0, R3  ; Change to lowercase
       TRAP  x21       ; Output to the monitor
       BRnzp AGAIN     ; ... and do it again!   
TERM   .FILL xFF9F     ; FF9F = -97 (negative of ASCII 97)
TERMS  .FILL xFFE6     ; FFE6 = -26 (negative of ASCII 26)
DIFF   .FILL x0020     ; Difference
EXIT   TRAP  x25       ; Halt
.END
