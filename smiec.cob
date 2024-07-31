*     IF jednostka1(i)
      *     PERFORM GENERATE-LICZEBNIK-JEDNOSTKA
      *     END-IF
      *
      *     IF jednostka234(i)
      *     PERFORM GENERATE-LICZEBNIK-TYSIACE
      *     END-IF

      *     IF jednostka5(i)
      *     PERFORM GENERATE-LICZEBNIK-TYSIAC
      
      *     END-IF

           IF dziesiatka1(i)
           PERFORM GENERATE-LICZEBNIK-DZIESIATKI
           END-IF

           IF dziesiatka2(i)
           PERFORM GENERATE-LICZEBNIK-DZIESIAT
           END-IF

           IF setka1(i)
           PERFORM GENERATE-LICZEBNIK-SETKI
           END-IF

           IF tysiac1(i)
           PERFORM GENERATE-LICZEBNIK-TYSIAC
           END-IF

           IF milion1(i)
           PERFORM GENERATE-LICZEBNIK-MILION
           END-IF

           END-PERFORM.

           DISPLAY 'LICZEBNIK: ' LICZEBNIK.

       GENERATE-LICZEBNIK-JEDNOSTKA.
           MOVE JEDNOSTKI-ELEMENT(I) TO liczebnik(i:5).
           ADD 1 TO i.

       GENERATE-LICZEBNIK-TYSIACE.
           IF reszta = 0 AND i > 1
           MOVE TYSIACE-ELEMENT(i) TO liczebnik(i:8)
           ELSE
           MOVE tysiac234 TO liczebnik(i:8)
           END-IF.
           ADD 2 TO i.

       GENERATE-LICZEBNIK-TYSIAC.
           IF reszta = 0 AND (i = 1 OR (i > 1 AND NOT dziesiatka1))
           MOVE tysiac1 TO liczebnik(i:7)
           ELSE
           MOVE tysiac234 TO liczebnik(i:8)
           END-IF.
           ADD 2 TO i.

       GENERATE-LICZEBNIK-DZIESIATKI.
           MOVE dziesiatka1 TO liczebnik(i:8).
           ADD 1 TO i.

       GENERATE-LICZEBNIK-DZIESIAT.
           IF cyfra = 1 AND reszta > 0
              MOVE 'jedenaście ' TO liczebnik(i:11).
              ADD 1 TO i.
           ELSE
              MOVE dziesiatka2 TO liczebnik(i:8).
              ADD 1 TO i.
           END-IF.

       GENERATE-LICZEBNIK-SETKI.
           MOVE setka1 TO liczebnik(i:4).
           ADD 1 TO i.

       GENERATE-LICZEBNIK-TYSIAC.
           IF reszta = 0 AND (i > 1 AND NOT dziesiatka1(i))
           MOVE tysiace-element(i) TO liczebnik(i:8)   *> Use the OCCURS table directly
           ELSE
           MOVE tysiace234 TO liczebnik(i:8)
           END-IF.
           ADD 2 TO i.

       GENERATE-LICZEBNIK-MILION.
           IF reszta = 0 AND i > 1
           MOVE milion5 TO liczebnik(i:9)
           ELSE
           MOVE milion234 TO liczebnik(i:8)
           END-IF.
           ADD 2 TO i.

