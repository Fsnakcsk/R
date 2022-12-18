#-----------------------------------------
# plot() : 삼전도(scatter plot)
#-----------------------------------------
?plot

x <- 1:10
y <- x^2
plot(x, y, xlim=c(3, 9), ylim=c(20, 100))

# xlab, ylab : x와 y의 축 이름
# main : 차트 제목
# pch : 점의 종류, 숫자나 문자로 지정
# cex : 점의 크기
# col : 컬러, 색상
# xlim, ylim : x, y의 축의 값 범의


# 축이름과 그래프 제목
plot(x, y, xlab='x축 이름', ylab='y축 이름', main='차트제목',)


# 점의 종류
example(points)
?pch

# 점의 크기
x = rep(1:5, rep(5,5))
x
y = rep(5:1, 5)
y

plot(x, y, cex = 20, col='red')

# type : 그래프 유형 


# par(mfrow()) : 그래프 배열, 
par(mfrow = c(2, 3))
x = 1:10
y = x^2

# lty 라인 스타일 지정
# dotted 점
# dashed 끊힌 선
# dotdash
# longdash
# blank 아무것도 없음
# solid 곡선

plot(x, y, type='l', main='lines', lty='solid')
plot(x, y, type='h', main='histogram')
plot(x, y, type='n', main='no plotting')
plot(x, y, type='b', main='both(points and lines')
plot(x, y, type='s', main='소문자 s : stair steps')
plot(x, y, main='default:points')

par(mfrow = c(2, 3))
x = 1:10
y = x^2
plot(x, y, type = 'l', main = 'lines', lty = 'dotdash')
plot(x, y, type = 'l', main = 'lines', lty = 'longdash')
plot(x, y, type = 'l', main = 'lines', lty = 'dashed')
plot(x, y, type = 'l', main = 'lines', lty = 'dotted')
plot(x, y, type = 'l', main = 'lines', lty = 'blank')
plot(x, y, type = 'l', main = 'lines', lty = 'solid')

par(mfrow = c(2, 3))
x = 1:10
y = x^2
plot(x, y, type = 'h', main = 'lines', lty = 'dotdash')
plot(x, y, type = 'h', main = 'lines', lty = 'longdash')
plot(x, y, type = 'h', main = 'lines', lty = 'dashed')
plot(x, y, type = 'h', main = 'lines', lty = 'dotted')
plot(x, y, type = 'h', main = 'lines', lty = 'blank')
plot(x, y, type = 'h', main = 'lines', lty = 'solid')
#----------------------------------------------

# cars : 자동차의 속도와 제동거리의 관계
# layout() : 

m = matrix(c(1, 1, 2, 3), ncol=2, byrow=T)
m

layout(mat=m)
plot(cars, main='scatter plot of cars data')
hist(cars$speed, col='lightblue', border='white')
hist(cars$dist, col='darkgray', border='white')

hist(cars$dist, col='darkgray', border='white')




#-------------------------------------------
# points() : 점을 그리는 함수
# plot() 함수아레에 기존에 그려진 그래프에 점을 추가할 때

plot(iris$Sepal.Length, iris$Sepal.Width, 
     cex=0.5, pch=20,
     xlab='Length', ylab='Width', main='iris')

points(iris$Petal.Length, iris$Petal.Width, 
       cex=1, pch='0', col='red')

#-------------------------------------------

# lines() : 꺽은선 그래프를 그리는 함수
# plot() 함수와 함께 사용하여 꺽은선을 추가할 떄 사용
# 시계열 데이터 : 시간의 흐름을 측정한 데이터

x = seq(from=0, to=2*pi, by=0.1)
y = sin(x)

plot(x, y, type='n')
lines(x, y, lty=3) # lty = 3 : dotted점

#----------------------------------------------
# abline() : 직선을 그리는 함수
plot(x, y)

# lty = 'blank' == lty == 0
# lty = 'solid == 1 곡선
# lty = 'dashed == 2
# lty = 'dotted == 3
# lty = 'dotdash == 4
# lty = 'longdash == 5

abline(v=3, lty=2)
abline(h=0, lty=2)
abline(a=-1, b=1, col='red') 
# y = -1 + x

#---------------------------------------+
# curve() : 곡선
curve(expr=sin, from = 0, to=2*pi)

#----------------------------------------
# text(x좌표, y좌표, labels='표시할문자', adj = NULL)
# adj : 테스트의 위치 지정
# (0,0), 우측상단
# (0,1), 우측하단
# (1,0), 좌측상단
# (1,1), 좌측하단
test()
?text

plot(4:6, 4:6, type='n')
text(5,5, 'X')
text(10,10, 'right up', adj=c(0,0))
text(10,10, 'right bot', adj=c(0,1))
text(10,10, 'left up', adj=c(1,0))
text(10,10, 'left bot', adj=c(1,1))

#---------------------------------------
# polygon() : 다각형
# 신뢰구간 같은 범위 값을 표현할 떄 유용

data = seq(-pi, pi, length.out = 12)
x = cos(data)
y = sin(data)

plot(1:6, type='n', main='polygon', axes=F) # axes축을 없앤다
x1 = x+2
y2 = y + 4.5

polygon(x1,y2)
text(2,5.7, adj=0.5, 'gold')

#--------------------------------------

# lengnd(x좌표, y좌표, 표시할 범례(내용))
# left, right

#--------------------------------------

#boxplot()
boxplot(iris$Sepal.Width) # : 데이터의 분포를 그려주는 그래프

## 이상치(outlier) 값을 판단
## 이상치 : 정상범위를 벗어난 값
## 정상점위의 기준 : IQR(InterQuartile Range) * 1.5
## IQR : 3Q - 1Q
## 최대이상치 = 3Q + IQR * 1.5 에 벗어나면 이상치이다
## 최소이상치 = 1Q - IQR * 1.5 에 벗어나면 이상치이다


#boxplot 옴션
#boxplot()$stats : 기초통계값(min, 1Q, median, 3Q, max)
boxplot(iris$Sepal.Width)$stats


# $n : 통계량 (데이터의 개수)
boxplot(iris$Sepal.Width)$n


# $out : 이상점
boxplot(iris$Sepal.Width)$out

#-------------------------------------------------
# hist()
hist(iris$Sepal.Width)


# table() : 범주형 데이터를 건수로 나타남
table(iris$Sepal.Width) # 값마다에 대한 건수
#-------------------------------------------------

