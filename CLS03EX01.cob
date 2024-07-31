       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS03EX01.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
        01 tekst PIC X(13).
        77 ilosc PIC S9(3).
        PROCEDURE DIVISION.
           MOVE Z"Ala ma kota" TO TEKST
           MOVE 0 TO ILOSC
           INSPECT tekst TALLYING ilosc FOR CHARACTERS BEFORE LOW-VALUES.
           DISPLAY "Wynik =" ilosc "*"
           STOP RUN.