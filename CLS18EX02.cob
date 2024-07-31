       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS18EX01.
      *    XML - zmiana baz cobolowych na xml, niestety nie działa odwrotnie

       ENVIRONMENT DIVISION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.
        01 Opis-prac.
        05 imie PIC X(12) VALUE "Adam".
        05 nazwisko PIC x(12) VALUE "Dybich".
        05 rok-ur PIC x(4) VALUE "1991".
        05 miasto PIC x(20) VALUE "Nowy Wisnicz".

        77 ciag-XML PIC X(200).

       PROCEDURE DIVISION.

           ACCEPT ciag-xml
           DISPLAY ciag-xml

           XML PARSE CIAG-XML PROCESSING PROCEDURE ppp.
           stop RUN.

       ppp.
           DISPLAY XML-EVENT '' XML-TEXT.

