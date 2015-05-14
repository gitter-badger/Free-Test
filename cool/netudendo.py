import matplotlib.pyplot as plt
import numpy as np
from numpy import linalg as la

#一次元の熱伝導方程式

L = 0.1 #長さ[m] 1cm範囲で区切っていく
M = 10 #分割数
dx = L/M #空間刻み[s]

dt = 1.0 #時間刻み
N = 100 #時間ステップ数

#熱伝導率A7075
#alpha = 130/(963*2.81) #k/(c*p) k:熱伝導率 c:比熱 p:密度

alpha = 80.2/(7874.0*440.0)
gamma = dt/dx**2

a = alpha*gamma

#初期条件(温度273.15K)
#T = numarray.array([[273.15,] for i in range(M+1)])
T = [273.15 for i in range(M+1)]

#境界条件
T[0] = 300.0 #温度固定
T[M] = T[M-1] #断熱
#T[0][0] = 300.0 #温度固定
#T[M][0] = T[M-1][0] #断熱

for j in range(1,N):
    for i in range(1,M):
        preT = T

        #陽解法による差分式
        T[i] = a*preT[i+1]+(1-2*a)*preT[i]+a*preT[i-1]
        T[0] = 300.0
        T[M] = T[M-1]
    print(j*dt,",",j*dx,",",T[i],T[M])

#行列の作成
#A = np.array([[0.for i in range(M+1)]for j in range(M+1)])

#for i in range(1,M):
#	A[i][i-1] = -a
#	A[i][i] = 1+2*a
#	A[i][i+1] = -a

#境界条件
#A[0][0] = 1. #一定の温度
#A[M][M] = 1. #断熱

#Aの逆行列
#A_inv = la.inv(A)

#for j in range(0,N):
#	preT = T

	#T = np.dot(A_inv,preT)
	#T[0][0] = 300.0
	#T[M][0] = T[M-1][0]

	#計算結果をファイルへ出力
	#print(j*dx,",",T[i][0])




