#pragma once
#include <random>
#include "DHSetup.h"

template <typename T> 
class User{
    private:
        DHSetup<T>* dhsetup;
        T cryptingKey;
        long secret;
    public:
        User(DHSetup<T>* obj);
        T getPublicKey();
        void setKey(T a);
        T encrypt(T m);
        T decrypt(T m);
};

#include "User.cpp"