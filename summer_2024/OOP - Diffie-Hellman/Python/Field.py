    
P = 1234577

class Field:

    def _numberToField(self, x):
        return ((x % P) + P) % P
        
    def _inverse(self, a):
        m = P
        x = 1
        y = 0

        while a > 1:
            quotient = a // m
            t = m

            m = a % m
            a = t
            t = y

            y = x - quotient * y
            x = t

        if x < 0:
            x += P

        return x

    def __init__(self,value=0):
        self.value = self._numberToField(value)

    def __assign__(self, obj):
        self = obj

    def __add__(self, obj):
        res = Field()
        res.value = res._numberToField(self._numberToField(self.value) + obj._numberToField(obj.value))
        return res

    def __sub__(self, obj):
        res = Field()
        res.value = res._numberToField(self._numberToField(self.value) - obj._numberToField(obj.value))
        return res

    def __mul__(self, obj):
        res = Field()
        res.value = res._numberToField(self._numberToField(self.value) * obj._numberToField(obj.value))
        return res


    def __truediv__(self, obj):
        if obj.value == 0:
            raise ZeroDivisionError("Nie można obliczyć odwrotności 0 w ciele")
        res = Field()
        res.value = res._numberToField(self._numberToField(self.value) * obj._inverse(obj.value))
        return res

    def __floordiv__(self, obj):
        res = Field()
        res.value = res._numberToField(self._numberToField(self.value) * obj._inverse(obj.value))
        return res

    def __iadd__(self, obj):
        self.value = self._numberToField(self._numberToField(self.value) + obj._numberToField(obj.value))
        return self

    def __isub__(self, obj):
        self.value = self._numberToField(self._numberToField(self.value) - obj._numberToField(obj.value))
        return self

    def __imul__(self, obj):
        self.value = self._numberToField(self._numberToField(self.value) * obj._numberToField(obj.value))
        return self

    def __idiv__(self, obj):
        self.value = self._numberToField(self._numberToField(self.value) * obj._inverse(obj.value))
        return self

    def __ifloordiv__(self, obj):
        self.value = self._numberToField(self._numberToField(self.value) * obj._inverse(obj.value))
        return self
    
    def __eq__(self,obj):
        if(self.value == obj.value):
            return True
        return False
    
    def __ne__(self,obj):
        if(self.value != obj.value):
            return True
        return False

    
    def __ge__(self,obj):
        if(self.value >= obj.value):
            return True
        return False

    
    def __le__(self,obj):
        if(self.value <= obj.value):
            return True
        return False

    
    def __lt__(self,obj):
        if(self.value < obj.value):
            return True
        return False
    
    def __gt__(self,obj):
        if(self.value > obj.value):
            return True
        return False
    
    def getCharacteristics(self):
        return P
    
    def getValue(self):
        return self.value
    


