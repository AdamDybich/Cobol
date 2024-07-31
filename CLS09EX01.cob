       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS09EX01.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  tekst PIC X(25) VALUE 'Ala ma kota'.
       77  i     PIC 99.

       PROCEDURE DIVISION.
           ACCEPT TEKST (5:2)
           DISPLAY TEKST
           STOP RUN.
