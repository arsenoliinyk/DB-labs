-- 1. БД «Комп. фірма». Знайти номер моделі, об’єм пам’яті та розміри
-- екранів ноутбуків, ціна яких перевищує 1000 дол. Вивести: model, ram,
-- screen, price. Вихідні дані впорядкувати за зростанням за стовпцем
-- ram та за спаданням за стовпцем price.

select model, ram, screen, price from Laptop
where price > 1000
order by ram asc, price desc;


-- 2. БД «Кораблі». Знайти всі кораблі, імена класів яких закінчуються
-- літерою 'o', але не на 'go'.

select * from Ships
where class like '%o' and not '%go';


-- 3. БД «Комп. фірма». Вкажіть виробника для тих ноутбуків, що мають
-- жорсткий диск об’ємом не менше 10 Гбайт. Вивести: maker, type,
-- speed, hd.

-- 1 спосіб

select maker, type, speed, hd from Product join Laptop on Product.model = Laptop.model
where hd >= 10;

-- 2 спосіб

-- select maker, type, speed, hd from Product, Laptop
-- where hd >= 10 and product.model = laptop.model;


-- 4. БД «Комп. фірма». Знайдіть виробників, що випускають ПК, але не
-- ноутбуки (використати ключове слово ALL). Вивести maker.

select distinct(maker) from Product
where maker = some(select maker from Product where `type` = 'PC') and 
	maker != all(select maker from Product where `type` = 'Laptop');
	
	
-- 5. БД «Комп. фірма». Знайдіть виробників, які б випускали одночасно
-- ПК та ноутбуки зі швидкістю 750 МГц та вище. Виведіть: maker..

select distinct maker from Product join PC on Product.model=PC.model
where speed>=750 and maker in ( select maker from Product join Laptop on Product.model=Laptop.model
where speed>=750 );


-- 6. БД «Фірма прий. вторсировини». З таблиці Income виведіть дати в
-- такому форматі: рік.число_місяця.день, наприклад, 2001.02.15 (без
-- формату часу).

select date_format(date, '%Y.%m.%d') as date
from Income;


-- 7. БД «Комп. фірма». Знайти тих виробників ПК, усі моделі ПК яких є
-- в наявності в таблиці PC (використовувати засоби групової
-- статистики). Вивести maker.

select Product.maker from Product left join pc on PC.model = Product.model
where Product.type = 'PC'
group by Product.maker
having COUNT(Product.model) = COUNT(PC.model)


-- 8. БД «Комп. фірма». Для кожного виробника знайдіть середній
-- розмір екрану для ноутбуків, що ним випускається. Вивести: maker,
-- середній розмір екрану. (Підказка: використовувати підзапити в
-- якості обчислювальних стовпців)

select product.maker, avg(screen) from laptop join product on product.model = laptop.model
group by product.maker





-- 10. БД «Комп. фірма». Знайдіть середню ціну ПК та ноутбуків, що
-- випущені виробником 'A'. Вивести: одне число для загальної середньої
-- ціни. (Підказка: використовувати оператор UNION)

select sum(s.price)/sum(s.kol) as avr from
(select price,1 as kol from PC, Product
 where PC.model=Product.model and Product.maker='A'
union all
 select price,1 as kol from Laptop,Product
 where Laptop.model=Product.model and Product.maker='A') as s