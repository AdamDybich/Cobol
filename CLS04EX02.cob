       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS04EX02.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
        
        01 tablica OCCURS 10 TIMES PIC X(3).
        01 i                PIC 9(4) COMP.
       PROCEDURE DIVISION.          
           MOVE "Ala" TO TABLICA (1).
           MOVE 2 TO i.
           MOVE "Ola" TO TABLICA (2).

           PERFORM VARYING i FROM 1 BY 1 UNTIL I>10
                DISPLAY TABLICA (i)
           END-PERFORM
           
           STOP RUN.
           