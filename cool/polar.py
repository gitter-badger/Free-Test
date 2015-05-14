import numpy as np
import matplotlib.cm as cm
from matplotlib.pyplot import figure, show, rc


# force square figure and square axes looks better for polar, IMO
fig = figure(figsize=(8,8))
ax = fig.add_axes([0.1, 0.1, 0.8, 0.8], polar=True)

N = 6
#theta = np.arange(0.0, 2*np.pi, 2*np.pi/N)
#radii = 10*np.random.rand(N)
#width = np.pi/4*np.random.rand(N)

#風向
theta = (40, 60, 80, 90, 180, 270)

#風速(直径を決める)
radii = (30, 30, 30, 30, 30, 30)

#幅(ここで指定しないと縁になってしまう：)
#width = np.pi/4*np.random.rand(N)
width = np.pi/4*np.random.rand(N)


#-- ここでグラフに描画　 --#
bars = ax.bar(theta, radii, width=width, bottom=0.0)

#ここで順番に色をつけている
for r,bar in zip(radii, bars):
   bar.set_facecolor( cm.jet(r/10.))
   bar.set_alpha(0.5)

show()