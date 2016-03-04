import os
import numpy as np
import matplotlib.pyplot as plt

x=[]
y=[]

#lecture fichier csv
fid=open("fichier.csv")

#lecture de l'ensemble des lignes
for line in fid:
	p=line.split()
	if len(p)==2:
		x.append(p[0])
		y.append(p[1])

fid.close()

#affichage de la courbe
plt.plot(x,y)
plt.show()