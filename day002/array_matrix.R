
# array() : N차원 배열
x = array(1:20, dim = c(4,5))
x



# matrix() : 2차원 배열
y = matrix(1:20, 4,5)
y

#         data 4행 5열
z = matrix(2,  4,  5)
z


# Q 2행 4행의 모든 요소를 추출
y[c(2,4), ]
y[1:2,]


z = matrix(c(1, 2, 3, 4, 5, 6), nrow=2, ncol=3, byrow=T)
z

# 출력 - 배열명[행, 열]
z[2,3]

x = 1:4
y = 5:8

# 행열 결합
cbind(x,y)
rbind(x,y)

a = matrix(0, 4, 5)
a

cbind(a, 1:4)
c

A = matrix(1:20, 4,5)
B = matrix(1:20, 4,5)
C = cbind(A, B)
C

# 행렬의 연산 : 백터화연산
A + B
A - B
A * B
A / B

A %*% B

matrix(1:20, 4, 5) + matrix(1:10, 2, 5)
A
A[1,2]
B = t(A) # 전치행렬
B[1,2]

# 행렬곱 : %*%
A
nrow(A) # 행의 개수 nclo()- 열의 개수

colnames(A) = c('alpha','beta', 'gamma', 'delta', 'etc')
rownames(A) = c('a', 'b', 'c', 'b')
A



