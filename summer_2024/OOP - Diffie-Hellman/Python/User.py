from typing import  TypeVar, Generic, Type
from Field import P
from DHSetup import DHSetup
import random
import sys

cryptingKey = None
secret = None
dhsetup = None

T = TypeVar('T')
class User(Generic[T]):

    def __init__(self, member_class: Type[T], obj):
        self.secret = random.randint(0,sys.maxsize)
        self.dhsetup = obj

    def getPublicKey(self) -> T:
        return self.dhsetup.power(self.dhsetup.getGenerator(),self.secret)

    def setKey(self,a: T) -> T:
        self.cryptingKey = self.dhsetup.power(a,self.secret)

    def encrypt(self,m: T) -> T:
        return m*self.cryptingKey
    
    def decrypt(self,c: T) -> T:  
        return c/self.cryptingKey