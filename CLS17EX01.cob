       IDENTIFICATION DIVISION.

      *    Sort -

       PROGRAM-ID. CLS17EX01.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT infile ASSIGN TO "zbior_test2.txt"
               ORGANIZATION is LINE SEQUENTIAL
               STATUS errinput.
           SELECT outfile ASSIGN TO "zbaza5.txt"
               ORGANIZATION IS line SEQUENTIAL
               STATUS erroutput.
           SELECT sortuj ASSIGN TO "zortuj.txt"
               ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.

       FILE SECTION.

       FD infile  BLOCK CONTAINS 0.
        01 in-rec.
        05 towar PIC X(20).
        05 waga pic 99v9(8).
        05 cena pic 99v9(8).

       FD outfile BLOCK CONTAINS 0.
        01 out-rec.
        05 towar PIC X(20).
        05 waga pic 99v9(8).
        05 cena pic 99v9(8).

       SD sortuj BLOCK CONTAINS 0.
        01 sor-rec.
        05 towar PIC X(20).
        05 waga pic 99v9(8).
        05 cena pic 99v9(8).


       WORKING-STORAGE SECTION.
        01 erroutput        PIC 99.
        01 errinput         PIC 99.


       PROCEDURE DIVISION.

           OPEN INPUT INFILE
           READ INFILE
           PERFORM UNTIL ERRINPUT > 0
           DISPLAY TOWAR OF IN-REC, "_", WAGA OF IN-REC, "_",
           CENA OF IN-REC, "_"

           READ INFILE
           END-PERFORM

           CLOSE INFILE

           SORT SORTUJ ON ASCENDING KEY CENA OF SOR-REC USING INFILE
           GIVING OUTFILE

           DISPLAY " input :" ERRINPUT, " output :"ERROUTPUT


           STOP RUN.
