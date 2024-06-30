
set P;
/*produkty*/

set M;
/*maszyny*/

param pricePerKgSell{p in P};
/*cena za kg*/

param machineAccessTime{m in M};
/*czas dostępności maszyn*/

param pricePerHourOfWork{m in M};
/*koszt pracy maszyny na godzinę*/

param pricePerKgMake{p in P};
/*cena za kg materiałów do produkcji produktu*/

param maxDemand{p in P};
/*maksymalny popyt produktu*/

param machineTimeForProduct{p in P,m in M};
/*czas ile minut dana maszyna robi kilogram danego produktu*/

var x{p in P}>=0;
/*ilosc kg danego produktu*/

s.t. maximumDemand{p in P}: x[p]<=maxDemand[p];
/*ilosc produktu nie moze przekraczac maksymalnego popytu*/

s.t. maximumMachineTimeUsage{m in M}: sum{p in P} (machineTimeForProduct[p,m]*x[p]/60)<=machineAccessTime[m];
/*sumujemy po produktach maszyna i dany produkt * ilość kg danego produktu musi być mniejsza równa maksymalnemu czasu dostępności maszyny (60h)*/

maximize profit: sum{p in P}(x[p]*pricePerKgSell[p]) - sum{p in P}(x[p]*pricePerKgMake[p]) - sum{p in P,m in M}((machineTimeForProduct[p,m]/60)*x[p]*pricePerHourOfWork[m]);
/*funkcja celu - maksymalizacja profitu, sumujemy ceny sprzedaży produktów - koszty produkcji*/

data;

set P := p1 p2 p3 p4;

set M := M1 M2 M3;

param pricePerKgSell := p1 9
                        p2 7
                        p3 6    
                        p4 5;

param pricePerKgMake := p1 4
                        p2 1
                        p3 1
                        p4 1;

param machineAccessTime :=  M1 60
                            M2 60
                            M3 60;

param pricePerHourOfWork := M1 2
                            M2 2
                            M3 3;

param maxDemand :=  p1  400
                    p2  100
                    p3  150
                    p4  500;
                    
param machineTimeForProduct :   M1  M2  M3 :=
                            p1  5   10  6
                            p2  3   6   4
                            p3  4   5   3
                            p4  4   2   1;
/*Tu są minuty! trzeba wziąc pod uwage we wzorze*/
