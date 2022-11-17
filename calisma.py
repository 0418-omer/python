baslik = "haberiniz olsun"
vade = 12
faizOranı1 = 1.47
faizOranı2 = 1.44


print(baslik)
print(type(baslik))
print(type(vade))
print(type(faizOranı1))


mesaj = "hoş geldin"
musteriAdi = "Ömer"
musteriSoyadi = "adiguzel"
sonucMesaj = mesaj + musteriAdi + musteriSoyadi + "!"

print(sonucMesaj)


sayi1 = 23
sayi2 = 45
print(sayi1 + sayi2)


dolarBugun = 18.66
dolarDun = 18.56

if dolarDun>dolarBugun:
    print("azalış oku")
    print("bitti")
    
elif dolarDun<dolarBugun:
    print("artış oku")
    print("bitti")

else:
    print("eşittir")
    print("bitti")