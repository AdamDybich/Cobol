       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS08EX05.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  X PIC X(20) VALUE 'Ala ma kota'.
       77  a PIC X(10).
      *    77  b PIC X(10).
      *    77  c PIC X(10).
       77  PP PIC 99.
       77  ilosc-zn PIC 99.
       77  slowo PIC 99.
       PROCEDURE DIVISION.
           MOVE 1 TO PP
           PERFORM UNTIL pp > 20
               UNSTRING X DELIMITED BY ALL ' ' INTO A COUNT ILOSC-ZN
               POINTER PP TALLYING SLOWO
               DISPLAY 'biez.slowo= ' a ' dlugosc = '
               ILOSC-ZN ' razem = ' SLOWO
           END-PERFORM
                                
           STOP RUN.
