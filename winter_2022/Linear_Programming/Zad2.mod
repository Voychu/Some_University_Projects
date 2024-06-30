set N;
/*wierzchołki*/

param travelCost{i in N,j in N};
/*koszt połączenia*/

param travelTime{i in N,j in N};
/*czas połączenia*/

param maxTime;
/*nieprzekraczalny czas*/

param nb;

param nf;

var x{i in N,j in N}>=0;

s.t. timeBelowMaxTime: sum{i in N, j in N} x[i,j]*travelTime[i,j]<=maxTime;
s.t. startCity: sum{i in N} x[nb,i] - sum{i in N} x[i,nb] = 1;
s.t. endCity: sum{i in N} x[nf,i] - sum{i in N} x[i,nf] = -1;
s.t. ciagloscTrasy{m in N diff {nb,nf}}: sum{i in N} x[m,i] - sum{i in N} x[i,m]=0;
minimize totalCost: sum{i in N,j in N} if(travelCost[i,j]<>0) then x[i,j]*travelCost[i,j] else 0;


data;

set N := 1 2 3 4 5 6 7 8 9 10;

param travelCost :  1    2   3   4   5   6   7   8   9   10  :=
                1   0   20  30  40  50  60  70  80  90  100
                2   20  0   40  30  50  10  15  20  30  50
                3   30  40  0   10  70  60  50  40  20  10
                4   40  30  10  0   50  10  5   60  100 5
                5   50  50  70  50  0   10  20  30  15  10
                6   60  10  60  10  10  0   70  30  25  15
                7   70  15  50  5   20  70  0   10  110 20
                8   80  20  40  60  30  30  10  0   50  20
                9   90  30  20  100 15  25  110 50  0   10
                10  100 50  10  5   10  15  20  20  30  0;

param travelTime :  1   2   3   4   5   6   7   8   9   10  :=
                1   0   100 90  80  70  60  50  40  30  20
                2   100 0   80  90  70  110 105 100 90  70
                3   90  80  0   110 50  60  70  80  30  110
                4   80  90  110 0   70  110 115 60  20  115
                5   70  70  50  70  0   110 100 90  105 110
                6   60  110 60  110 110 0   50  90  95  105
                7   50  105 70  115 100 50  0   110 10  100
                8   40  100 80  60  90  90  110 0   70  100
                9   30  90  100 20  105 95  10  70  0   110
                10  20  70  110 115 110 105 100 100 90  0; 

param nb := 7;
param nf :=4;
param maxTime := 50;

