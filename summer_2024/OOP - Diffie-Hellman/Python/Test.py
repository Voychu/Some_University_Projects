from Field import Field
from DHSetup import DHSetup
from User import User

f = Field(1234567891)
f2 = Field(71830)

d = DHSetup[Field](Field)

u = User[Field](Field, d)

print("Generator: ", d.getGenerator().getValue())

pubKey = u.getPublicKey()
print("Pubkey: ", pubKey.getValue())

u.setKey(f)
print("Message: ", f2.getValue())

mEncrypted = u.encrypt(f2)
print("Encrypted: ", mEncrypted.getValue())

mDecrypted = u.decrypt(mEncrypted)
print("Decrypted: ",mDecrypted.getValue())

#fajnie dziala - generalnie dla pythona to z  import type ze stacka przeczytaj i dla javy to z instantiate class ze tak nie mozna? i ta ekstra metoda
#co to wywoluje; a tak to chyba gitem jest