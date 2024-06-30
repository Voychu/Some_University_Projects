#pragma once
#include <iostream>


class Field{
    private:
        const long long P = 1234577;
        long long value;  
        long long numberToField(long long a);
        long long inverse(long long a);

    public:
        long long getValue();
        long long getCharacteristic();
        Field();
        Field(long long value);
        Field operator+(Field const& obj);
        Field operator-(Field const& obj);
        Field operator*(Field const& obj);
        Field operator/(Field const& obj);
        void operator+=(Field const& obj);
        void operator-=(Field const& obj);
        void operator*=(Field const& obj);
        void operator/=(Field const& obj);
        Field& operator=(Field const& obj);
        bool operator==(Field const& obj);
        bool operator!=(Field const& obj);
        bool operator<=(Field const& obj);
        bool operator>=(Field const& obj);
        bool operator<(Field const& obj);
        bool operator>(Field const& obj);
        friend std::ostream &operator<<(std::ostream &os, Field obj);

};