

import os
import sys
from PyQt4.QtGui import *
     
# Creation d'une fenetre principale
app = QApplication(sys.argv)
w = QWidget()
w.setWindowTitle("PyQt") 

# Creation des bouttons
pressButton = QPushButton("1st button")
okButton = QPushButton("2nd button")
cancelButton = QPushButton("3rd button")

# Ajout des Widget de gauche a droite
hbox = QHBoxLayout(w)

# Une partie qui contiendra une serie de boutons
container_button = QWidget(w)

# Ajout des deux parties
hbox.addWidget(container_button)
#hbox.addWidget(part_right)
hbox.addStretch(1.0)

# La partie gauche contiendra des boutons ordonnes de haut en bas
vbox = QVBoxLayout(container_button)

# Ajout des boutons
vbox.addWidget(pressButton)
vbox.addWidget(okButton)
vbox.addWidget(cancelButton)

# Creation d'une image
label = QLabel(w)
pixmap = QPixmap('mon_image.jpg')
label.setPixmap(pixmap)
w.resize(pixmap.width(),pixmap.height())

# Ajout de l'image dans la partie droite
hbox.addWidget(label)

 
# Draw window
w.show()
app.exec_()