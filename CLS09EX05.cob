       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS09EX05.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       77  rok-x PIC X(4) .
       77  rok REDEFINES ROK-X pic 9(4).

       77  wiek pic ZZZ9.

       PROCEDURE DIVISION.
           DISPLAY 'podaj twoj rok urodzenia'
           ACCEPT ROK-X

           IF ROK-X NUMERIC
      *        MOVE ROK-X TO ROK (bo zajmuje czas)
               SUBTRACT ROK FROM 2024 GIVING wiek
               DISPLAY 'masz ' wiek ' lata'
           ELSE
               DISPLAY 'podales zle dane tumanie ' ROK
           END-IF.
           STOP RUN.
