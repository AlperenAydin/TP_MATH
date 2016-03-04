
#From https://pythonspot.com/pyqt4/

import sys
from PyQt4.QtGui import *

 
# Create an PyQT4 application object.
a = QApplication(sys.argv)       
 
# The QWidget widget is the base class of all user interface objects in PyQt4.
w = QMainWindow()
 
# Set window size. 
w.resize(320, 240)
 
# Set window title  
w.setWindowTitle("Hello World!") 
 
# Create main menu
mainMenu = w.menuBar()
mainMenu.setNativeMenuBar(False)
fileMenu = mainMenu.addMenu('&File') #le & indique le raccourci clavier
 
# Add exit button
exitButton = QAction(QIcon('exit24.png'), 'Exit', w)
exitButton.setShortcut('Ctrl+Q')
exitButton.setStatusTip('Exit application')
exitButton.triggered.connect(w.close)
fileMenu.addAction(exitButton)
 
 
# Show window
w.show() 
 
sys.exit(a.exec_())