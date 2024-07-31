       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS05EX03.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
        01 FILLER OCCURS 4.
           05 A OCCURS 4 PIC 9.

           05 I PIC 9(4) COMP.
           05 J PIC 9(4) COMP.
           
       PROCEDURE DIVISION.

           MOVE 7 TO A(2,3)
           DISPLAY a(2,3)

           STOP RUN.
