-- 1/ Créer la base donnée sous nom "boutique".

CREAT DATABASE boutique;
-- 2/ Création des tables (Manufacturers, Products).

CREATE TABLE Manufacturers (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Code)   
);

CREATE TABLE Products (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL ,
  Price DECIMAL NOT NULL ,
  Manufacturer INTEGER NOT NULL,
  PRIMARY KEY (Code), 
  FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
) 


-- 3/ Insérer dans le tableau Manufacturers les valeurs : 

-- (Code, Name)(1,Sony)(2,Creative Labs)(3,Hewlett-Packard)(4,Iomega)(5,Fujitsu)(6,Winchester)
INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');
INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');
INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');
INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');
INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');
INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester');


-- 4/ Insérer dans le tableau Products : 
-- (Code,Name,Price,Manufacturer) (1,Hard drive,240,5) (2,Memory,120,6) (3,ZIP drive,150,4) (4,Floppy disk,5,6) (5,Monitor,240,1)
-- (6,DVD drive,180,2) VALUES(7,CD drive,90,2) VALUES(8,Printer,270,3) (9,Toner cartridge,66,3) (10,DVD burner,180,2)
-- (6,DVD drive,180,2) VALUES(7,CD drive,90,2) VALUES(8,Printer,270,3) (9,Toner cartridge,66,3) (10,DVD burner,180,2)

INSERT INTO product  (Code,Name,Price,Manufacturer) 
VALUES
(1,'Hard drive',240,5),
(2,'Memory',120,6),
(3,'ZIP drive',150,4),
(4,'Floppy disk',5,6),
(5,'Monitor',240,1),
(6,'DVD drive',180,2),
(7,'CD drive',90,2),
(8,'Printer',270,3),
(9,'Toner cartridge',66,3),
(10,'DVD burner',180,2);



-- 5/ Sélectionnez les noms de tous les produits du magasin.

select Name from Products;


-- 6/ Sélectionner les noms et les prix de tous les produits du magasin.

select name, price from products;


-- 7/ Sélectionner le nom des produits dont le prix est inférieur ou égal à 200 $.

select name from products where price <= 200;


-- 8/ Sélectionnez tous les produits dont le prix est compris entre 60 et 120 dollars.
select * from products where price between 60 and 120;


-- 9/ Sélectionnez le nom et le prix en cents (c'est-à-dire que le prix doit être multiplié par 100).

select name, price*100 from products;

-- 10/ Calculer le prix moyen de tous les produits.
SELECT AVG (Pric) FROM products ;

-- 11/ Calculer le prix moyen de tous les produits dont le code fabricant est égal à 2.
select avg(price) from products where  Manufacturer = 2;

-- 12/ Calculer le nombre de produits dont le prix est supérieur ou égal à 180 dollars.
select count(*) from products where price>=180;



-- 13/ Sélectionner le nom et le prix de touproduitss les produits dont le prix est supérieur ou égal à 180 dollars, et trier d'abord par prix (par ordre décroissant), puis par nom (par ordre croissant).
select name, price from products where price>=180 order by price desc, name asc;

-- 14/ Sélectionnez toutes les données des , y compris toutes les données relatives au fabricant de chaque produit.
SELECT *FROM products INNER JOIN Manufacturers ON products.Manufacturer =Manufacturers.Code

-- 15/ Sélectionnez le nom du produit, le prix et le nom du fabricant de tous les produits.

SELECT Products.Name, Price, Manufacturers.Name
   FROM Products INNER JOIN Manufacturers
   ON Products.Manufacturer = Manufacturers.Code;


-- 16/ Sélectionnez le prix moyen des produits de chaque fabricant, en indiquant uniquement le code du fabricant.

SELECT AVG(Price), Manufacturer
    FROM Products
GROUP BY Manufacturer;
-- 17/ Sélectionnez le prix moyen des produits de chaque fabricant, en indiquant le nom du fabricant.

select avg(a.price), b.name 
from Products a join Manufacturers b 
on a.manufacturer = b.code
group by b.name;

-- 18/ Sélectionnez les noms des fabricants dont les produits ont un prix moyen supérieur ou égal à 150 $.

SELECT AVG(Price), Manufacturers.Name
   FROM Products, Manufacturers
   WHERE Products.Manufacturer = Manufacturers.Code
   GROUP BY Manufacturers.Name
   HAVING AVG(Price) >= 150;

-- 19/ Sélectionnez le nom et le prix du produit le moins cher.

SELECT name,price
  FROM Products
  ORDER BY price ASC
  LIMIT 1;
-- 20/ Sélectionnez le nom de chaque fabricant ainsi que le nom et le prix de son produit le plus cher.
 SELECT MAX(Price) AS max_prix , manufacturers.Name AS manifacture_name , products.Name AS product_name FROM products 
 INNER JOIN manufacturers ON products.Manufacturer = manufacturers.Code GROUP BY manufacturers.Name

-- 21/ Ajouter un nouveau produit : Loudspeakers, 70 $, manufacter 2 
INSERT INTO products ('Code' , 'Name' , 'Price' , 'Manufacturer') VALUES (11, Loudspeakers , 70 , 2)

-- 22/ Mettre à jour le nom du produit 8 en "laser Print".

update products
set name = 'Laser Printer'
where code=8;
-- 23/ Appliquer une remise de 10 % à tous les produits.
update products
set price=price*0.9;

-- 24/ Appliquer une remise de 10 % à tous les produits dont le prix est supérieur ou égal à 120 $.
update products
set price = price * 0.9
where price >= 120; 



-- NB: manufacturer c'est le fabricant