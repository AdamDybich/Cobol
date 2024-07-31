       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS09EX04.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  tekst PIC X(25) VALUE 'Ala ma kota'.
       77  numer pic S9(8) VALUE 123.
       77  i     PIC 99.

       PROCEDURE DIVISION.
           
           IF NUMER IS NUMERIC
               DISPLAY 'tak'
           ELSE
               DISPLAY 'nie'   
           END-IF
           STOP RUN.
