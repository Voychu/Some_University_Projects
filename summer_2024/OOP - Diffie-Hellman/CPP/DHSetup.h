#pragma once
#include <vector>
#include <random>
#include "Field.h"

template <typename T> 
class DHSetup{
    private:
        const int importantValue = 1234576;
        T generator;
        std::vector<int> sieveOfEratosthenes(int n);
    public:
        DHSetup();
        T getGenerator();
        T power(T a, unsigned long b);
};

#include "DHSetup.cpp" //nie wiem czemu ale potrzebne???