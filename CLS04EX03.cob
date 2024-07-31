       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS04EX03.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
        01 DZIEN-TYG-INIT.
             05 FILLER PIC X(10) VALUE "Monday".
             05 FILLER PIC X(10) VALUE "Tuoesday".
             05 FILLER PIC X(10) VALUE "Wednesday".
             05 FILLER PIC X(10) VALUE "Thursday".
             05 FILLER PIC X(10) VALUE "Friday".
             05 FILLER PIC X(10) VALUE "Saturday".
             05 FILLER PIC X(10) VALUE "Sunday".

        01 DZIEN-TYG REDEFINES DZIEN-TYG-INIT OCCURS 7 PIC X(10).
        77 I                  PIC 9(4) COMP.

       PROCEDURE DIVISION.          
           

           PERFORM VARYING i FROM 1 BY 1 UNTIL I>7
                DISPLAY DZIEN-TYG (i)
           END-PERFORM
           
           STOP RUN.
