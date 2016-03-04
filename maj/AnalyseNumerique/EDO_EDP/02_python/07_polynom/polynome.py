import numpy as np
import scipy.linalg as la;
import matplotlib.pyplot as plt

P = [4,5,8,1]

c = la.companion(P)
eigenval,eigenvec=np.linalg.eig(c)

r = eigenval

print(eigenval)

x = []
y = []
for r1 in r:
	x.append(r1.real)
	y.append(r1.imag)	


plt.plot(x,y,'r.')
plt.axis("equal")
plt.show()

