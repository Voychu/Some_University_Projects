
set P;
/*dzielnice*/

set Z;
/*zmiany*/

param lowerLimit{p in P,z in Z};
/*minimalna liczba radiowozów na daną dzielnice i zmianę*/

param upperLimit{p in P,z in Z};
/*maksymalna liczba radiowozów na daną dzielnice i zmianę*/

param lowerLimitZ{z in Z};
/*min liczba radiowozów na zmianę*/

param lowerLimitP{p in P};
/*min liczba radiowozów na dzielnicę*/

var x{p in P, z in Z} >=0;
/*Liczba radiowozów w dzielnicy p na zmianę z*/

var k;
/*Wszystkie radiowozy*/

s.t. necessaryCarsForZ{z in Z}: sum{p in P} x[p,z]>=lowerLimitZ[z];
/*suma samochodów we wszystkich dzielnicach na danej zmianie musi być co najmniej równa limitowi dolnemu dla danej zmiany, u nas 10,20,18*/

s.t. necessaryCarsForP{p in P}: sum{z in Z} x[p,z]>=lowerLimitP[p];
/*suma samochodów na wszystkich zmianach w danej dzielnicy musi być co najmniej równa limitowi dolnemu dla danej dzielnicy, u nas 10,14,13*/

s.t. necesarryCarsForPZ{p in P, z in Z}: lowerLimit[p,z]<=x[p,z]<=upperLimit[p,z];
/* tabelka, tj. liczba radiowozów dla danej pary (dzielnica,zmiana) musi byc pomiędzy min a maks dla niej*/

s.t. maxCarsOnZ{z in Z}: sum{p in P} x[p,z]<=k;
/* zinterpretowałem polecenie w taki sposób, że na każdą zmianę przeznaczamy te same radiowozy, zatem robimy ograniczenie analogiczne do necessaryCarsForZ 
tylko że dla maksa, którym jest cała pula radiowozów*/

minimize totalCars: k;
/*funkcja celu, minimalizacja dostępnej puli radiowozów */


data;
set P := p1 p2 p3;

set Z := z1 z2 z3;

param lowerLimit :  z1  z2  z3 :=
                p1  2   4   3
                p2  3   6   5
                p3  5   7   6;

param upperLimit :  z1  z2  z3 :=
                p1  3   7   5
                p2  5   7   10
                p3  8   12   10;

param lowerLimitZ :=    z1 10
                        z2 20
                        z3 18;

param lowerLimitP :=    p1 1    
                        p2 14
                        p3 13;