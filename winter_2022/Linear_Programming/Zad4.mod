set M;
/* bok prostokąta - kolumny */

set N;
/* bok prostokąta - wiersze*/

set Containers dimen 2;
/*współrzędne kwadratów, na których są kontenery*/

param containerPresent{n in N, m in M} binary;
/*parametr mówiący, czy na danym kwadracie mamy kontener, 0-nie, 1-tak*/

param cameraRange;
/*zasięg kamery*/

var x{n in N, m in M} binary;
/* zmienna mówiąca czy na danym polu jest kamera: 1-tak, 0-nie*/

s.t. cameraNotOnContainer{n in N, m in M}: if containerPresent[n,m]=1 then x[n,m]=0;
/*ograniczenie mówiące, że jak na danym polu jest kontener to nie może tam być kamery*/

s.t. containerInRangeOfCamera{(n,m) in Containers}: sum{i in max(n-cameraRange,1)..min(n+cameraRange,card(N))}x[i,m] + sum{j in max(m-cameraRange,1)..min(m+cameraRange,card(M))}x[n,j]>=1;
/* ograniczenie, że każdy kontener musi być w zasięgu co najmniej 1 kamery*/

minimize totalNoOfCameras: sum{n in N,m in M}x[n,m];
/*sumujemy wszystkie 1 (wystąpienia kamer) i chcemy, aby ta suma była jak najmniejsza*/

printf{n in N,m in N}: if containerPresent[n,m] then 'Container at %d,%d \n' ,n,m;

data;

set M := 1 2 3 4 5;

set N := 1 2 3 4 5;

param cameraRange := 1;

param containerPresent :    1   2   3   4   5   :=
                        1   1   0   0   0   1
                        2   1   0   0   1   1
                        3   0   1   0   0   0
                        4   0   1   0   0   0
                        5   1   0   0   0   1;

set Containers := (1,1) (1,5) (2,1) (2,4) (2,5) (3,2) (4,2) (5,1) (5,5);

