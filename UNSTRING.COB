       IDENTIFICATION DIVISION.
       PROGRAM-ID. UNSTRING.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  ADR PIC X(30) VALUE 'adamdybich1112@gmail.com'.
       77  USER PIC X(20).
       77  SERW PIC X(20).
       77  DOMAIN PIC X(10).
       PROCEDURE DIVISION.
           UNSTRING ADR DELIMITED BY '@' OR '.' INTO USER, SERW, DOMAIN
           DISPLAY 'uzytkownik = '  USER 'serwer = ' SERW
           'domena = ' DOMAIN
           STOP RUN.
