public class Main {
    
    public static void main(String[] args){
        Field f = new Field(1234567891);
        Field f2 = new Field(71830);
    
        DHSetup<Field> d = new DHSetup(Field.class);
        System.out.println("GENERATOR: " + d.getGenerator().getValue());

        User<Field> u = new User(d);
        u.setKey(f);

        Field pubKey = u.getPublicKey();
        System.out.println("Public key: " + pubKey.getValue());

        System.out.println("Message: " + f2.getValue());
        
        Field mEncrypted = u.encrypt(f2);
        System.out.println("encrypted: " + mEncrypted.getValue());

        Field mDecrypted = u.decrypt(mEncrypted);
        System.out.println("decrypted: " + mDecrypted.getValue());

    }
}
