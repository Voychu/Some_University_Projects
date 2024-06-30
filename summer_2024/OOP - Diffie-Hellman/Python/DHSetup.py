from typing import List, TypeVar, Generic, Type
from Field import P
from Field import Field
import random

T = TypeVar('T')
class DHSetup(Generic[T]):

    def sieveOfEratosthenes(self, n):

        primes = []

        prime = [True for i in range(n+1)]
        p = 2
        while (p*p <= n):
            if(prime[p == True]):
                for i in range(p * p, n+1, p):
                    prime[i] = False
            p += 1

        for p in range(2, n+1):
            if prime[p]:
                primes.append(p)

        return primes
    
    def __init__(self, member_class: Type[T]):
        found = False
        self.generator = None

        while(not found):
            
            chosen = random.randint(2,P-1)
            self.generator = member_class(chosen)
            primesSmallerThanP = self.sieveOfEratosthenes(chosen)
            isGenerator = True


            for i in range(0,len(primesSmallerThanP)):
                if (P-1) % primesSmallerThanP[i] == 0:
                    if self.power(self.generator, ((P-1)/primesSmallerThanP[i])) == Field(1):
                        isGenerator = False
                        break
            
            if isGenerator:
                self.generator = member_class(chosen) #???
                found = True

        
    def getGenerator(self) -> T:
        return self.generator
    
    def power(self, a: T, b) -> T:
        res = a
        while b>0:
            if b%2 == 1:
                res = res*a
            a = a*a
            b /= 2

        return res
    