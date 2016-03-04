import numpy as np
import scipy.linalg as la
import matplotlib.pyplot as plt

N=100
t=np.linspace(0,2*np.pi,N)

plt.plot(np.cos(t),np.sin(t))
plt.plot(np.cos(t),np.sin(t),'r.')
plt.axis('equal')
plt.show()
