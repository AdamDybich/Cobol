       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS02EX01.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
        77 ilosc PIC S9(3).
        77 tekst PIC X(15) VALUE "ala ma kota".
       PROCEDURE DIVISION.
           MOVE 0 TO ilosc
           MOVE LOW-VALUES to TEKST
           DISPLAY "Podaj zdanie".
           ACCEPT TEKST
           INSPECT tekst TALLYING ilosc FOR CHARACTERS BEFORE LOW-VALUES.
      *    MOVE FUNCTION LENGTH(TEKST) TO ILOSC
           DISPLAY "Wynik =" ilosc "*"
           STOP RUN.
