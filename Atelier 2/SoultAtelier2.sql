En se basant sur le fichier sql shema et shema figure:
-- vous devez créer une base données, et imiter les requêtes dans le fichier sql shema.
Exprimer les requêtes suivantes en SQL :
-- 2.1 Sélectionnez le nom de famille de tous les employés.
  SELECT LastName FROM employees

-- 2.2 Sélectionnez le nom de famille de tous les employés, sans doublons.
SELECT DISTINCT LastName FROM employees

-- 2.3 Sélectionnez toutes les données des employés dont le nom de famille est "Smith".
SELECT * FROM employees WHERE LastName = 'Smith' 

-- 2.4 Sélectionnez toutes les données des employés dont le nom de famille est "Smith" ou "Doe".
SELECT * FROM employees WHERE LastName = 'Smith' OR LastName = ‘Doe’

-- 2.5 Sélectionnez toutes les données des employés qui travaillent dans le département 14.
SELECT * FROM employees WHERE Department = 14

-- 2.6 Sélectionner toutes les données des employés qui travaillent dans le département 37 ou le département 77.
SELECT *FROM employees WHERE Department = 77 OR Department= 37

-- 2.7 Sélectionner toutes les données des employés dont le nom de famille commence par un "S".
SELECT *FROM employees WHERE LastName LIKE 'S%'

-- 2.8 Sélectionner la somme des budgets de tous les départements.
SELECT Budget FROM departments

-- 2.9 Sélectionnez le nombre d'employés dans chaque département (vous devez seulement indiquer le code du département et le nombre d'employés).
SELECT SSN , Department FROM employees

-- 2.10 Sélectionnez toutes les données des employés, y compris les données du département de chaque employé.
SELECT * FROM employees

-- 2.11 Sélectionnez le nom et le prénom de chaque employé, ainsi que le nom et le budget du département de l'employé.
SELECT a.name, a.lastname, b.name Department_name, b.Budget FROM employees a JOIN departments b ON a.department = b.code;

-- 2.12 Sélectionnez le nom et le nom de famille des employés travaillant pour des ministères dont le budget est supérieur à 60 000 $.
SELECT Name, LastName FROM Employees WHERE Department IN (SELECT Code FROM Departments WHERE Budget > 60000);

-- 2.13 Sélectionnez les départements dont le budget est supérieur au budget moyen de l'ensemble des départements.
select *from departments where budget > (select avg(budget) from departments);

-- 2.14 Sélectionnez les noms des départements ayant plus de deux employés.
SELECT Name FROM Departments WHERE Code IN (SELECT Department FROM Employees GROUP BY Department HAVING COUNT(*) > 2);

-- 2.15 Très important - Sélectionnez le nom et le nom de famille des employés travaillant pour les ministères dont le budget est le deuxième plus bas.
SELECT name, lastname FROM employees WHERE department =(SELECT temp.code FROM (SELECT * FROM departments ORDER BY budget limit 2) temp ORDER BY temp.budget DESC limit 1)

-- 2.16 Ajoutez un nouveau service appelé "Quality assurance", avec un budget de 40 000 $ et le code de service 11. Et ajoutez un employé appelé "Mary Moore" dans ce département, avec le code SSN 847-21-9811.
insert into departments values(11, 'Quality Assurance', 40000);insert into employees values(847219811, 'Mary', 'Moore', 11);

-- 2.17 Réduire le budget de tous les départements de 10 %.
update departments set budget = 0.9 * budget;

-- 2.18 Réaffecter tous les employés du département de la recherche (code 77) au département informatique (code 14).
update employees set department = 14 where department = 77;

-- 2.19 Supprimer du tableau tous les employés du département informatique (code 14).
elete from employees where department = 14;

-- 2.20 Supprimer du tableau tous les employés qui travaillent dans des départements dont le budget est supérieur ou égal à 60 000 $.
elete from employees where department in (select code from departments where budget>=60000);

-- 2.21 Supprimer du tableau tous les employés.
delete from employees;
