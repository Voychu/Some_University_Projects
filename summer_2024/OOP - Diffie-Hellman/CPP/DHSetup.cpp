#include "DHSetup.h"
#include <random> 
#include <vector>
#include <cstring>


template <typename T>
std::vector<int> DHSetup<T>::sieveOfEratosthenes(int n) {
    
    std::vector<int> primes;
    bool prime[n + 2];
    memset(prime, true, sizeof(prime));
    prime[0] = false;
    prime[1] = false;
 
    for (int p = 2; p * p <= n; p++) {
        if (prime[p] == true) {
            for (int i = p * p; i <= n; i += p)
                prime[i] = false;
        }
    }

    for (int p = 2; p <= n; p++) {
        if (prime[p])
            primes.push_back(p);
    }

    return primes;
}


template <typename T>
DHSetup<T>::DHSetup(){
    
    std::random_device rd;
    std::uniform_int_distribution<int> dist(2,importantValue);
    bool found = false;

    while(!found){

        int chosen = dist(rd);
        generator = T(chosen);
        std::vector<int> primesSmallerThanP = sieveOfEratosthenes(chosen);
        bool isGenerator = true;

        for(int i = 0; i<primesSmallerThanP.size(); i++){
            if(importantValue % primesSmallerThanP[i] == 0){
                if(power(generator,(importantValue/primesSmallerThanP[i])) == 1){
                    isGenerator = false;
                    break;
                }
            }
        }

        if (isGenerator) {
            generator = T(chosen);
            found = true;
        }
    }
}


template <typename T>
T DHSetup<T>::getGenerator(){
    return generator;
}

template <typename T>
T DHSetup<T>::power(T a, unsigned long b) {
    T res = a;
    while (b > 0) {
        if (b % 2 == 1) {
            res = res * a;
        }
        a = a * a;
        b /= 2;
    }
    return res;
}
