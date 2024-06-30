import java.util.Random;

public class User<T extends Field> {

    private DHSetup<T> dhsetup;
    private T cryptingKey;
    private long secret;

    public User(DHSetup<T> obj){
        Random random = new Random();
        secret = random.nextLong();
        dhsetup = obj;
    }

    public T getPublicKey(){
        return dhsetup.power(dhsetup.getGenerator(),secret);
    }

    public void setKey(T a){
        this.cryptingKey = dhsetup.power(a,secret);
    }

    public T encrypt(T m){
        T res = m;
        res.assign(m.mul(cryptingKey));
        return res;
    }

    public T decrypt(T c){
        T res = c;
        res.assign(c.div(cryptingKey));
        return res;
    }
    
}
