import cv2
import numpy as np
from matplotlib import pyplot as plt

#Ouverture de l'image
img = cv2.imread("mon_image.jpg")
#Filtrage de l'image
blur = cv2.GaussianBlur(img,(25,25),0)
#Detection de contours
edges = cv2.Canny(blur,10,40,0)

#Affichage
plt.subplot(131)
plt.imshow(img)

plt.subplot(132)
plt.imshow(blur)

plt.subplot(133)
plt.imshow(edges,cmap="gray")

plt.show()