%application that shows a certain date for a pre-giben day, month and year, starting from year 1 to 2xxx

% Knowledge
month(1, 0).
month(2, 3).
month(3, 3).
month(4, 6).
month(5, 1).
month(6, 4).
month(7, 6).
month(8, 2).
month(9, 5).
month(10, 0).
month(11, 3).
month(12, 5).

days(0, domingo).
days(1, lunes).
days(2, martes).
days(3, miercoles).
days(4, jueves).
days(5, viernes).
days(6, sabado).


century(C, CR) :- C1 is C mod 4, 
                  C2 is 3 - C1, 
              CR is 2 * C2.

year(Y, YR) :- Y1 is Y // 12, 
               Y2 is Y mod 12, 
               Y3 is Y2 // 4, 
               Y4 is Y1 + Y2 + Y3, 
               YR is Y4 mod 7.

day(D, DR) :- DR is D mod 7.

correct(YEAR, MONTH, TOTAL, TR) :- A1 is YEAR mod 4, 
                       A2 is YEAR mod 100, 
                       A3 is YEAR mod 400, 
                                   A1 = 0 -> (A2 = 0 -> (A3 = 0 -> (MONTH =< 2 -> TR is TOTAL - 1; TR is TOTAL); TR is TOTAL); (MONTH =< 2 -> TR is TOTAL - 1; TR is TOTAL)); TR is TOTAL.

dia_semana(DAY, MONTH, YEAR, X) :- C is YEAR // 100, century(C, CR),
                                   Y is YEAR mod 100, year(Y, YR), 
                                   month(MONTH, MR),
                                   day(DAY, DR), 
                                   TOTAL is CR + YR + MR + DR,
                                   correct(YEAR, MONTH, TOTAL, TR),
                                   T is TR mod 7, 
                                   days(T, X).