#include "Field.h"

long long value;

long long Field::numberToField(long long x) {
    return ((x % P) + P) % P;
}


long long Field::inverse(long long a){
    long long m = P;
    long long x = 1;
    long long y = 0;

    while(a > 1) {
        long long quotient = a / m;
        long long t = m;

        m = a % m;
        a = t;
        t = y;

        y = x - quotient * y;
        x = t;
    }

    if(x < 0)
        x += P;

    return x;
}



//PUBLIC

Field::Field(){
    value = numberToField(0);
}

Field::Field(long long val){
    value = numberToField(val);
    //value = val % P;
}



long long Field::getValue(){
    return value;
}
long long Field::getCharacteristic(){
    return P;
}

//dwa podejscia - zwracam long longa (i nadpisuje value tego po lewej), albo zwracam nowego fielda (tak chyba sensowniej)
Field Field::operator+(Field const& obj){

   Field result(0); 
   result.value = numberToField(numberToField(value) + numberToField(obj.value));
   return result;
}

Field Field::operator-(Field const& obj){

   Field result(0); 
   result.value = numberToField(numberToField(value) - numberToField(obj.value));
   return result;
}

Field Field::operator*(Field const& obj){

   Field result(0); 
   result.value = numberToField(numberToField(value) * numberToField(obj.value));
   return result;
}

Field Field::operator/(Field const& obj){

   if(obj.value == 0){
    throw "Nie można policzyć odwrotności dla 0 w ciele";
   }
   Field result(0);
   result.value = numberToField(numberToField(value) * inverse(obj.value));
   return result;
}

void Field::operator+=(Field const& obj){
    value = numberToField(numberToField(value) + numberToField(obj.value));
}

void Field::operator-=(Field const& obj){
    value = numberToField(numberToField(value) - numberToField(obj.value));
}

void Field::operator*=(Field const& obj){
    value = numberToField(numberToField(value) * numberToField(obj.value));
}

void Field::operator/=(Field const& obj){
    value = numberToField(numberToField(value) * inverse(obj.value));
}

Field& Field::operator=(Field const& obj){
    value = numberToField(obj.value);
    return *this;
}

bool Field::operator==(Field const& obj){
    if(value == obj.value)
        return true;
    return false;
}
bool Field::operator!=(Field const& obj){
    if(value != obj.value)
        return true;
    return false;
}
bool Field::operator<=(Field const& obj){
    if(value <= obj.value)
        return true;
    return false;
}
bool Field::operator>=(Field const& obj){
    if(value >= obj.value)
        return true;
    return false;
}
bool Field::operator<(Field const& obj){
    if(value < obj.value)
        return true;
    return false;
}
bool Field::operator>(Field const& obj){
    if(value > obj.value)
        return true;
    return false;
}

std::ostream &operator<<(std::ostream &os, Field obj)
{
    os << obj.getValue();
    return os;
}
