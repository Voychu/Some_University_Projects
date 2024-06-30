public class Field {
    
    private final static long P = 1234577;
    private long value;
    
    private long numberToField(long x){
        return ((x % P) + P) % P;
    }

    private long inverse(long a){
        long m = P;
        long x = 1;
        long y = 0;

        while(a > 1) {
            long quotient = a / m;
            long t = m;

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

    private Field(){
        value = 0;
    }
    
    public Field(long val){
        value = numberToField(val);
    }

    public long getValue(){
        return value;
    }

    public static long getCharacteristic(){
        return P;
    }

    public Field add(Field b){
        Field result = new Field();
        result.value = numberToField(numberToField(value) + numberToField(b.value));
        return result; 
    }
    
    public Field sub(Field b){
        Field result = new Field();
        result.value = numberToField(numberToField(value) - numberToField(b.value));
        return result; 
    }

    public Field mul(Field b){
        Field result = new Field();
        result.value = numberToField(numberToField(value) * numberToField(b.value));
        return result; 
    }

    public Field div(Field b) throws ArithmeticException{
        if(numberToField(b.value) == 0){
            throw new ArithmeticException("Nie można obliczyć odwrotności 0 w ciele");
        }
        Field result = new Field();
        result.value = numberToField(numberToField(value) * inverse(b.value));
        return result; 
    }

    public void assign(Field b){
        this.value = numberToField(b.value);
    }

    public static boolean eq(Field a, Field b){
        return a.value == b.value;
    }

    public static boolean neq(Field a, Field b){
        return a.value != b.value;
    }

    public static boolean geq(Field a, Field b){
        return a.value >= b.value;
    }

    public static boolean leq(Field a, Field b){
        return a.value <= b.value;
    }

    public static boolean gt(Field a, Field b){
        return a.value > b.value;
    }

    public static boolean lt(Field a, Field b){
        return a.value < b.value;
    }
}
