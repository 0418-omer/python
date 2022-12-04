--1 nolu sorgu : Kargo şirketlerine toplam kaç para ödendiğini hesaplayınız.
select SUM(s.shipping_price) as "ödenen toplam tutar" from shipping_company s
inner join orders o
on o.shipping_company_id = s.id;

--2 nolu sorgu : Halihazırda indirimli ve isminde 'b' geçen tüm ürünleri listeleyiniz.
select p.name, d.min_basket_amount, d.price_after_discount from products p
inner join brand_discount br
on p.brands_id = br.id
inner join discounts d
on br.discounts_id = d.id
where p.name like '%b%'

--3 nolu sorgu : 3. harfi ş olan tüm ürünleri listeleyiniz.
select * from products
where name like '__ş%'

--4 nolu sorgu : Bir kişinin sipariş oluştururken kullanacağı insert komutlarını yazınız (alt tablolar dahil ve siparişte en az 3 ürün olacak şekilde)
insert into shopping_basket(products_id,discounts_id,quantity,total_price) 
values (1,1,1,100)

insert into orders(products_sellers_id,shipping_company_id,customer_id,delivery_date) 
values (1,1,1,'03.12.2022')


--5 nolu sorgu ?:  Sipariş oluşturduktan sonra sepeti boşaltacak update komutlarını oluşturunuz
update shopping_basket set products_id = 1,discounts_id = 1, quantity = 0, total_price = 0
where id = 1;

truncate shopping_basket

--6 nolu sorgu : İndirim halindeki ürünlerin indirim uygulanmış fiyatlarıyla listelenmesini sağlayınız.
select p.name,d.discount_amount, d.price_after_discount from products p
inner join brand_discount br
on p.brands_id = br.id
inner join discounts d
on br.discounts_id = d.id

--7 nolu sorgu : Kullanıcı bir ürünü review ettiğinde (puanladığında) oluşacak insert! komutunu geliştiriniz. 


insert into products(name,description,reviews,brands_id,categories_id,product_colors_id)
values ('kazak','800',45,1,'6','1');
select reviews from products
where name ='kazak'



--8 nolu sorgu : Kullanıcı bir ürün iade etmek istediğinde oluşacak insert komutunu geliştiriniz.
insert into returns (product_orders_id, return_date, return_reason, refund_amount)
values (1, '03.12.2022', 'Beden uyumsuzluğu', 1)

--9 nolu sorgu : İade durumları değiştiğinde oluşacak update komutunu geliştiriniz.
update returns set return_reason = 'İade değişikliği'
from returns r inner join product_orders_id poi on r.product_orders_id = poi.id 
where poi.id = 1 

--10 nolu sorgu : Satıcı ürünü güncellemek istediğinde oluşacak örnek bir update komutu geliştiriniz
update products set name = 'güncellenecek ad', description='güncellenecek açıklama', reviews='güncellenecek review'
from produsts p inner join product_sellers ps on p.id=ps.products_id 
where ps.sellers_id = 1

--11 nolu sorgu : Sipariş durumu (kargoda,taşımada vs) değiştiğinde tabloda değişikliği yapacak update komutunu geliştiriniz.

UPDATE shipping_company 
SET description= 'teslim dildi '
WHERE id = 1;

-- 12 nolu sorgu : Kullanıcı sepete ürün eklediğinde oluşacak insert komutunu geliştiriniz.

select * from shopping_basket
INSERT INTO customers (name, surname,  email, phone) VALUES ('Ömer','adıgüzel','@etiya.com','05636488');
INSERT INTO products( name,description,reviews,brands_id,categories_id,product_colors_id) VALUES ('mont','pamuk mont',' * ' ,'1','1','1');
INSERT INTO shopping_basket ( products_id,discounts_id,quantity, total_price ) VALUES ('7','1','8','888');

--13 nolu sorgu ;EN az 2 farklı şehirde adresi olan ve bu adreslere en az 1 adet sipariş vermiş kullanıcıları listeleyiniz.

select c.name, c.surname , count(ad.cities_id),min(ad.cities_id) from customers as c
full outer join addresses as ad
on c.id = ad.customers_id
full outer join countries as co 
on ad.id = co.id
full outer join cities as ci 
on co.id = ci.id
GROUP BY c.name ,c.surname , ad.cities_id
having ad.cities_id> 1


--14 nolu sorgu ;En az bir sipariş vermiş ancak hiç "MNG Kargo" kullanmamış müşterileri listeleyiniz

select * from customers c
full outer join orders o
on c.id = o.id
full outer join shipping_company sp
on sp.id = o.id
where  not company_name ='mng'



--15 nolu sorgu ;En az 2 farklı ülkede adresi olan kullanıcıları listeleyiniz.



select c.name, c.surname , count(ci.countries_id) from customers as c
full outer join addresses as ad
on c.id = ad.customers_id
full outer join countries as co 
on ad.id = co.id
full outer join cities as ci 
on co.id = ci.id
GROUP BY c.name ,c.surname , ci.countries_id
having ci.countries_id> 0

--16 nolu sorgu ;En az bir adet aynı üründen 10+ sipariş vermiş kullanıcıları ve ürünü listeleyiniz.

select  c.name , count( po.products_id) as numara from customers c
full outer join product_orders po
on c.id= po.id
full outer join orders o
on o.id = po.id
full outer join products p
on p.id = o.id
GROUP BY c.name , po.products_id
having po.products_id> 0

-- 17 nolu sorgu ;Kullanıcı sepetteki ürün adetini artırdığında oluşacak komutu geliştiriniz.

UPDATE shopping_basket
SET quantity= '24 '
WHERE id = 9;

-- 18 nolu sorguSatıcı ürünü güncellemek istediğinde oluşacak örnek bir update komutu geliştiriniz.


UPDATE product_sellers
SET unit_price ='566', quantity = '10'
WHERE id = 1;

		
--19 nolu Onaylanmamış ödemeleri listeleyiniz.


SELECT * FROM payment_information
WHERE description='ödeme yapılmadı';

--20 nolu sorgu ;Eklenmiş ancak hiç bir siparişte kullanılmamış adresleri listeleyiniz.

select ad.title , ci.name, co.name from product_orders od
full outer join orders o on od.orders_id = o.id
full outer join customers cu on o.id = cu.id
full outer join addresses ad on cu.id = ad.customers_id
full outer join cities ci on ad.cities_id = ci.id
full outer join countries co on ci.countries_id = co.id
where od.orders_id is null

