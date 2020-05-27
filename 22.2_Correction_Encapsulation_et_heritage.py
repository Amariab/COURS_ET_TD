# -*- coding: utf-8 -*-
"""
Created on Wed Apr  1 16:27:10 2020

@author: rafik
"""


"""
Modifier _get_naissance() de sort qu’il provoque un affichage dans la console avant de renvoyer la valeur.
L’appel au calcul de l’âge provoque-t-il un affichage supplémentaire ?
Pourquoi ?
"""

class formulaire:
    def __init__(self, nom, prenom, naissance):
        self.nom = str(nom).upper()
        self.prenom = str(prenom).upper()
        self.naissance = naissance
        
    def _set_naissance(self, naissance):
        na = str(naissance)
        if na.isnumeric():
            self._naissance = int(na)
        else:
            self._naissance = 1900
            
    def _get_naissance(self):
        print("valeur de naissance : "
             + str(self._naissance))
        return self._naissance
    
    naissance = property(_get_naissance, _set_naissance)
    
    
    def age(self):
        return 2020 - self._naissance
    def majeur(self):
        return self.age() >= 18
	
	
ad = formulaire('doe', 'Alice', '1991')
print(ad.age())
print(ad.naissance)

"""
On remarque l'affichage de notre ligne supplémentaire n'a lieu qu'une seul fois.
En effet, lorsque nous calculons l'âge avec la méthode age(),
on accéde directement à _naissance sans passer par l'alias naissance et donc sans invoquer _get_naissance.
"""

"""
Modifier _set_naissance() de sorte qu’il gère aussi le cas ou la date de naissance est donnée comme une liste.
"""

class formulaire:
    def __init__(self, nom, prenom, naissance):
        self.nom = str(nom).upper()
        self.prenom = str(prenom).upper()
        self.naissance = naissance
        
    def _set_naissance(self, naissance):
        if str(type(naissance)) == "<class 'list'>":
            naissance = "".join((str(s) for s in naissance))
        if (str(type(naissance)) == "<class 'str'>"
               and naissance.isnumeric()):
            naissance = int(naissance)
        if str(type(naissance)) == "<class 'int'>":
            self._naissance = naissance
            
    def _get_naissance(self):
        print("valeur de naissance : "
             + str(self._naissance))
        return self._naissance
    
    naissance = property(_get_naissance, _set_naissance)
    
    
    def age(self):
        return 2020 - self._naissance
    def majeur(self):
        return self.age() >= 18
	


ad = formulaire('doe', 'Alice', 1991)
print(ad.age())

ad = formulaire('doe', 'Alice', '1991')
print(ad.age())

ad = formulaire('doe', 'Alice', [1, 9, 9, 1])
print(ad.age())

ad = formulaire('doe', 'Alice', ["19", "91"])
print(ad.age())



"""
Utiliser des propriété similaire pour encapsuler le nom et le prénom.
"""

class formulaire:
    def __init__(self, nom, prenom, naissance):
        self.nom = nom
        self.prenom = prenom
        self.naissance = naissance
    
    def _set_nom(self, nom):
        self._nom = str(nom).upper()
        
    def _set_prenom(self, prenom):
        self._prenom = str(prenom).upper()
    
    def _set_naissance(self, naissance):
        self._naissance = 1900
        if str(type(naissance)) == "<class 'list'>":
            naissance = "".join((str(s) for s in naissance))
        if (str(type(naissance)) == "<class 'str'>"
               and naissance.isnumeric()):
            naissance = int(naissance)
        if str(type(naissance) == "<class 'int'>"):
            self._naissance = naissance
            
    def _get_nom(self):
        return self._nom
    
    def _get_prenom(self):
        return self._prenom
    
    def _get_naissance(self):
        print("valeur de naissance : "
             + str(self._naissance))
        return self._naissance
    
    nom = property(_get_nom, _set_nom)
    prenom = property(_get_nom, _set_nom)
    naissance = property(_get_naissance, _set_naissance)
    
    
    def age(self):
        return 2020 - self._naissance
    def majeur(self):
        return self.age() >= 18
	
	
ad = formulaire('doe', 'Alice', '1977')
print(ad.nom)
print(ad.prenom)

ad.nom = 'Chapeau'
ad.prenom = 'DePaille'
print(ad.nom)
print(ad.prenom)


"""
Créer une class data qui hérite du formulaire et possède un attribut supplémentaire id.
Une méthode doit permettre d’initialiser cette identifiant comme une combinaison de caractères 
pris dans chaque autre attribut.
"""

class data(formulaire):
    def __init__(self, nom, prenom, naissance):
        formulaire.__init__(self, nom, prenom, naissance)
    def buildID(self):
        self.id = self.nom[:2]
        self.id += self.prenom[:2]
        self.id += str(self.age())


jd = data('Doe', 'Jhon', 1999)
ad = data('Doe', 'Alice', 1991)

jd.buildID()
ad.buildID()
print(jd.id)
print(ad.id)

"""
Créer une class listeelectoral qui hérite de recensement
et possède une méthode renvoyant tout les formulaires présent dans les trois listes
et correspondants à des personnes majeurs.
"""

class formulaire:
    def __init__(self, nom, prenom, anneeNaissance):
        self.nom = nom.upper()
        self.prenom = prenom.upper()
        self.anneeNaissance = anneeNaissance
    def age(self):
        return 2020 - self.anneeNaissance
    def majeur(self):
        return self.age() >= 18
    def memeFamille(self, formulaire):
        return self.nom == formulaire.nom
    
    def equals(self, formulaire):
        return all([self.nom == formulaire.nom,
                   self.prenom == formulaire.prenom,
                   self.anneeNaissance == formulaire.anneeNaissance])
    def __str__(self):
        s = self.nom + ", " + self.prenom + ", "
        return s+ str(self.anneeNaissance)

class recensement:
    def __init__(self, l1, l2, l3):
        self.f2020 = l3
        self.f2019 = l2
        self.f2018 = l1
        
    def permanents(self):
        return [f for f in self.f2020 if
               f in self.f2019 and f in self.f2018]
    
class listeelectorale(recensement):
    def __init__(self, l1, l2, l3):
        recensement.__init__(self, l1, l2, l3)
        
    def inscrits(self):
        return [f for f in self.permanents() if
                f.majeur()]
		
		
jd = formulaire('Doe', 'John', 1987)
ad = formulaire('doe', 'Alice', 1996)
ma = formulaire('Mouhammed', 'Ali', 2004)
cc = formulaire('Coco', 'Chanel', 1883)

l = listeelectorale([jd, ad, cc],
                    [jd, ad, ma, cc], [ad, ma, cc])

for f in l.inscrits():
    print(f)
