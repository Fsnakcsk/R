
########## R의 자료구조 ##########
#----------------------------------------------------------

# vector()     1차원 type같아야함
# matrix()     2차원 type같아야함
# Array()      type같아야함

# data.frame() 데이터 분석할 떄 사용: 여러개의 vector로 이러어짐
#              type 다름이 허용

# list() :     가장 큰 자료형 : 위의 모든 자료형을 담을 수 있다.

# scalar(스칼라) : 크기만 가지고 있는 물리량, 1개 원소

#----------------------------------------------------------
# vector의 틀징 
# vector() :       크기와 방향, 2개 이상의 원소를 담아야함

# vector 생성함수 : 
# c(), 
# start:stop(콜론), 
# seq()

# vector 의 인덱스는 1부터시작
# 하나의 백터에는 하나의 자료형만 담는다
# 벡터연산에 주로 사용되는 내장함수

#----------- 예시 ----------- 
x <- c(1, 2, 3, 4)
x
x[2] + x[1].

# x의 정보 확인, 자료구조 확인
str(x)

# 이것도 벡터다, 1의 데이터라도 벡터다
x <- 10 
x

# (:)로 만들어 보기
1:7
7:1

# 문자열로 취급
y <- c(1, "hi", 2) 
str(y)
class(y)

# 빈 벡터 만들기
# 요소가 n개인 빈 벡터로 생성
vector(length = 5)

# c와 콜롬
c(1:5)

c(1, 2, 3, c(4:6))

# 비어 있는 벡터
y = c()
y = c(y, c(1:3))
y

# ---------- seq 시퀀스 -----------
# seq로 벡터만들기
# 시퀀스 : 순열
# seq(from=처음값, to=마지막값, by=증가값)
x = seq(from=1, to=5, by=1)
x

x = seq(1, 10, by=2)
x

z = seq(0, 1, by=0.1)
z

w = seq(0, 1, length.out = 12)
w

# ---------- rep ------------
# rep(백터, times=반복횟수)
x = rep(c(1:3), times=2) #123 123
x

# rep(벡터, each=개 별요소 반복)
y = rep(c(1:3), each=2)  #11 22 33
y


# --------- vector Index ---------
# 벡터 내 특정 요소 선택 : 백터명[인덱스]
x = 1:10
x[2] = 10

# 2번쨰 index 제외한 나머지 출력
x[-2] 

# 3번째 index 30을 대입
x[3] <- 30
x

# x의 요소중에 2~4까지 출력
x[2:4]

# --------- vacter append ---------
# append(원본벡터, 추가할 벡터, 추가할 위치) 
# 추가할위치 뒤에 추가

x <- c('A','B', 'C')
y <- c('D', 'E')
z <- append(x, y)
z

z <- append(x, y , 2) # 2번제 뒤에 추가 A,B,D,E,C
z


# ------ 벡터 연산 : 벡터화 연산------
# 벡터 : 같은 위치의 요소까리 연산을 수행함
x <- c(1:4)
y <- c(5:8)
z = x + y
z

# 차
z = x - y
z

# 곱
z = x * y
z

# -- 길이가 2배인 경우 --
# 1 2 3 4 
# 5 6(5 6)
x <- c(1, 2, 3, 4) # 1 2 3 4 
y <- c(5, 6)       # 5 6 5 6
z = x + y
z

# -- 길이가 배수 아닌 경우 --
x <- c(1, 2, 3, 4)
y <- c(4, 5, 6)
z = x + y
z

x <- c(1, 2, 3, 4, 5)
y <- c(4, 5, 6)
z = x + y
z

# ----- 벡터와 숫자 연산 -----
# 벡터의 각각의 요소와 숫자 연산하게 됨

# 연산
x = c(1:4)
z = x * 2
z

# 비교
x = 1:10
x > 5

# all : 모두
all(x>5)

# any : 어느거 하나라도
any(x>5)



x = 1:20
# head()
head(x)

# tail()
tail(x)

head(x,10)
tail(x,10)

# ------ 집합-------
x = c(1, 2, 3)
y = c(3, 4, 5)
z = c(3, 1, 2)

# 합집합(union)
union(x, y)


# 교집합(intersect)
intersect(x, y)

# 차집합(setdiff)
setdiff(x, y)

# 비교(setequal) 
setequal(x, y)


# 베이스 R이 제공하는 기본 데이터 목록을 확인하는 명령
data()
help(iris)

head(iris)
tail(iris)

# rlch 통계량
summary(iris)

# 데이터 정보
str(iris)

View(iris)

View(ChickWeight)
View(cars)


# 벡터
val <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
val 
summary(val) # 기초 통계량

# 정규분포
xy = rnorm(30)
xy

# 원소의 개수
length(val)
# 평균구하는 함수 eman
mean(val)  

# 분산 val()
var(val)

# 표준 편찬찬 sd()
sd(val)

# 범위를 나타나는 함수
range(val)

#------------
# sin()
sin(val)

# cos()
cos(val)

# tan()
tan(val)
#------------

# abs()
abs(val)

# round()
round(val)

# 데이터 유형 : mode()
xx = c(0.2, -1, 2, -0.5)
xx 
mode(xx) #type 확인
class(xx)

# 최대값
yy = 1:9
max(yy)

# 개수
length(yy)

median(yy) #가운데

xx = 1:10
length(xx)
median(xx)

#더하기 
sum(xx)

# NULL, NA, NaN
sqrt(-3) #오류

x = c(1, 3, NA, 20, 7, NA)
x
mean(x) # NA 있어서 평균 못 구함

mean(x, na.rm = T)

grade = c('하하', '중하', '중', '중상', '상상')
oo = factor(grade, levels=c('하하', '중하', '중', '중상', '상상'), ordered=T)
oo



x = array(1:27, dim=c(3, 3, 3),
          dimnames=list(c('행1', '행2', '행3'),c('열1', '열2', '열3'),c('면1', '면2', '면3'))) # 3행, 3열을 3개 만들어
x

x = c(10, 20, 30, 10, 20)

y = factor(x, levels=c(30, 20, 10),ordered=T)
y





















