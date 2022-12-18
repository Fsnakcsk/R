# 탐색적 데이터 분석을 위한 데이터 핸들링

## Base R에 내장된 데이터 셋의 목록을 확인하는 함수
data()
library(help=datasets)


## 데이터셋에 대한 도움말
?iris


## 구조확인
str(iris)


## iris 데이터셋의 내용을 데이터프레임 형태로 추출
View(iris)


## head(data, n), tail(data, n)
head(iris) # 기본적으로 6개의 행 추출
head(iris, 10)


# 내장데이터섯을 사용할 때
data(mtcars)
str(mtcars)
head(mtcars)


# apply 계열의 함수
# apply(벡터 or 팽렬 데이터셋, 방향, 함수), 방향 1(행) 2(열)
m <- matrix(1:9, nrow=3)
m

# 행단위의 합계 추출
apply(m, 1, sum)


m1 <- matrix(1:9, nrow=3, byrow=T) #행우선 요소를 채워라
m1

# 열단위의 평균
apply(m1, 2, mean)

# iris 데이터셋에 속성들의 컬럼들의 합을 계산 추출
names(iris)
head(iris)

# df[행index, 열index]
x <- apply(iris[ ,1:4], 2, sum) #벡터형으로 출력됨
class(x)


#rowSums(), rowMeans(), colSums(), colMeans()
colSums(iris[,-5])


f <- function(df, x){
  tot <- 0
  for(i in 1:nrow(df)){
    tot <- tot + df[i,]
  }
  tot
}

# lapply(벡터 or 리스트, 함수)
s <- lapply(1:3, function(x){x*2})
s
str(s)

# x 리스트의 첫번쨰 객체, 1차원 배열로 취급(단, 배열의 요소가 객체다)
s[1]

# 첫번째 객체의 요소
s[[1]]


# 리스트 객체에 이름이 부여되면 데이터프레임의 형태로 추출
y <- list(a=1:3, b=c('a','b','c','d','f'))
y$a
y$b
y$b[3]


# iris 에이터셋의 속성들의 평균을 추출 - lapply
xx <- lapply(iris[,1:4], mean)
xx

colMeans(iris[,-5]) #벡터로로

xx$Sepal.Length


#리스트타입을 데이터 프레임으로 반환하는 과정 
#step.1 리스트를 벡터로 변환하는 작업 : unlist()
aa <- unlist(xx)
aa
class(aa)

#setp.2 벡터로 변환된 것을 행렬로 변환
bb <- matrix(aa, ncol=4)
bb
class(bb)

#setp.3 행렬을 데이터프레임으로 변환하는 작업
cc <- as.data.frame(bb)
cc
class(cc)

#setp.4 생성된 데이터프레임에 열이름을 생성하는 작업
names(cc)
names(cc) <- c('Sepal.Length','Sepal.Width','Petal.Length', 'Petal.Width' )
cc

names(cc) <- names(iris[,1:4])
cc

# do.call(호출한 함수, 파라키터)
z <- as.data.frame(lapply(iris[,1:4], mean))
z
class(z)

zz <- list(aa=1:3, bb=c('a','b','c'), cc=c(TRUE, FALSE, TRUE))
zz
class(zz)

z <- as.data.frame(zz)
z

cc <- as.list((z))
cc


# sapply(벡터나 리스트, 함수) : 벡터로 반환
x <- sapply(iris[, 1:4], mean)
x
class(x)
as.data.frame(x)
x <- t(x)
x


sapply(iris, class)

# tapply(데이터, 색인, 함수) : 그룹별로 계산을 수행하는 함수
tapply(1:10, rep(1,10), sum)
1:10

tapply(1:10, 1:10 %% 2 == 1, sum)

m <- matrix(1:8, ncol=2, dimnames=list(c('spring','summer','fall','winter'),
                                       c('male','female')))
m

# 계절별 성별 데이터를 가지고
# 상반기(봄, 여름), 하반기(가을, 겨울)
tapply(m, list(c(1,1,2,2,1,1,2,2), c(1,1,1,1,2,2,2,2)), sum)


