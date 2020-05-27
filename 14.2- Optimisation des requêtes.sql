USE coureurs ;
show tables ;

SELECT * FROM coureur ;

SELECT co_nom, round(datediff(now(), co_naissance)/365, 0) as age, co_sexe
FROM coureur
WHERE co_sexe = 1
and datediff(now(), co_naissance) > 70;
# ==> on divise la population en deux, homme, femme et après on cherche les hommes de plus de 70 ans
# On part de 50 % 

SELECT co_nom, round(datediff(now(), co_naissance)/365, 0) as age, co_sexe
FROM coureur
WHERE datediff(now(), co_naissance) > 70
and co_sexe = 1
# ==> On recherche d'abord les plus de 70 ans et après les hommes de plus de 70 ans
# On part d'environ 20% de la population et ensuite la recherche est plus rapide : moins de données 