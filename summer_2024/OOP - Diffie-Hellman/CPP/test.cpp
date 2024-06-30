#include <iostream>
#include "DHSetup.h"
#include "Field.h"
#include "User.h"

int main() {


    //albo jest coś popsute z konstruktorem i domyslny kostruktor (value 0) psuje przez co dhsetup zawsze tworzy taki i dlatego generator jest 0;
    //ewentualnie w powerze pogrzeb i w tej funkcji bo power jest T do longa, a ja tam wsadzałem inta ale jak teraz dalem tam obiekt to caly czas w powerze printuje 0 
    //ehhhhhhhhhhhhhhhhh napraw to (moze w sobotę w drodze powrotnej teraz juz sie nie chce mi)

    
    Field f2(71830);
    

    DHSetup<Field> d;
    
    std::cout << "Generator: " << d.getGenerator().getValue() << std::endl;

    User<Field> u(&d);

    User<Field> u2(&d);

    u.setKey(u2.getPublicKey());
    u2.setKey(u.getPublicKey());
    
    std::cout << "message: " << f2 << std::endl;
    Field mEncrypted = u.encrypt(f2);
    std::cout << "encrypted: " << mEncrypted << std::endl;
    Field mDecrypted = u2.decrypt(mEncrypted);
    std::cout << "decrypted: " << mDecrypted << std::endl;
    
    return 0;
}