#subset(데이터프레임, 조건, 추출할 열)
# iris 데이터 Sepal.Length가 7보다 큰 데이터 추출
iris[iris$Sepal.Length > 7, ]
subset(iris, Sepal.Length > 7)

# Sepal.Length 7보다 크가 Petal.Length가 6.6보다 작거나 같은 데이터
iris[iris$Sepal.Length > 7 & iris$Petal.Length <= 6.6, ]
subset(iris, Sepal.Length > 7 & Petal.Length <= 6.6)


# subset 활용
str(subset(iris, Species == 'setosa'))
summary(subset(iris, Species == 'setosa'))

nrow(subset(iris, Species == 'setosa'))


# doBy : 턱정 값을 이용하여 추출하는 함수를 제공하는 패키지
install.packages("doBy")
library(doBy)
?doBy

# summaryBy(formula, data) : 특정 조건에 따라 요약을 하는 함수
summary(iris)

# 사위분서
quantile(iris$Sepal.Length)
summaryBy(Sepal.Width + Sepal.Length ~ Species, iris)

?summaryBy

summaryBy(Sepal.Width + Sepal.Length ~ Species, iris, FUN = median)


#---------------------------------------
## orderBy(formula, data)
## order(x, decreasing(오,내림), na.last=T마지막, F멘앞에) 정렬후 인덱스 출력
## sort(x, decreasing) 

x <- c(23,28,17,15,22, 30)
x
order(x, decreasing = T)
order(sort(x))


# 특정 컬럼을 기중으로 정렬을 수행
orderBy(~ Species + Sepal.Length, iris)
#         품정기준1      2

#--------------------------------------
# sample(data, n, replace=T(중복허용), F(중복불허))
sample(1:10)
sample(1:10, replace = T)

sample(1:10, 3)
sample(1:10, 20)
sample(1:10, 20, replace = T)

iris[sample(NROW(iris), NROW(iris)), ]


# sampleBy() : 확률에 따라 추출
sampleBy( ~ Species, frac = 0.1, data = iris)

#-------------------------------------------

# split(dataframe, 불리조건) !!!리스트로 반환됨
split(iris,iris$Species)
as.data.frame(split(iris,iris$Species))


#----------------------------------------
# with()
mean(iris$Sepal.Length)
mean(iris$Sepal.Width)

with(iris, {
  print(mean(Sepal.Length))
  print(mean(Sepal.Width))
})

# within()
x <- data.frame(val1 = c(1, 2, 3, 4, NA, 5, NA),
                val2 = c(1, NA, 2, 3, NA, 4, 5))
x

# 결측값 NA를 중앙값(median)으로 대체
x$val1 <- ifelse(is.na(x$val1), median(x$val1, na.rm = T), x$val1)
x$val2 <- ifelse(is.na(x$val2), mean(x$val2, na.rm = T), x$val2)
x

x <- within(x, {
  val1 <- ifelse(is.na(val1), median(val, na.rm=T), val1)
  val2 <- ifelse(is.na(val2), mean(val, na.rm=T), val2)
})
x


# Q iris 데이터셋 결측값을 중앙값으로 대체하는 작업
# 결측값이 있는 품중의 값을 이용하여 중앙값을 계산하고 그 값으로 대체
iris[1,1] <- NA
head(iris)

#1
median_species <- sapply(split(iris$Sepal.Length, iris$Species), median, na.rm=T)
median_species

#2
iris[1,1] <- median_species['setosa']
iris

#3
iris <- within(iris, {
  Sepal.Length <- ifelse(is.na(Sepal.Length), median_species[Species], Sepal.Length)
})
head(iris)


### .....
sapply(split(iris$Sepal.Length, iris$Species), median, na.rm=T)




x <- c(2,4,6,7,10)
x %% 2
x[x %% 2 == 0]

# which()
x[which(x %% 2 == 0)]

# which.max()
which.max(x)
x[which.max(x)]

# which.min()
which.min(x)
x[which.min(x)]


#-----------------------------------------------------
# aggregate(데이터, 그룹 조건, 함수)
# iris 품종별로 Sepal.Width의 평균을 추출
?aggregate
aggregate(Sepal.Width ~ Species, iris, mean)






