## R 자료구조 ##

# R에서 제공하는 자료형
# 수치형
# 문자형
# 논리형, 복소수형

# 자료구조 : 변수 => 
# 벡터(vector)
# 행렬(matrix)
# 데이터프레임(dataFrame)
# List 모든 자료형을 잠을 수 있음


# 변수활당 : 변수명 <- 값, 값->변수명, 변수명 = 값

# 팩터(factor) : 범주형 데이터(String)

# 서열형 데이터
# 명목형 데이터

# factor(벡터자료, levels, ordered(생략하면 명목형)) : 엑셀에서 가져 올떄 벡터로 바꿀 경우 많다.

# vactor : 값들의 집합, 1개 이상의 데이터를 담고 있는 자료구조
# 1차원 : 가변길이 배열, c()로 만든다, start:end, seq(from, to, by), rep(c())
# length()
# max()
# min()
# mean()
# range()최소값과 최대값, 
# ranke()
# sort()
# sd()

# 배열 : 행렬matrix  
# 2차원 배열
# 행(관측값)과 열(속성, 변수)로 이루어짐


# array(), matrix(), rbind(), cbind()

data()

# women : 
women

# 회귀분석 많이 쓰임 : 신장과 체중이 어떤 상관관계?

# cars : 상관 분석(속도 빠르면 제동거리, )
cars

# 데이터 구조 확인 함수
str(cars)

# iris : 회귀분석, 분료 : 품중이 무엇인지 분석
str(iris)

plot(women)
plot(cars, col='blue', xlab='속도', ylab='제동 거리', pch=18)

?plot

help(plot)

# 데이터의 내용확인 : head(), tail()  default 6개 출력
head(iris, 10)
tail(iris)
plot(iris)


plot(iris$Petal.Width, iris$Petal.Length, col=iris$Species)




