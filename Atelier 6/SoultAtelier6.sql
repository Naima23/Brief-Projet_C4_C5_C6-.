En se basant sur le fichier sql shema et shema figure:
-- vous devez créer une base données, et imiter les requêtes dans le fichier sql shema.
Exprimer les requêtes suivantes en SQL :
-- 6.1 Listez les noms de tous les scientifiques, les noms de leurs projets, 
    -- et les heures travaillées par ce scientifique sur chaque projet, 
    -- dans l'ordre alphabétique du nom du projet, puis du nom du scientifique.
    SELECT scientists.Name, projects.Name,  projects.Hours  FROM  scientists INNER JOIN AssignedTo ON scientists.SSN = assignedto.Scientist
         INNER JOIN Projects  ON assignedto.Project = projects.Code
  ORDER BY projects.Name ASC, scientists.Name ASC;
-- 6.2 Sélectionnez les noms de projets qui ne sont pas encore attribués
SELECT Name 
FROM Projects
WHERE Code NOT In
(
SELECT Project 
         FROM AssignedTo
);
