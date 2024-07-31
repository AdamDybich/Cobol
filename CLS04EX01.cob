       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS04EX01.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

        01 tekst PIC X(20).
        01 ilosc PIC 99.
        01 num PIC 99.
       PROCEDURE DIVISION.
           MOVE "ala ma kota" TO TEKST
           INSPECT TEKST TALLYING ILOSC FOR TRAILING ' '
           SUBTRACT ILOSC FROM 20 GIVING NUM
           DISPLAY TEKST NUM

           STOP RUN.
