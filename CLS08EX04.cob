       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS08EX04.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  X PIC X(20) VALUE 'Ala ma kota'.
       77  a PIC X(10).
       77  b PIC X(10).
       77  c PIC X(10).
       77  PP PIC 99.
       PROCEDURE DIVISION.
           MOVE 1 TO PP
           UNSTRING x DELIMITED BY ' ' OR '.' INTO a, b, c POINTER PP
           DISPLAY a '*' b '*' C

           UNSTRING x DELIMITED BY ' ' INTO a POINTER PP
           DISPLAY 'druga warstosc a = ' A
                                
           STOP RUN.
