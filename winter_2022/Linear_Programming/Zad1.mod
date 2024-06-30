
set F;
/*Firmy*/

set L;
/*Lotniska*/

param upperLimit{f in F};
/*maksymalna liczba galonów od firmy*/

param lowerLimit{l in L};
/*minimum ile galonów na danym lotnisku*/

param fuelCost{l in L, f in F};

var x{l in L, f in F} >=0;
/*Liczba galonów paliwa produkowana przez f dostarczana do l*/

minimize totalCost: sum{l in L, f in F} fuelCost[l,f] * x[l,f];
/*minimalizujemy koszt całkowity - nasz koszt paliwa dla każdej pary (l,f) mnożymy przez liczbę galonów, które dana firma przeznacza na dane lotnisko */

s.t. supply{f in F}: sum{l in L} x[l,f] <= upperLimit[f];
/*limit dla firmy galonów które mogą dostarczyć - sumujemy dla każdego lotniska l liczbę galonów od wszystkich firm dla danego l, np.
dla Firma1 będziemy mieli x[Firma1,Lotnisko1]+x[Firma1,Lotnisko2]+x[Firma1,Lotnisko3]+x[Firma1,Lotnisko4]<= upperLimit[Firma1] i to dla każdej firmy */

s.t. demand{l in L}: sum{f in F} x[l,f] = lowerLimit[l];
/*nasz cel - ile galonów potrzebuje dane lotnisko - sumujemy dla każdej firmy f liczbę galonów dostarczonych do każdego lotniska przez dane f, np.
dla Lotnisko1 będziemy mieli x[Firma1,Lotnisko1]+x[Firma2,Lotnisko1]+x[Firma3,Lotnisko1]+x[Firma4,Lotnisko1] = lowerLimit[Lotnisko1]*/



data;

set F := Firma1 Firma2 Firma3;

set L := Lotnisko1 Lotnisko2 Lotnisko3 Lotnisko4;

param upperLimit := Firma1 275000
                    Firma2 550000
                    Firma3 660000;

param lowerLimit := Lotnisko1 110000
                    Lotnisko2 220000
                    Lotnisko3 330000
                    Lotnisko4 440000;

param fuelCost :                Firma1 Firma2  Firma3 :=
                    Lotnisko1   10      7       8
                    Lotnisko2   10      11      14
                    Lotnisko3   9       12      4
                    Lotnisko4   11      13      9;