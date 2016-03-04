import os
import matplotlib as plt


nbr_ligne = []

for root, dirs, files in os.walk("/fs02/share/users/alperen.aydin/home/TP_info"):
	for name in files:
		path = os.path.join(root,name)
		if path.endswith(".c") or path.endswith(".cpp"):
			nbr_ligne.append(os.system("wc -l "+path))

print(nbr_ligne)
