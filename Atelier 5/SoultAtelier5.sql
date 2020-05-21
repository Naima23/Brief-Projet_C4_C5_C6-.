En se basant sur le fichier sql shema et shema figure:
-- vous devez créer une base données, et imiter les requêtes dans le fichier sql shema.
Exprimer les requêtes suivantes en SQL :
-- 5.1 Sélectionnez le nom de toutes les pièces. 
SELECT Name FROM pieces

-- 5.2 Sélectionnez les données de tous les fournisseurs(providers). 
SELECT *FROM providers

-- 5.3 Obtenir le prix moyen de chaque pièce (ne montrer que le code de la pièce et le prix moyen).
SELECT Piece, AVG(Price) FROM provides GROUP BY Piece

-- 5.4 Obtenir les noms de tous les fournisseurs qui fournissent la pièce 1.
SELECT Name FROM providers where Code IN ( SELECT provider FROM provides WHERE Piece = 1 )

-- 5.5 Sélectionner le nom des pièces fournies par le fournisseur avec le code "HAL".
SELECT Name FROM pieces WHERE Code in ( SELECT Piece FROM provides WHERE provider = 'HAL') 

-- 5.6 Pour chaque pièce, trouvez l'offre la plus chère de cette pièce et indiquez le nom de la pièce, le nom du fournisseur et le prix 
-- (notez qu'il peut y avoir deux fournisseurs qui fournissent la même pièce au prix le plus élevé).
SELECT Pieces.Name, Providers.Name, Price FROM Pieces INNER JOIN Provides ON Pieces.Code = Piece INNER JOIN Providers ON Providers.Code = Provider WHERE Price = ( SELECT MAX(Price) FROM Provides WHERE Piece = Pieces.Code )

-- 5.7 Ajouter une entrée dans la base de données pour indiquer que "Skellington Supplies" (code "TNBC") fournira des pignons (code "1") pour 7 cents chacun.
INSERT INTO Provides 
  VALUES (1, 'TNBC', 7);

-- 5.8 Augmenter tous les prix d'un cent.
UPDATE Provides SET Price = Price + 1;

-- 5.9 Mettre à jour la base de données pour indiquer que "Susan Calvin 
Corp. (code "RBT") ne fournira pas de boulons (code 4).
DELETE FROM Provides
   WHERE Provider = 'RBT'
     AND Piece = 4;

-- 5.10 Mettre à jour la base de données pour refléter le fait que "Susan Calvin Corp. (code "RBT") ne fournira pas de boulons (code 4). 
DELETE FROM Provides WHERE Provider = 'RBT'
