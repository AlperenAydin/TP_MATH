from PIL import Image
import numpy as np

#Chargement de l'image
im = Image.open("mon_image.jpg")

#Convertion des donnees vers le format numpy.array
couleurs = np.array(im,dtype='float')

#Valeurs rouge,vert,bleu
r = couleurs[:,:,0]
g = couleurs[:,:,1]
b = couleurs[:,:,2]

#Taille de l'image
Nx,Ny = r.shape
print("Image de taille",Nx,"x",Ny)

#Modification des couleurs
g *= 0.9
b *= 0.6

#Parcours de l'ensemble des pixels de l'image
for kx in range(Nx):
    for ky in range(Ny):
        if pow(kx-100,2) + pow(ky-470,2) < pow(80,2):
            g[kx,ky] *= 0.6


#Construction d'un array [r,g,b]
couleurs_modifiees = np.dstack((r,g,b))

#Reconstruction du format d'image
# Necessite la conversion du type float vers uint8 (entier non signe stocke sur 1 octet)
im_final = Image.fromarray(np.array(couleurs_modifiees,dtype='uint8'))
im_final.show()


