# 활당 : = 데입, 활당
a = 2
print(a)

# == : 논리 연산자
a == 2
a != 2

b = c(1, 2, 3, 4, 5)
mode(b)

# seq(from=, to=, by=증가치)
x = seq(1, 10, 1)
x

x1 = seq(1, 10, by=2)
x1

x2 = seq(10, -1, length=20)
x2

# start:end
x3 = 1:10
x3

x4 = 10:-1
x4

# -------------------
# rep(반복할 값, 반복횟수) times, each, length.out
# 1을 10번 반복
y1 = rep(1, 10)
y1

#
y2 = rep(c(1, 10), 2)
y2

y3 = rep(c(1, 10), each=2)
y3

y4 = rep(c(1:10), itmes=5) #???
y4

x <- c(1, 2.5, 3.2) # double
x

y <- c(1L, 2L, 3L)  # integer
y

z <- c('KTX', 'SRT', 'BUS') # String
z

w <- c(TRUE, FALSE, FALSE, TRUE) # logical
w

# indexing[]
x[3]
x[c(1, 3)]

# names : 객체의 이름을 알아내거나 이름을 부여
fruit <- c(5,3,2)
names(fruit) <- c('apple', 'orangr', 'peach')
fruit

fruit[('apple,','peach')]


# setNames : 객체에 이름을 부여할 때 사용하는 함수
fruit <- setNames(c(5, 3, 2), c('apple', 'orangr', 'peach'))
fruit


# str() : 데이터의 구조, 자료형, 크기
# typdof() or mode() : 단순히 자료형을 알아내는 함수
typeof(x)

# is.datatype
is.double(x)
is.integer(x)
is.character(x)

# as.dataype : Type 바꿈
mode(y)
as.double(y)
mode(y)

typeof(y)
is.numeric(y)
is.integer(y)

typeof(w)
mode(w)
class(w)


# logical => numerirc()로
as.numeric((w))

# 길이
length(x)

# typeof() : 벡터를 구성하고 있는 요소의 타입을 알려주는 함수
# is.double() : 실수인지 놀리값으로 알려주는 함수
# as.double() : 실수로 변환

# is.numeric() : 숫자 벡터인지 확인
# as.numeric() : 숫자 벡터로 변환

# length() : 벡터의 길이를 반환


xx = c(1, 2, 3)
xy = c(1L,2L,3L)

typeof(xx)
typeof(xy)

xx = as.integer(xx)

# 새로운 벡터를 생성하는 함수할떄 주로 사용하는 함수c()
a = c(1, 2, 3)
b = c(5, 6)
x = c(a, 4, b)
x


# 벡터의 인덱스 범위를 벗어나는 위치에 값을 할당하면 빈자리는
# 결측치 처리
a[7] = 2
a

# append() : 기존의 벡터에 새로운 값 추가, 새로운 벡터 생성
append(x, 99, after=3) # after= : 3번째 요소 뒤에서 삽입
append(x, -99L, after=0)


x = seq(from=0, to=1, by=0.1)
y = seq(from=0, to=1, length=11)
z = 1:10
x
y
z

5:-5

# 한줄로만 작성할때 ; 로 구분
x = 1:3;
y=c(2,2,2)
x+y
x-y
x*y
x/y
x^y

z = rep(2, 5)
x + z # 1 2 3 1 2 + 2 2 2 2 2 


# 벡터와 스칼라 연산
y=c(2,2,2)
y - 3
y - rep(3, length(y)) # y-3 와 같다

#
x = 1:10
z = rep(5, 10)
sum(z)

z = x <= 5
sum(z)

x != 5

(x > 5) & (y < 2) # and연산
(x > 5) | (y < 2) # or 연산

# R은 다양한 수학/통계 함수를 제공한다.
# rnorm() : 정규분포를 따르는 난수를 발생시키는 함수
?rnorm
x = rnorm(10)
x



max(x)
min(x)
prod(x) # 모든 요소의 곱
mean(x) # 형균
median(x)


# 범위 : 최대값과 최소값 같이 출력력
range(x)


# 사분위수
quantile(x)
quantile(x, probs = c(0.2, 0.7)) #20%값 70%값값


# 분산 : 평균에서 어느정도 떨어졌는지 확인
var(x) 

# 표준 편찬
sd(x)

# 공분산
x
y
cov(x, y) # 공분산
cor(x, y) # 상관계수****


# 정렬
sort(x)
x[order(x)] # sort(x)


# 누적합
cumsum(x)


# 누적곱
cumprod(x)

# 누적 최대값
cummax(x)

# 누적 최소값
cummin(x)


# 성분별 최대값 **
pmax(x, y, z)

# 성분별 최소값 **
pmin(x, y, z)


#-----------------------------------------------------

# 결측값 NA 
x = c(1, 2, 3, NA, 5)
is.na(x)          # 결측값 있는지 확인 
sum(x, na.rm = T) # 결측값 제외 처리



# 인덱싱
x = -10:10
x
x[3]
x[1:3]
x[c(1,3,5)]
x[-1]
x[-c(1, 3, 5)]

y = x[x<0]
y
# 혹은
# 보간법 : 결측값을 다른 값으로 대체하는 방법
x = c(1, 2, 3, NA, 5)
x

# 결측값을 제외하고 추출
x[!is.na(x)] # FALSE 반대 TURE로 변환 모든 출력
x[is.na(x)] = 4
x














