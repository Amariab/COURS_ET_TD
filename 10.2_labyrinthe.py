# Exploration récursive d'un labyrinthe
# Qui peut être répété un nombre indéfini de fois par l'application 
# de la même règle.

#Création de la fonction lire_labyrinthe
def lire_labyrinthe():
    # met en mémoire la labyrinthe et renvoie les coordonnées du point de départ
    global case, haut, larg
    fichier = open("dedale2.txt", "r")
    lignes = fichier.readlines() # la methode readlines lit une ligne à la fois
    fichier.close()
    haut = len(lignes) # visualisation du tablo
    larg = len(lignes[0])-1
    print(haut,"lignes",larg,"colonnes") # il y a tant de lignes et de colonnes
    case = [[0 for col in range(larg)] for row in range(haut)]
    for i in range(haut): # on recherche l'entrée E
        for j in range(larg):
            case[i][j]=lignes[i][j]
            if lignes[i][j]=='E':
                i0=i
                j0=j
                case[i0][j0]="E"
    return i0,j0

def imprimer_labyrinthe():
    global case, haut, larg
    for i in range(haut):
        for j in range(larg):
            print(case[i][j],end="")
        print()
    print()
    
def thesee(i,j):
    global case
    if case[i][j] == "S":
        imprimer_labyrinthe()
    elif case[i][j] == " " or case[i][j] == "E":
            case[i][j] = "."
            thesee(i,j+1)
            thesee(i,j-1)
            thesee(i+1,j)
            thesee(i-1,j)
            case[i][j] = " "
 

# programme principal
i0, j0 = lire_labyrinthe()
imprimer_labyrinthe()
print("Solution(s)")
thesee(i0, j0)
 
"""
# https://www.journaldunet.fr/web-tech/developpement/1202515-python-utiliser-
une-variable-globale-dans-une-fonction-au-sein-d-une-autre-fonction/

# variable globale : Ce sont des variables dont la portée s'étend à tout 
le programme. Elles peuvent être utilisées par n'importe quelle fonction, 
contrairement aux variables locales qui ne sont utilisables que dans la 
fonction dans laquelle elles sont déclarées."""

