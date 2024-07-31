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

           DISPLAY OPIS-PRAC.

           XML GENERATE ciag-xml FROM opis-prac.
           DISPLAY ciag-xml.
           DISPLAY "----"
           XML GENERATE  ciag-xml from opis-prac with ATTRIBUTES.
           DISPLAY ciag-XML.

           STOP RUN.
