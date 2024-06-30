import java.util.ArrayList;
import java.security.SecureRandom;

public class DHSetup<T extends Field> {
    
    private T generator;
    private Class<T> fieldType;

    private ArrayList<Long> sieveOfEratosthenes(int n){

        ArrayList<Long> primes = new ArrayList<>();
        boolean prime[] = new boolean[n+2];
        prime[0] = false;
        prime[1] = false;

        for (int p = 2; p * p <= n; p++) {
            if (prime[p]) {
                for (int i = p * p; i <= n; i += p)
                    prime[i] = false;
            }
        }
    
        for (int p = 2; p <= n; p++) {
            if (prime[p])
                primes.add((long) p);
        }
    
        return primes;

    }

    public DHSetup(Class<T> fieldType) {
        this.fieldType = fieldType;
        SecureRandom rd = new SecureRandom();
        boolean found = false;
        while (!found) {
            int chosen = rd.nextInt((int) (Field.getCharacteristic() - 2)) + 2;
            generator = createInstance(chosen);
            ArrayList<Long> primesSmallerThanP = sieveOfEratosthenes(chosen);
            boolean isGenerator = true;
    
            for (long i : primesSmallerThanP) {
                if ((Field.getCharacteristic() - 1) % i == 0) {
                    if (power(generator, (Field.getCharacteristic() - 1) / i).getValue() == 1) {
                        isGenerator = false;
                        break;
                    }
                }
            }
    
            if (isGenerator) {
                generator = createInstance(chosen);
                found = true;
            }
        }
    }

    private T createInstance(int value) {
        try {
            return fieldType.getDeclaredConstructor(long.class).newInstance((long) value);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public T getGenerator(){
        return generator;
    }

    public T power(T a, long b){
        T res = a;
        while(b>0){
            if(b%2 == 1){
                res.assign(res.mul(a));
            }
            a.assign(a.mul(a));
            b /= 2;
        }
        return res;
    }
}