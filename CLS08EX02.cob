       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS08EX02.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  X PIC X(20) VALUE 'Ala ma kota'.
       77  a PIC X(10).
       77  b PIC X(10).
       77  c PIC X(10).
       77  delim PIC X(10).
       PROCEDURE DIVISION.
           UNSTRING x DELIMITED BY ' ' OR '.' INTO a, b, c
           DELIMITER DELIM
           DISPLAY a '*' b '*' C
           DISPLAY DELIM.
           STOP RUN.
