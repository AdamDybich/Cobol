       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS09EX03.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  tekst PIC X(25) VALUE 'Ala ma kota'.
       77  i     PIC 99.

       PROCEDURE DIVISION.
           IF TEKST IS ALPHABETIC
               DISPLAY 'tak'
           ELSE
               DISPLAY 'nie'
           END-IF
           STOP RUN.
