print("Merhaba EtiyaAkademi")
text = "10"
print(text)


#! integer= Tam Sayı
number = 10
print(number)
print("----------------------------")

#! double, float, decimal = ondalıklı sayı
dnumber = 5.3
print(dnumber)
print("----------------------------")

#! boolean, bool Ture or False değerini alabilir
bnumber = True
bnumber2= False
print(bnumber,bnumber2)
print("----------------------------")

#! Matematiksel operatörler
print(number+5)
print(number-5)
print(number*5)
print(number/5)
print(number%3) #*Mod operatörüdür, 10/5 = 0  bölümden kalanı verir
print("----------------------------")

#! Mantıksal (karşılaştırma) operatörler !!>>!! Her mantıksal operatör boolean değer döner
print(1 == 2)
print(2 != 2)

print(2>=2)
print(2<=2)
print(10%2==0)
print("----------------------------")


#! String Operasyonları
text = "Merhaba Etiya"
print(text.upper()) # .upper() bir fonksiyondur
print(text.lower())
print(text.startswith("M")) #startswith ilgili textin () içinde ki değerle başladığına bakar
print(text.endswith("Etiya"))

name = "ömer"
age = 22
ageS = "22"
company = "etiya"
print("----------------------------")

#! Halit 23 yaşında Kodlamaio'da çalışıyor
print(name + " " + ageS + " yaşında " + company + "'de çalışıyor")
print(f"{name} {age} yaşında {company}'de çalışıyor") #başa f koymak süslü parantez açıp kapatınca değişken olduğunu belirtilr
print("----------------------------")
#!kodlama.io
baslik = 'Haberr'
vadeOrani = 12
FO1 = 1.47
FO2 = 1.44
FO = 1.5

print(baslik)
print(type(baslik))
print(type(vadeOrani))
print(type(FO1))

message = "Welcome"
customerName = "ömer"
customerSurname = "adıgüzel"
finalMessage = message + " " + "IO.Bank" + " " + customerName + " " + customerSurname
print(finalMessage)

number1 = 10.5
number2 = 20
print(number1+number2)
result = number1+number2
print(type(result))
print("----------------------------")

