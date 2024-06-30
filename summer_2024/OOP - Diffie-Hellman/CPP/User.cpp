#include "User.h"
#include "DHSetup.h"
#include <random>

template <typename T>
User<T>::User(DHSetup<T>* obj) {
    secret = rand();
    dhsetup = obj;
}

template <typename T>
T User<T>::getPublicKey() {
    return dhsetup->power(dhsetup->getGenerator(), secret);
}

template <typename T>
void User<T>::setKey(T a) {
    cryptingKey = dhsetup->power(a, secret);
}

template <typename T>
T User<T>::encrypt(T m) {
    return m * cryptingKey;
}   

template <typename T>
T User<T>::decrypt(T c) {
    return c / cryptingKey;
}
