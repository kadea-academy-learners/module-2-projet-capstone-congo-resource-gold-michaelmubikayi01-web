--1
SELECT 
    s.nom AS nom_site, 
    COUNT(e.id_engin) AS nombre_engins
FROM sites s
LEFT JOIN engins e ON s.id_site = e.id_site
GROUP BY s.id_site, s.nom;

--2
SELECT 
    p.date_prod, 
    s.nom AS nom_site, 
    p.tonnage_brut
FROM 
    production p
JOIN 
    sites s ON p.id_site = s.id_site
WHERE 
    p.tonnage_brut = 0;
--3
	SELECT 
    e.id_engin, 
    e.type AS type_engin, 
    s.nom AS nom_site
FROM 
    engins e
JOIN 
    sites s ON e.id_site = s.id_site;

--4
SELECT 
    s.province, 
    p.type_minerai, 
    SUM(p.tonnage_brut) AS production_totale
FROM 
    production p
JOIN 
    sites s ON p.id_site = s.id_site
GROUP BY 
    s.province, 
    p.type_minerai
ORDER BY 
    s.province, 
    production_totale DESC;
--5
SELECT 
    p.date_prod,
    s.nom AS nom_site,
    p.type_minerai,
    p.tonnage_brut,
    p.teneur,
    (p.tonnage_brut * (p.teneur / 100)) AS contenu_fin
FROM 
    production p
JOIN 
    sites s ON p.id_site = s.id_site;
--6
SELECT 
    s.nom AS nom_site, 
    AVG(p.teneur) AS teneur_moyenne
FROM 
    production p
JOIN 
    sites s ON p.id_site = s.id_site
GROUP BY 
    s.nom
HAVING 
    AVG(p.teneur) < 2.5
ORDER BY 
    teneur_moyenne ASC;
