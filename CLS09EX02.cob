       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS09EX02.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  tekst PIC X(25) VALUE 'Ala ma kota'.
       77  i     PIC 99.

       PROCEDURE DIVISION.
           PERFORM VARYING i FROM 1 BY 1 UNTIL i>25
               DISPLAY TEKST(i:1)
           END-PERFORM
           DISPLAY 'koniec'.
           STOP RUN.
