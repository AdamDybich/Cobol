       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS05EX02.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
        01 FILLER.
           05 A OCCURS 50 PIC 9(4).
           05 I PIC 9(4) COMP.
           05 J PIC 9(4) COMP.
           
       PROCEDURE DIVISION.

           PERFORM VARYING I FROM 1 by 1 UNTIL i>50
                MOVE i TO a(I)
                DISPLAY i " " a(I)
           END-PERFORM.

           PERFORM VARYING i FROM 1 by 1 UNTIL i>25
                MULTIPLY 2 BY i GIVING j
                ADD 1 TO J
                DISPLAY a(J)
                END-PERFORM
           STOP RUN.
