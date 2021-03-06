; ********************* fdiv.asm *******************
;
         ORG   0100H
         JMP   start
a        DD    1.5
b        DD    3.5
quotient DD    0.0
slash    DB    ' / ', '$'
equal    DB    ' = ', '$'
;
%include "..\mymacro\dispf.mac"
%include "..\mymacro\dispstr.mac"
;
start:
       FINIT                    ;浮點堆疊初始化
       FLD     DWORD [a]        ;TOS=a
       FDIV    DWORD [b]        ;TOS=a/b
       FSTP    DWORD [quotient] ;quotient=TOS=a/b
       dispf   a,  3            ;顯示a,三位小數
       dispstr slash            ;列印 '/'
       dispf   b,  3            ;顯示b,三位小數
       dispstr equal            ;列印 '='
       dispf   quotient, 6      ;顯示quotient,六位小數
;
       MOV     AX, 4c00H
       INT     21H           ;返回作業系統
