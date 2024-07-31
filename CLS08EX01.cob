       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS08EX01.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  Klient PIC X(80).
       01  Wynik PIC X(80).
       01  SLOWO PIC X(30).
       88  Tytul VALUE 'inz', 'mgr', 'dr', 'hab', 'prof', 'ks',
           'prezydent'.
       01  i PIC 99.
       01  p1 PIC 99.
       01  p2 PIC 99.
       01  inicjaly PIC XX.

       PROCEDURE DIVISION.

           DISPLAY "Podaj swoja godnosc, wraz z tytulami"
           ACCEPT KLIENT
           PERFORM FORMATUJKLIENTA

      *     MOVE "mgr inz. Adam Dybich" TO Klient
      *     PERFORM FormatujKlienta.

      *     MOVE "mgr inz. Adam Dybich" TO Klient
      *     PERFORM FormatujKlienta.

      *     MOVE "prof. dr Wiktor Zin" TO Klient
      *     PERFORM FormatujKlienta.

      *     MOVE "mgr Mirek Maria Dybich" TO Klient
      *     PERFORM FormatujKlienta.

      *     MOVE "Malgorzata Kidawa-Blonska" TO Klient
      *     PERFORM FormatujKlienta.

      *     MOVE "John Ronald Reuel Tolkien" TO Klient
      *     PERFORM FormatujKlienta.

           STOP RUN.


       FORMATUJKLIENTA SECTION.
           MOVE 1 TO P1
           MOVE 1 TO P2
           PERFORM VARYING i FROM 1 BY 1 UNTIL KLIENT (P1:1)=SPACE
           UNSTRING klient DELIMITED SPACE OR '.'
           INTO slowo POINTER P1
           PERFORM UNTIL NOT (klient(p1:1) = ' ' OR = '.') OR p1 > 79
           ADD 1 TO p1
           END-PERFORM
           IF TYTUL

      *     slowo = 'mgr' OR slowo = 'dr' OR slowo = 'prof' .......
      *     albo 88 tytul VALUE 'mgr','dr',prof','inz'......
                    STRING SLOWO DELIMITED BY SPACE
                    INTO WYNIK POINTER P2
                    ADD 1 TO P2
           ELSE
      *    STRING slowo INTO wynik
      *    ELSE nie jest tytułem
      *    IF pierwsze słowo   ----   IF i = 1

      *    STRING 'Pan/Pani ' INTO wynik
           IF I = 1
           STRING "Pan/Pani " DELIMITED BY SIZE INTO WYNIK POINTER P2

           END-IF
           MOVE SLOWO (1:1) TO INICJALY
           MOVE '.' TO INICJALY (2:1)

           STRING INICJALY DELIMITED BY SIZE INTO WYNIK POINTER P2
      *    pierwszy znak slowa + '.' INTO wynik

           END-IF
           END-PERFORM
      *    STRING slowo INTO 2 znaki na lewo w zm.wynik

           SUBTRACT 2 FROM P2
           STRING SLOWO DELIMITED BY SPACE INTO WYNIK POINTER P2


           DISPLAY KLIENT

           DISPLAY WYNIK

           STOP RUN.
